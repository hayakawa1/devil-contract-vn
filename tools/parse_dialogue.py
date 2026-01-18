#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
ダイアログを解析して構造化データに変換する

使用方法:
    python parse_dialogue.py --section prologue --start 1 --end 100
"""

import re
import json
import argparse
from pathlib import Path
from typing import List, Dict, Any, Optional, Tuple


class DialogueParser:
    """日本語ダイアログを解析するクラス"""

    # キャラクター名パターン（短く、記号を含まない）
    CHARACTER_PATTERN = re.compile(r'^([^「\n『』（）\(\)]{1,10})$')

    # ダイアログパターン
    DIALOGUE_PATTERN = re.compile(r'「(.+?)」')
    MONOLOGUE_PATTERN = re.compile(r'（(.+?)）')
    PAREN_MONOLOGUE_PATTERN = re.compile(r'\((.+?)\)')

    # 選択肢パターン
    CHOICE_PATTERN = re.compile(r'^\u3010\u9078\u629e\u3011(.+)$')
    BRANCH_PATTERN = re.compile(r'^\u3010\u5206\u5c90\u9078\u629e\u80a2\u3011$')

    # キャラクター名マッピング
    CHARACTER_MAP = {
        "主人公": "protagonist",
        "幼なじみ": "osananajimi",
        "生徒会": "seitokai",
        "生徒会長": "seitokai",
        "会長": "seitokai",
        "ギャル": "gyaru",
        "オタク": "otaku",
        "格闘技部": "kakutogi",
        "格闘技": "kakutogi",
        "不良": "furyo",
        "友達の妹": "imouto",
        "妹": "imouto",
        "悪魔": "akuma",
        "？？": "akuma",
        "？？？": "akuma",
    }

    # 背景キーワードマッピング
    BACKGROUND_KEYWORDS = {
        "電車": "train",
        "学校": "school_morning",
        "教室": "classroom",
        "部室": "club_room",
        "廊下": "hallway",
        "公園": "park",
        "家": "room",
        "部屋": "room",
        "外": "street",
        "街": "street",
        "夜": "street_evening",
        "朝": "school_morning",
    }

    # BGMキーワードマッピング
    BGM_KEYWORDS = {
        "日常": "bgm_daily.mp3",
        "緊張": "bgm_tension.mp3",
        "悲": "bgm_sad.mp3",
        "切ない": "bgm_sad.mp3",
        "楽": "bgm_cheerful.mp3",
        "悪魔": "bgm_devil.mp3",
    }

    def __init__(self, scenario_file: str):
        self.scenario_file = Path(scenario_file)
        self.lines = []

    def load_lines(self) -> List[str]:
        """ファイルを読み込む"""
        with open(self.scenario_file, 'r', encoding='utf-8') as f:
            self.lines = f.readlines()
        return self.lines

    def normalize_character_name(self, name: str) -> Optional[str]:
        """キャラクター名を正規化する"""
        if not name:
            return None

        # 空白を除去
        name = name.strip()

        # マッピングから探す
        if name in self.CHARACTER_MAP:
            return self.CHARACTER_MAP[name]

        # 部分一致で探す
        for jp_name, char_id in self.CHARACTER_MAP.items():
            if jp_name in name or name in jp_name:
                return char_id

        return None

    def parse_line(self, line: str, line_num: int, context: Dict[str, Any]) -> Optional[Dict[str, Any]]:
        """1行を解析してコマンド構造に変換する"""
        line = line.rstrip()

        # 空行はスキップ
        if not line.strip():
            return None

        # セクション区切り
        if re.match(r'^=+$', line):
            return {'type': 'section_separator', 'line': line_num}

        # シーン区切り
        if re.match(r'^-+$', line):
            return {'type': 'scene_separator', 'line': line_num}

        # 選択肢マーカー
        choice_match = self.CHOICE_PATTERN.match(line)
        if choice_match:
            return {
                'type': 'choice_marker',
                'title': choice_match.group(1),
                'line': line_num
            }

        # 分岐マーカー
        branch_match = self.BRANCH_PATTERN.match(line)
        if branch_match:
            return {
                'type': 'branch_marker',
                'title': '分岐選択肢',
                'line': line_num
            }

        # ダイアログ（「」）
        dialogue_match = self.DIALOGUE_PATTERN.search(line)
        if dialogue_match:
            text = dialogue_match.group(1)
            # 話者はコンテキストから推測
            speaker = context.get('current_speaker')
            return {
                'type': 'dialogue',
                'speaker': speaker,
                'raw_text': line,
                'text': text,
                'line': line_num
            }

        # モノローグ（）
        monologue_match = self.MONOLOGUE_PATTERN.search(line)
        if monologue_match:
            return {
                'type': 'monologue',
                'speaker': context.get('current_speaker') or 'protagonist',
                'text': monologue_match.group(1),
                'line': line_num
            }

        # モノローグ(())
        paren_match = self.PAREN_MONOLOGUE_PATTERN.search(line)
        if paren_match:
            return {
                'type': 'monologue',
                'speaker': context.get('current_speaker') or 'protagonist',
                'text': paren_match.group(1),
                'line': line_num
            }

        # キャラクター名（短く、次の行がダイアログ）
        if self.CHARACTER_PATTERN.match(line) and len(line) < 30:
            # 次の行をチェックしてダイアログならキャラクター名として確定
            char_id = self.normalize_character_name(line)
            if char_id:
                return {
                    'type': 'character',
                    'raw_name': line,
                    'character_id': char_id,
                    'line': line_num
                }

        # 地の文
        return {
            'type': 'narration',
            'text': line,
            'line': line_num
        }

    def parse_range(self, start: int, end: int) -> List[Dict[str, Any]]:
        """指定範囲を解析する"""
        if not self.lines:
            self.load_lines()

        result = []
        context = {
            'current_speaker': None,
            'current_scene': None,
            'current_bg': None,
        }

        for i in range(start - 1, min(end, len(self.lines))):
            line = self.lines[i].rstrip()

            # キャラクター名＋次の行がダイアログの場合
            char_match = self.CHARACTER_PATTERN.match(line)
            if char_match and i + 1 < len(self.lines):
                next_line = self.lines[i + 1].rstrip()
                if '「' in next_line:
                    char_id = self.normalize_character_name(line)
                    if char_id:
                        context['current_speaker'] = char_id
                        # 次の行も処理（ダイアログ）
                        dialogue_cmd = self.parse_line(next_line, i + 1, context)
                        if dialogue_cmd:
                            dialogue_cmd['speaker'] = char_id
                            result.append(dialogue_cmd)
                        continue

            cmd = self.parse_line(line, i, context)
            if cmd:
                result.append(cmd)

                # キャラクター発言後は話者をリセット
                if cmd['type'] in ['dialogue', 'monologue']:
                    context['current_speaker'] = None

        return result

    def detect_background(self, text: str) -> Optional[str]:
        """テキストから背景を検出する"""
        for keyword, bg in self.BACKGROUND_KEYWORDS.items():
            if keyword in text:
                return bg
        return None

    def detect_bgm(self, text: str) -> Optional[str]:
        """テキストからBGMを検出する"""
        for keyword, bgm in self.BGM_KEYWORDS.items():
            if keyword in text:
                return bgm
        return None

    def find_main_branching_point(self) -> Optional[int]:
        """メインの分岐点（悪魔の質問）を探す"""
        if not self.lines:
            self.load_lines()

        for i, line in enumerate(self.lines):
            if '選ぶ' in line and '七人' in line:
                return i
            if '誰を選ぶ' in line or 'どの娘' in line:
                return i

        return None


def main():
    parser = argparse.ArgumentParser(description='ダイアログパーサー')
    parser.add_argument('--scenario', default='docs/scenario/シナリオ.txt', help='シナリオファイル')
    parser.add_argument('--start', type=int, default=1, help='開始行番号')
    parser.add_argument('--end', type=int, help='終了行番号（省略時はファイル末尾まで）')
    parser.add_argument('--output', help='出力JSONファイル')

    args = parser.parse_args()

    scenario_file = Path(args.scenario)
    if not scenario_file.exists():
        print(f"Error: Scenario file not found: {scenario_file}")
        return

    dialogue_parser = DialogueParser(str(scenario_file))

    end = args.end or len(dialogue_parser.load_lines())
    parsed = dialogue_parser.parse_range(args.start, end)

    if args.output:
        output_path = Path(args.output)
        output_path.parent.mkdir(parents=True, exist_ok=True)
        with open(output_path, 'w', encoding='utf-8') as f:
            json.dump(parsed, f, ensure_ascii=False, indent=2)
        print(f"Parsed dialogue saved to: {output_path}")
    else:
        print(json.dumps(parsed, ensure_ascii=False, indent=2))


if __name__ == '__main__':
    main()
