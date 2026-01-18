#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Rebuild .ks scenario files from source scripts in 共通/ and ルート/.
Focus: keep content/speaker/background/BGM aligned with the manuscripts.
"""

from __future__ import annotations

import re
from pathlib import Path
from typing import Dict, List, Optional, Tuple

ROOT = Path(__file__).resolve().parents[1]
COMMON_DIR = ROOT / "共通"
ROUTES_DIR = ROOT / "ルート"
SCENARIOS_DIR = ROOT / "game" / "public" / "scenarios"
CHAR_DIR = ROOT / "game" / "public" / "assets" / "characters"
BG_DIR = ROOT / "game" / "public" / "assets" / "backgrounds"
BGM_DIR = ROOT / "game" / "public" / "assets" / "bgm"
SE_DIR = ROOT / "game" / "public" / "assets" / "se"


COMMON_OUTPUT = {
    "00_プロローグ.txt": "prologue.ks",
    "01_契約の夜.txt": "episode01.ks",
    "02_地獄の朝.txt": "episode02.ks",
    "03_同好会結成.txt": "episode03.ks",
}

ROUTE_ID_MAP = {
    "幼なじみ": "osananajimi",
    "生徒会": "seitokai",
    "ギャル": "gyaru",
    "オタク": "otaku",
    "格闘技部": "kakutogi",
    "不良": "furyo",
    "友達の妹": "imouto",
    "ハーレム": "harem",
}

SPEAKER_MAP = {
    "主人公": "protagonist",
    "幼なじみ": "osananajimi",
    "生徒会": "seitokai",
    "生徒会長": "seitokai",
    "会長": "seitokai",
    "ギャル": "gyaru",
    "オタク": "otaku",
    "格闘技部": "kakutogi",
    "不良": "furyo",
    "友達の妹": "imouto",
    "妹": "imouto",
    "悪魔": "akuma",
    "母": "mother",
    "母親": "mother",
    "親友": "friend",
    "教頭": "kyoutou",
    "理事長": "rijichou",
    "顧問": "komon",
}

POS_ALIASES = {
    "left": "left",
    "right": "right",
    "center": "center",
    "center_left": "left",
    "center_right": "right",
    "center_far": "center",
    "left_far": "left",
    "right_far": "right",
}

EXPR_ALIASES = {
    "neutral": "neutral",
    "default": "neutral",
    "serious": "neutral",
    "angry": "angry",
    "fighting": "angry",
    "determined": "angry",
    "sad": "sad",
    "crying": "crying",
    "vulnerable": "sad",
    "injured": "sad",
    "hurt": "sad",
    "smile": "smile",
    "happy": "smile",
    "peaceful": "smile",
    "proud": "smile",
    "amused": "smile",
    "mocking": "smile",
    "sympathetic_fake": "smile",
    "surprised": "surprised",
    "shocked": "surprised",
    "flustered": "flustered",
    "blush": "blush",
    "embarrassed": "flustered",
    "anxious": "sad",
    "distant": "neutral",
    "obsessed": "angry",
    "focused_on_screen": "neutral",
    "tired": "sad",
    "exhausted": "sad",
    "breaking": "sad",
    "trembling": "sad",
    "numb": "neutral",
    "quiet": "neutral",
    "observing": "neutral",
    "night_lighting": "neutral",
    "lab_coat": "neutral",
    "no_makeup": "neutral",
    "hollow_smile": "smile",
    "perfect_fake_smile": "smile",
}

BG_FALLBACKS = {
    "教室": "classroom.png",
    "廊下": "hallway.png",
    "生徒会": "student_council_room.png",
    "体育館": "gym.png",
    "リング": "gym.png",
    "道場": "dojo.png",
    "公園": "park.png",
    "屋上": "rooftop.png",
    "電車": "train_interior.png",
    "駅": "station.png",
    "理科準備室": "science_prep_room.png",
    "理科室": "science_room.png",
    "研究室": "science_room.png",
    "校門": "school_gate.png",
    "校舎": "school_gate.png",
    "自宅": "protagonist_home.png",
    "住宅街": "street_evening.png",
    "夕": "street_evening.png",
    "夜": "protagonist_room_night.png",
    "朝": "school_gate.png",
    "幼なじみの部屋": "childhood_friend_home.png",
    "部屋": "protagonist_room.png",
    "apartment_bathroom": "protagonist_home.png",
    "apartment_bedroom": "protagonist_room_night.png",
    "apartment_luxury": "protagonist_home.png",
    "bedroom_night": "protagonist_room_night.png",
    "classroom": "classroom.png",
    "council_room_night": "student_council_room_night.png",
    "council_room": "student_council_room.png",
    "courtyard": "school_gate.png",
    "dojo_night": "dojo_night.png",
    "dojo_moonlight": "dojo_night.png",
    "family_restaurant": "family_restaurant_night.png",
    "gym": "gym.png",
    "hallway": "hallway.png",
    "living_room": "protagonist_home.png",
    "otaku_room": "otaku_room_night.png",
    "park_night": "park_night.png",
    "park_evening": "park_evening.png",
    "park": "park.png",
    "photo_studio": "club_room.png",
    "principal_office": "principal_office.png",
    "protagonist_room_night": "protagonist_room_night.png",
    "protagonist_room": "protagonist_room.png",
    "residential_area": "street_night.png",
    "residential_street": "street_evening.png",
    "rooftop_night": "rooftop_night.png",
    "rooftop": "rooftop.png",
    "school_exterior_night": "school_night.png",
    "school_gate": "school_gate.png",
    "school_hallway": "hallway.png",
    "school_path": "school_gate.png",
    "school_rooftop_night": "rooftop_night.png",
    "school_rooftop": "rooftop.png",
    "school_morning": "school_gate.png",
    "school_sunset": "school_gate.png",
    "science_lab": "science_room.png",
    "science_prep_room": "science_prep_room.png",
    "small_park": "park_night.png",
    "staff_room": "staff_room.png",
    "train_platform": "station.png",
    "tv_studio": "club_room.png",
    "white": "black.png",
}

BGM_FALLBACKS = {
    "devil": "bgm_devil.mp3",
    "悪魔": "bgm_devil.mp3",
    "tension": "bgm_tension.mp3",
    "緊張": "bgm_tension.mp3",
    "battle": "bgm_fight.mp3",
    "fight": "bgm_fight.mp3",
    "victory": "bgm_fight.mp3",
    "fanfare": "bgm_fight.mp3",
    "romance": "bgm_romance.mp3",
    "love": "bgm_romance.mp3",
    "gentle": "bgm_romance.mp3",
    "warmth": "bgm_romance.mp3",
    "sad": "bgm_sadness.mp3",
    "melancholy": "bgm_sadness.mp3",
    "涙": "bgm_sadness.mp3",
    "不安": "bgm_sadness.mp3",
    "silence": "bgm_sadness.mp3",
    "despair": "bgm_despair.mp3",
    "絶望": "bgm_despair.mp3",
    "isolation": "bgm_isolation.mp3",
    "孤独": "bgm_isolation.mp3",
    "truth": "bgm_truth.mp3",
    "真実": "bgm_truth.mp3",
    "ending": "bgm_ending.mp3",
    "エンディング": "bgm_ending.mp3",
    "emotional": "bgm_romance.mp3",
    "gentle": "bgm_romance.mp3",
    "confession": "bgm_romance.mp3",
    "happy": "bgm_romance.mp3",
    "warm": "bgm_romance.mp3",
    "bittersweet": "bgm_sadness.mp3",
    "lonely": "bgm_isolation.mp3",
    "loneliness": "bgm_isolation.mp3",
    "emptiness": "bgm_isolation.mp3",
    "solitude": "bgm_isolation.mp3",
    "anxiety": "bgm_tension.mp3",
    "unease": "bgm_tension.mp3",
    "dread": "bgm_tension.mp3",
    "ominous": "bgm_tension.mp3",
    "fear": "bgm_tension.mp3",
    "horror": "bgm_tension.mp3",
    "panic": "bgm_tension.mp3",
    "training": "bgm_fight.mp3",
    "determination": "bgm_fight.mp3",
    "resolve": "bgm_fight.mp3",
    "confrontation": "bgm_fight.mp3",
    "breakdown": "bgm_despair.mp3",
    "reveal": "bgm_truth.mp3",
    "secret": "bgm_truth.mp3",
    "daily": "bgm_daily.mp3",
    "morning": "bgm_daily.mp3",
    "dawn": "bgm_daily.mp3",
    "evening": "bgm_daily.mp3",
    "night": "bgm_isolation.mp3",
    "wind": "bgm_isolation.mp3",
    "日常": "bgm_daily.mp3",
    "朝": "bgm_daily.mp3",
    "夕": "bgm_daily.mp3",
    "夜": "bgm_isolation.mp3",
    "感動": "bgm_romance.mp3",
    "優しい": "bgm_romance.mp3",
}


def normalize_key(text: str) -> str:
    text = text.strip()
    text = text.replace("（", "(").replace("）", ")")
    text = re.sub(r"\s+", "", text)
    text = text.replace("・", "")
    return text


def load_character_ids() -> List[str]:
    ids = set()
    if not CHAR_DIR.exists():
        return []
    for path in CHAR_DIR.glob("*.png"):
        stem = path.stem
        base = stem.split("_")[0]
        ids.add(base)
    return sorted(ids)


def parse_usage_section(lines: List[str], header: str) -> Dict[str, str]:
    mapping: Dict[str, str] = {}
    try:
        start = lines.index(header)
    except ValueError:
        return mapping

    for line in lines[start + 1 :]:
        line = line.strip()
        if not line:
            continue
        if line.startswith("【"):
            break
        if not line.startswith("-"):
            continue
        m = re.match(r"-\s*([^\s]+)\s*-\s*(.+)$", line)
        if not m:
            continue
        filename = m.group(1).strip()
        label = m.group(2).strip()
        mapping[label] = filename
        mapping[Path(filename).stem] = filename
        mapping[normalize_key(label)] = filename
        mapping[normalize_key(Path(filename).stem)] = filename
    return mapping


def resolve_asset(label: str, mapping: Dict[str, str], default_ext: Optional[str]) -> str:
    key = label.strip()
    if key in mapping:
        return mapping[key]
    nkey = normalize_key(key)
    if nkey in mapping:
        return mapping[nkey]
    if "." in key:
        return key
    if default_ext:
        return f"{key}{default_ext}"
    return key


def resolve_bg(label: str, mapping: Dict[str, str], bg_files: set) -> str:
    candidate = resolve_asset(label, mapping, ".png")
    if candidate in bg_files:
        return candidate
    for key, mapped in BG_FALLBACKS.items():
        if key in label or key in candidate:
            if mapped in bg_files:
                return mapped
    return "black.png" if "black.png" in bg_files else candidate


def resolve_bgm(label: str, mapping: Dict[str, str], bgm_files: set) -> str:
    candidate = resolve_asset(label, mapping, ".mp3")
    if candidate in bgm_files:
        return candidate
    key = normalize_key(label).lower()
    for hint, mapped in BGM_FALLBACKS.items():
        if hint in key or hint in candidate.lower():
            if mapped in bgm_files:
                return mapped
    return "bgm_daily.mp3" if "bgm_daily.mp3" in bgm_files else candidate


def resolve_se(label: str, mapping: Dict[str, str], se_files: set) -> Optional[str]:
    candidate = resolve_asset(label, mapping, ".wav")
    if candidate in se_files:
        return candidate
    return None


def parse_char_tokens(raw: str, expr_token: Optional[str], character_ids: List[str]) -> Tuple[str, str]:
    token = raw.strip().lower()
    token = token.replace("kakutougi", "kakutogi")
    token = token.replace("_muscle", "")
    parts = token.split("_")

    base = None
    for cid in character_ids:
        if token.startswith(cid):
            base = cid
            break
    if not base:
        base = parts[0]

    stage = None
    for p in parts:
        if re.fullmatch(r"stage[0-4]", p):
            stage = p
            break

    expr_from_id = None
    for p in parts:
        if p in EXPR_ALIASES:
            expr_from_id = EXPR_ALIASES[p]

    expr = EXPR_ALIASES.get(expr_token, expr_token) if expr_token else None
    if not expr:
        expr = expr_from_id

    return base, stage or "", expr or "neutral"


def pick_face(base: str, stage: str, expr: str, image_ids: set) -> str:
    # stage-specific expression
    if stage:
        if expr and expr != "neutral":
            candidate = f"{base}_{stage}_{expr}"
            if candidate in image_ids:
                return f"{stage}_{expr}"
        candidate = f"{base}_{stage}"
        if candidate in image_ids:
            return stage
        candidate = f"{base}_{stage}_default"
        if candidate in image_ids:
            return f"{stage}_default"

    # neutral expression
    if expr and expr != "neutral":
        candidate = f"{base}_neutral_{expr}"
        if candidate in image_ids:
            return f"neutral_{expr}"

    candidate = f"{base}_neutral"
    if candidate in image_ids:
        return "neutral"

    return "neutral"


def parse_dialogue_line(line: str) -> Optional[Tuple[str, str]]:
    m = re.match(r"^([^：]+)：[「『](.+)[」』]$", line)
    if not m:
        return None
    return m.group(1).strip(), m.group(2).strip()


def parse_speaker_parenthetical(line: str) -> Optional[Tuple[str, str]]:
    m = re.match(r"^([^：]+)（(.+)）$", line)
    if not m:
        return None
    return m.group(1).strip(), f"（{m.group(2).strip()}）"


def resolve_target(text: str, file_bases: List[str]) -> Optional[str]:
    if "選択肢" in text:
        return None
    m = re.search(r"([^\s]+)\.txt", text)
    if m:
        return m.group(1)
    for base in file_bases:
        if base in text:
            return base
    return None


def extract_next_target(lines: List[str], file_bases: List[str]) -> Optional[str]:
    for idx, line in enumerate(lines):
        if line.strip().startswith("【次のシーン】"):
            for next_line in lines[idx + 1 :]:
                if "→" in next_line:
                    target = resolve_target(next_line, file_bases)
                    if target:
                        return target
                if next_line.strip().startswith("【"):
                    return None
    return None


def extract_choice_targets(lines: List[str], file_bases: List[str]) -> List[str]:
    targets: List[str] = []
    i = 0
    while i < len(lines):
        line = lines[i].strip()
        if line.startswith("選択肢："):
            i += 1
            while i < len(lines):
                choice_line = lines[i].strip()
                if not choice_line or choice_line.startswith("====") or choice_line.startswith("【"):
                    break
                m = re.match(r"^[A-Z]\)\s*(.+?)\s*→\s*(.+)$", choice_line)
                if m:
                    target = resolve_target(m.group(2).strip(), file_bases)
                    if target:
                        targets.append(target)
                i += 1
        i += 1
    return targets


META_HEADER_KEYWORDS = (
    "前提",
    "パラメータ",
    "次のシーン",
    "使用BGM",
    "使用背景",
    "登場キャラクター",
    "制作ノート",
    "到達条件",
    "ルート",
    "エンディング",
    "重要",
    "選択肢",
    "推奨",
    "タイトル",
    "完了",
)

STAT_PREFIXES = (
    "好感度",
    "信頼",
    "決意",
    "覚悟",
    "未練",
    "孤独",
    "プロ志向",
    "筋肉Stage",
    "コントロール力",
    "普通の恋フラグ",
)


def is_meta_header(line: str) -> bool:
    if not line.startswith("【"):
        return False
    return any(keyword in line for keyword in META_HEADER_KEYWORDS)


def is_story_line(line: str) -> bool:
    if not line:
        return False
    if line.startswith(("■", "第", "シーン", "Scene", "テーマ：", "テーマ:")):
        return True
    if line.startswith(("（", "(")):
        return True
    if line.startswith("["):
        return True
    if re.match(r"^[^：]+：", line):
        return True
    return False


def normalize_scene_key(raw: str) -> str:
    return re.sub(r"[^0-9A-Za-z]+", "", raw).lower()


def extract_scene_key_from_header(line: str) -> Optional[str]:
    m = re.match(r"^(?:シーン|Scene)\s*([0-9A-Za-z\-]+)", line)
    if not m:
        return None
    return normalize_scene_key(m.group(1))


def extract_scene_key_from_jump(line: str) -> Optional[str]:
    if "シーン" not in line and "Scene" not in line:
        return None
    m = re.search(r"(?:シーン|Scene)\s*([0-9A-Za-z\-]+)", line)
    if not m:
        return None
    return normalize_scene_key(m.group(1))


def parse_choice_header(line: str) -> Optional[Tuple[str, str]]:
    m = re.match(r"^【選択肢([A-Za-z0-9]+)】[:：]?[「『](.+)[」』]$", line)
    if m:
        return m.group(1), m.group(2).strip()
    m = re.match(r"^【選択肢([A-Za-z0-9]+)】[:：]?(.*)$", line)
    if m and m.group(2).strip():
        return m.group(1), m.group(2).strip()
    return None


def convert_lines(
    lines: List[str],
    bg_map: Dict[str, str],
    bgm_map: Dict[str, str],
    se_map: Dict[str, str],
    file_bases: List[str],
    label_map: Dict[str, str],
    character_ids: List[str],
    image_ids: set,
    bg_files: set,
    bgm_files: set,
    se_files: set,
    scene_label_map: Optional[Dict[str, str]] = None,
) -> List[str]:
    output: List[str] = []
    i = 0
    skip_meta = False
    pending_speaker: Optional[str] = None
    pending_close: Optional[str] = None
    pending_buffer: List[str] = []
    while i < len(lines):
        raw = lines[i].rstrip("\n")
        line = raw.strip()
        i += 1

        if not line:
            if pending_speaker:
                pending_buffer.append("")
            output.append("")
            continue

        if skip_meta:
            if is_meta_header(line):
                continue
            if is_story_line(line):
                skip_meta = False
            else:
                continue
        if is_meta_header(line):
            skip_meta = True
            continue

        if line.startswith("※"):
            continue

        if any(line.startswith(prefix) for prefix in STAT_PREFIXES):
            continue

        if line.startswith("================================================================================"):
            output.append("; " + line)
            continue

        scene_key = extract_scene_key_from_header(line)
        if scene_key and scene_label_map and scene_key in scene_label_map:
            output.append(f"*{scene_label_map[scene_key]}")
            output.append("; " + line)
            continue

        if line.startswith("■") or line.startswith("テーマ：") or line.startswith("テーマ:") or line.startswith("Scene") or line.startswith("第") or line.startswith("シーン"):
            output.append("; " + line)
            continue

        if line.startswith("★ 分岐ポイント"):
            output.append("; " + line)
            continue

        if line.startswith("→"):
            if scene_label_map:
                jump_key = extract_scene_key_from_jump(line)
                if jump_key and jump_key in scene_label_map:
                    output.append(f"[jump target=\"{scene_label_map[jump_key]}\"]")
                    continue
            target = resolve_target(line, file_bases)
            if target and target in label_map:
                output.append(f"[jump target=\"{label_map[target]}\"]")
            continue

        if line.startswith("選択肢："):
            choices: List[Tuple[str, str]] = []
            while i < len(lines):
                choice_line = lines[i].strip()
                if not choice_line or choice_line.startswith("====") or choice_line.startswith("【"):
                    break
                m = re.match(r"^[A-Z]\)\s*(.+?)\s*→\s*(.+)$", choice_line)
                if m:
                    text = m.group(1).strip()
                    target = resolve_target(m.group(2).strip(), file_bases)
                    if target and target in label_map:
                        choices.append((text, label_map[target]))
                i += 1
            for text, target in choices:
                output.append(f"[glink target=\"{target}\" text=\"{text}\"]")
            output.append("[s]")
            continue

        # tags
        bg_match = re.match(r"^\[BG:\s*(.+?)\s*\]$", line, re.IGNORECASE)
        if bg_match:
            bg_label = bg_match.group(1)
            bg_file = resolve_bg(bg_label, bg_map, bg_files)
            output.append(f"[bg storage=\"{bg_file}\"]")
            continue

        bgm_match = re.match(r"^\[BGM:\s*(.+?)\s*\]$", line, re.IGNORECASE)
        if bgm_match:
            bgm_label = bgm_match.group(1)
            bgm_file = resolve_bgm(bgm_label, bgm_map, bgm_files)
            output.append(f"[playbgm storage=\"{bgm_file}\"]")
            continue

        se_match = re.match(r"^\[SE:\s*(.+?)\s*\]$", line, re.IGNORECASE)
        if se_match:
            se_label = se_match.group(1)
            se_file = resolve_se(se_label, se_map, se_files)
            if se_file:
                output.append(f"[playse storage=\"{se_file}\"]")
            continue

        char_match = re.match(r"^\[char:\s*(.+?)\s*\]$", line, re.IGNORECASE)
        if char_match:
            parts = [p.strip() for p in char_match.group(1).split(",")]
            raw_id = parts[0]
            position = "center"
            expr_token = None
            for token in parts[1:]:
                t = token.lower()
                if t in POS_ALIASES:
                    position = POS_ALIASES[t]
                    continue
                if t in EXPR_ALIASES:
                    expr_token = EXPR_ALIASES[t]
                    continue
            base, stage, expr = parse_char_tokens(raw_id, expr_token, character_ids)
            face = pick_face(base, stage, expr, image_ids)
            candidate = f"{base}_{face}"
            if candidate in image_ids:
                output.append(
                    f"[chara_show name=\"{base}\" face=\"{face}\" pos=\"{position}\"]"
                )
            else:
                output.append(f"; [chara_show skipped: {raw_id}]")
            continue

        char_exit_match = re.match(r"^\[char_exit:\s*(.+?)\s*\]$", line, re.IGNORECASE)
        if char_exit_match:
            position = POS_ALIASES.get(char_exit_match.group(1).strip().lower(), "center")
            output.append(f"[chara_hide pos=\"{position}\"]")
            continue

        # multi-line dialogue handling
        if pending_speaker:
            close_index = line.find(pending_close) if pending_close else -1
            if close_index != -1:
                pending_buffer.append(line[:close_index])
                speaker_id = SPEAKER_MAP.get(pending_speaker, pending_speaker)
                output.append(f"#{speaker_id}")
                output.append("\n".join(pending_buffer).strip())
                pending_speaker = None
                pending_close = None
                pending_buffer = []
                continue
            pending_buffer.append(line)
            continue

        # dialogue
        d = parse_dialogue_line(line)
        if d:
            speaker, text = d
            speaker_id = SPEAKER_MAP.get(speaker, speaker)
            output.append(f"#{speaker_id}")
            output.append(text)
            continue

        # start of multi-line dialogue
        m = re.match(r"^([^：]+)：([「『])(.+)$", line)
        if m and not re.search(r"[」』]$", line):
            pending_speaker = m.group(1).strip()
            opening = m.group(2)
            pending_close = "」" if opening == "「" else "』"
            pending_buffer = [m.group(3).strip()]
            continue

        d = parse_speaker_parenthetical(line)
        if d:
            speaker, text = d
            speaker_id = SPEAKER_MAP.get(speaker, speaker)
            output.append(f"#{speaker_id}")
            output.append(text)
            continue

        # narration
        output.append(line)

    if pending_speaker and pending_buffer:
        speaker_id = SPEAKER_MAP.get(pending_speaker, pending_speaker)
        output.append(f"#{speaker_id}")
        output.append("\n".join(pending_buffer).strip())

    return output


def convert_script_file(
    path: Path,
    file_bases: List[str],
    label_map: Dict[str, str],
    character_ids: List[str],
    image_ids: set,
    bg_files: set,
    bgm_files: set,
    se_files: set,
) -> Tuple[List[str], Optional[str], List[str]]:
    lines = path.read_text(encoding="utf-8").splitlines()
    bg_map = parse_usage_section(lines, "【使用背景】")
    bgm_map = parse_usage_section(lines, "【使用BGM/SE】")
    se_map = parse_usage_section(lines, "【使用BGM/SE】")
    content_lines: List[str] = []
    for line in lines:
        if line.strip().startswith("【使用BGM/SE】"):
            break
        content_lines.append(line)

    file_label = label_map.get(path.stem, path.stem)
    scene_label_map: Dict[str, str] = {}
    for raw in content_lines:
        key = extract_scene_key_from_header(raw.strip())
        if key:
            scene_label_map[key] = f"{file_label}_scene_{key}"

    main_lines: List[str] = []
    choice_blocks: List[Tuple[str, List[str], Optional[str]]] = []
    i = 0
    while i < len(content_lines):
        line = content_lines[i].strip()
        choice = parse_choice_header(line)
        if not choice:
            main_lines.append(content_lines[i])
            i += 1
            continue

        choices: List[Tuple[str, str]] = []
        while choice:
            choice_id, choice_text = choice
            choice_label = f"{file_label}_choice_{choice_id.lower()}"
            i += 1
            block_lines: List[str] = []
            target_label: Optional[str] = None
            while i < len(content_lines):
                next_line = content_lines[i].strip()
                if parse_choice_header(next_line):
                    break
                if next_line.startswith("================================================================================"):
                    lookahead = i + 1
                    while lookahead < len(content_lines) and not content_lines[lookahead].strip():
                        lookahead += 1
                    if lookahead < len(content_lines):
                        if extract_scene_key_from_header(content_lines[lookahead].strip()):
                            break
                jump_key = extract_scene_key_from_jump(next_line)
                if jump_key and jump_key in scene_label_map:
                    target_label = scene_label_map[jump_key]
                    i += 1
                    continue
                target = resolve_target(next_line, file_bases)
                if target and target in label_map:
                    target_label = label_map[target]
                    i += 1
                    continue
                block_lines.append(content_lines[i])
                i += 1

            choices.append((choice_text, choice_label))
            choice_blocks.append((choice_label, block_lines, target_label))

            if i < len(content_lines):
                choice = parse_choice_header(content_lines[i].strip())
            else:
                choice = None

        for text, target in choices:
            main_lines.append(f"[glink target=\"{target}\" text=\"{text}\"]")
        main_lines.append("[s]")

    output = convert_lines(
        main_lines,
        bg_map,
        bgm_map,
        se_map,
        file_bases,
        label_map,
        character_ids,
        image_ids,
        bg_files,
        bgm_files,
        se_files,
        scene_label_map=scene_label_map,
    )

    for choice_label, block_lines, target_label in choice_blocks:
        output.append("")
        output.append(f"*{choice_label}")
        output.extend(
            convert_lines(
                block_lines,
                bg_map,
                bgm_map,
                se_map,
                file_bases,
                label_map,
                character_ids,
                image_ids,
                bg_files,
                bgm_files,
                se_files,
                scene_label_map=scene_label_map,
            )
        )
        if target_label:
            output.append(f"[jump target=\"{target_label}\"]")
    next_target = extract_next_target(lines, file_bases)
    choice_targets = extract_choice_targets(lines, file_bases)
    return output, next_target, choice_targets


def build_route(
    route_name: str,
    route_dir: Path,
    image_ids: set,
    character_ids: List[str],
    bg_files: set,
    bgm_files: set,
    se_files: set,
) -> List[str]:
    files = sorted(route_dir.glob("*.txt"))
    file_map = {p.stem: p for p in files}
    file_bases = list(file_map.keys())

    # build references for reachability
    refs: Dict[str, List[str]] = {}
    for stem, path in file_map.items():
        lines = path.read_text(encoding="utf-8").splitlines()
        targets = []
        next_target = extract_next_target(lines, file_bases)
        if next_target:
            targets.append(next_target)
        targets.extend(extract_choice_targets(lines, file_bases))
        refs[stem] = targets

    start_base = None
    for stem in file_bases:
        if stem.startswith("第1話"):
            start_base = stem
            break
    if not start_base:
        for stem in file_bases:
            if stem.startswith("00_"):
                start_base = stem
                break
    if not start_base:
        start_base = file_bases[0] if file_bases else ""

    # reachable order from start
    ordered: List[str] = []
    if start_base:
        ordered.append(start_base)
    idx = 0
    while idx < len(ordered):
        current = ordered[idx]
        idx += 1
        for target in refs.get(current, []):
            if target in file_map and target not in ordered:
                ordered.append(target)

    if not ordered:
        ordered = file_bases

    label_map = {stem: f"{ROUTE_ID_MAP[route_name]}_{idx:02d}" for idx, stem in enumerate(ordered)}

    out: List[str] = []
    out.append(f"; route: {route_name}")
    out.append("*start")
    if start_base:
        out.append(f"[jump target=\"{label_map[start_base]}\"]")

    for base in ordered:
        path = file_map[base]
        out.append("")
        out.append(f"; source: {path.name}")
        out.append(f"*{label_map[base]}")

        body, next_target, choice_targets = convert_script_file(
            path,
            file_bases,
            label_map,
            character_ids,
            image_ids,
            bg_files,
            bgm_files,
            se_files,
        )
        out.extend(body)
        if next_target and next_target in label_map:
            out.append(f"[jump target=\"{label_map[next_target]}\"]")
        elif base.startswith("END"):
            out.append("[end]")
        elif not choice_targets:
            # fallback to next in order for linear flow
            idx = ordered.index(base)
            if idx + 1 < len(ordered):
                out.append(f"[jump target=\"{label_map[ordered[idx + 1]]}\"]")

    return out


def build_common(
    path: Path,
    image_ids: set,
    character_ids: List[str],
    bg_files: set,
    bgm_files: set,
    se_files: set,
) -> List[str]:
    file_bases = [path.stem]
    label_map = {path.stem: "start"}
    out: List[str] = []
    out.append(f"; common: {path.name}")
    out.append("*start")
    body, next_target, _ = convert_script_file(
        path,
        file_bases,
        label_map,
        character_ids,
        image_ids,
        bg_files,
        bgm_files,
        se_files,
    )
    out.extend(body)
    if next_target:
        # map to known scenario names
        if next_target.startswith("01_"):
            out.append("[jump storage=\"episode01.ks\"]")
        elif next_target.startswith("02_"):
            out.append("[jump storage=\"episode02.ks\"]")
        elif next_target.startswith("03_"):
            out.append("[jump storage=\"episode03.ks\"]")
    return out


def write_lines(path: Path, lines: List[str]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    text = "\n".join(lines).rstrip() + "\n"
    path.write_text(text, encoding="utf-8")


def main() -> int:
    image_ids = {p.stem for p in CHAR_DIR.glob("*.png")}
    character_ids = load_character_ids()
    bg_files = {p.name for p in BG_DIR.glob("*.png")}
    bgm_files = {p.name for p in BGM_DIR.glob("*.mp3")}
    se_files = {p.name for p in SE_DIR.glob("*")}

    # common episodes
    for src_name, out_name in COMMON_OUTPUT.items():
        src_path = COMMON_DIR / src_name
        if not src_path.exists():
            continue
        out_lines = build_common(src_path, image_ids, character_ids, bg_files, bgm_files, se_files)
        write_lines(SCENARIOS_DIR / out_name, out_lines)

    # routes
    for route_dir in ROUTES_DIR.iterdir():
        if not route_dir.is_dir():
            continue
        route_name = route_dir.name
        if route_name not in ROUTE_ID_MAP:
            continue
        out_lines = build_route(route_name, route_dir, image_ids, character_ids, bg_files, bgm_files, se_files)
        out_path = SCENARIOS_DIR / f"route_{ROUTE_ID_MAP[route_name]}.ks"
        write_lines(out_path, out_lines)

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
