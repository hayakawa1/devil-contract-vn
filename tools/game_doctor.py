#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
ゲーム用アセット/シナリオの整合性チェック。

使い方:
  python tools/game_doctor.py
"""

from __future__ import annotations

import json
import re
import sys
from dataclasses import dataclass
from pathlib import Path
from typing import Any, Dict, Iterable, List, Optional, Set, Tuple


REPO_ROOT = Path(__file__).resolve().parents[1]
GAME_PUBLIC = REPO_ROOT / "game" / "public"
ASSETS_DIR = GAME_PUBLIC / "assets"
SCENARIOS_DIR = GAME_PUBLIC / "scenarios"


@dataclass(frozen=True)
class Issue:
    kind: str
    message: str


ALIASES: Dict[str, str] = {
    "neutral": "neutral",
    "serious": "neutral",
    "cold": "neutral",
    "analyzing": "neutral",
    "curious": "surprised",
    "surprised": "surprised",
    "angry": "angry",
    "fighting": "angry",
    "determined": "angry",
    "crying": "crying",
    "sad": "sad",
    "vulnerable": "sad",
    "hurt": "sad",
    "guilty": "sad",
    "worried": "sad",
    "flustered": "flustered",
    "shy": "flustered",
    "embarrassed": "flustered",
    "smile": "smile",
    "excited": "smile",
    "pleased": "smile",
    "proud": "smile",
    "hopeful": "smile",
    "posing": "smile",
}


def read_json(path: Path) -> Any:
    return json.loads(path.read_text(encoding="utf-8"))


def stage_prefix(stage_id: Optional[str]) -> str:
    sid = (stage_id or "").strip()
    if sid in {"stage0", "neutral", ""}:
        return "neutral"
    if re.fullmatch(r"stage[1-4]", sid):
        return sid
    return "neutral"


def resolve_character_image(
    image_id: str, *, stage_id: Optional[str], stageable_characters: Set[str]
) -> str:
    parts = image_id.split("_")
    if len(parts) != 2:
        return image_id

    character_id, second = parts
    if second == "neutral" or re.fullmatch(r"stage[1-4]", second):
        return image_id
    if character_id not in stageable_characters:
        return image_id

    sp = stage_prefix(stage_id)
    expr = ALIASES.get(second.lower(), second.lower())
    if expr == "neutral":
        return f"{character_id}_{sp}"
    return f"{character_id}_{sp}_{expr}"


def iter_scenario_commands(data: Dict[str, Any]) -> Iterable[Tuple[str, int, Dict[str, Any]]]:
    for scenario_name, commands in data.items():
        if not isinstance(commands, list):
            continue
        for i, cmd in enumerate(commands):
            if isinstance(cmd, dict):
                yield scenario_name, i, cmd


def main() -> int:
    issues: List[Issue] = []

    # Basic structure
    for required in [GAME_PUBLIC, ASSETS_DIR, SCENARIOS_DIR]:
        if not required.exists():
            issues.append(Issue("missing", f"Missing directory: {required}"))

    episodes_path = ASSETS_DIR / "episodes.json"
    characters_path = ASSETS_DIR / "characters.json"
    if not episodes_path.exists():
        issues.append(Issue("missing", f"Missing file: {episodes_path}"))
        episodes: List[Dict[str, Any]] = []
    else:
        try:
            episodes = read_json(episodes_path).get("episodes", [])
        except Exception as e:
            issues.append(Issue("invalid_json", f"Invalid JSON: {episodes_path} ({e})"))
            episodes = []

    if not characters_path.exists():
        issues.append(Issue("missing", f"Missing file: {characters_path}"))
        characters: Dict[str, Any] = {}
    else:
        try:
            characters = read_json(characters_path)
        except Exception as e:
            issues.append(Issue("invalid_json", f"Invalid JSON: {characters_path} ({e})"))
            characters = {}

    # Episodes -> scenario files
    stage_by_scenario: Dict[str, Optional[str]] = {}
    for ep in episodes:
        scenario_name = ep.get("scenario")
        if isinstance(scenario_name, str) and scenario_name:
            stage_by_scenario[scenario_name] = ep.get("stage")
            scenario_file = SCENARIOS_DIR / f"{scenario_name}.json"
            if not scenario_file.exists():
                issues.append(
                    Issue(
                        "missing_scenario",
                        f"episodes.json references missing scenario: {scenario_name} -> {scenario_file}",
                    )
                )

    # Stageable characters
    stageable: Set[str] = set()
    for cid, c in (characters.get("characters") or {}).items():
        sprites = (c or {}).get("sprites") or {}
        if any(sprites.get(k) for k in ("stage1", "stage2", "stage3", "stage4")):
            stageable.add(cid)

    # characters.json sprite references
    for cid, c in (characters.get("characters") or {}).items():
        sprites = (c or {}).get("sprites") or {}
        if not isinstance(sprites, dict):
            continue
        for key, sprite_id in sprites.items():
            if not isinstance(sprite_id, str) or not sprite_id:
                continue
            sprite_path = ASSETS_DIR / "characters" / f"{sprite_id}.png"
            if not sprite_path.exists():
                issues.append(
                    Issue(
                        "missing_sprite",
                        f"characters.json missing sprite: {cid}.{key} -> {sprite_path.name}",
                    )
                )

    # Scenario JSON + asset references
    for scenario_file in sorted(SCENARIOS_DIR.glob("*.json")):
        try:
            data = read_json(scenario_file)
        except Exception as e:
            issues.append(Issue("invalid_json", f"Invalid JSON: {scenario_file} ({e})"))
            continue

        if not isinstance(data, dict) or not data:
            issues.append(Issue("invalid_shape", f"Unexpected JSON shape: {scenario_file}"))
            continue

        for scenario_name, i, cmd in iter_scenario_commands(data):
            t = cmd.get("type")
            if t == "bg":
                image = cmd.get("image")
                if isinstance(image, str) and image:
                    p = ASSETS_DIR / "backgrounds" / f"{image}.png"
                    if not p.exists():
                        issues.append(
                            Issue(
                                "missing_bg",
                                f"{scenario_file.name}:{scenario_name}[{i}] bg '{image}' -> {p.name}",
                            )
                        )
            elif t == "bgm":
                file = cmd.get("file")
                if isinstance(file, str) and file:
                    p = ASSETS_DIR / "bgm" / file
                    if not p.exists():
                        issues.append(
                            Issue(
                                "missing_bgm",
                                f"{scenario_file.name}:{scenario_name}[{i}] bgm '{file}' -> {p.name}",
                            )
                        )
            elif t == "se":
                file = cmd.get("file")
                if isinstance(file, str) and file:
                    p = ASSETS_DIR / "se" / file
                    if not p.exists():
                        issues.append(
                            Issue(
                                "missing_se",
                                f"{scenario_file.name}:{scenario_name}[{i}] se '{file}' -> {p.name}",
                            )
                        )
            elif t == "char":
                image_id = cmd.get("image")
                if not isinstance(image_id, str) or not image_id:
                    continue

                direct = ASSETS_DIR / "characters" / f"{image_id}.png"
                if direct.exists():
                    continue

                resolved = resolve_character_image(
                    image_id,
                    stage_id=stage_by_scenario.get(scenario_name),
                    stageable_characters=stageable,
                )
                p = ASSETS_DIR / "characters" / f"{resolved}.png"
                if not p.exists():
                    issues.append(
                        Issue(
                            "missing_char",
                            f"{scenario_file.name}:{scenario_name}[{i}] char '{image_id}' -> '{resolved}' (missing)",
                        )
                    )

    # Report
    if not issues:
        print("OK: game/public の整合性チェックに問題は見つかりませんでした。")
        print("注意: ブラウザで動かす場合は file:// ではなく HTTP サーバ経由で開いてください。")
        print("      例: tools/run_game.ps1")
        return 0

    print("NG: 問題が見つかりました。")
    grouped: Dict[str, List[Issue]] = {}
    for issue in issues:
        grouped.setdefault(issue.kind, []).append(issue)

    for kind in sorted(grouped.keys()):
        print(f"\n[{kind}] {len(grouped[kind])}")
        for issue in grouped[kind][:50]:
            print("-", issue.message)
        if len(grouped[kind]) > 50:
            print(f"... and {len(grouped[kind]) - 50} more")

    return 1


if __name__ == "__main__":
    raise SystemExit(main())

