#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
解析済みダイアログデータをゲームエンジン用のJSONコマンドに変換する

使用方法:
    python generate_commands.py --input parsed_dialogue.json --output commands.json
"""

import json
import argparse
from pathlib import Path
from typing import List, Dict, Any, Optional
from copy import deepcopy


class CommandGenerator:
    """ダイアログデータをJSONコマンドに変換するクラス"""

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
    BACKGROUND_MAP = {
        "電車": "train",
        "通学": "train",
        "学校": "school_morning",
        "教室": "classroom",
        "部室": "club_room",
        "同好会室": "club_room",
        "廊下": "hallway",
        "公園": "park",
        "家": "room",
        "部屋": "room",
        "自宅": "room",
        "外": "street",
        "街": "street",
        "道": "street",
        "帰り道": "street_evening",
        "夜": "street_evening",
        "朝": "school_morning",
        "昼": "school_morning",
    }

    # BGMマッピング
    BGM_MAP = {
        "日常": "bgm_daily.mp3",
        "緊張": "bgm_tension.mp3",
        "悲": "bgm_sad.mp3",
        "切ない": "bgm_sad.mp3",
        "楽": "bgm_cheerful.mp3",
        "悪魔": "bgm_devil.mp3",
        "契約": "bgm_devil.mp3",
    }

    # 表情マッピング
    EXPRESSION_MAP = {
        "…": "neutral",
        "。。。": "neutral",
        "！": "surprised",
        "！？": "surprised",
        "？": "surprised",
        "？！": "surprised",
        "泣": "crying",
        "涙": "crying",
        "怒": "angry",
        "激": "angry",
        "笑": "smile",
        "嬉": "smile",
        "照": "flustered",
        "顔を赤": "flustered",
        "悲": "sad",
        "辛": "sad",
        "苦": "sad",
    }

    def __init__(self, characters_file: str = None):
        self.characters_data = {}
        if characters_file:
            self.load_characters(characters_file)

    def load_characters(self, filepath: str):
        """キャラクターデータを読み込む"""
        with open(filepath, 'r', encoding='utf-8') as f:
            self.characters_data = json.load(f)

    def normalize_character_name(self, name: str) -> Optional[str]:
        """キャラクター名を正規化する"""
        if not name:
            return None

        name = name.strip()

        if name in self.CHARACTER_MAP:
            return self.CHARACTER_MAP[name]

        for jp_name, char_id in self.CHARACTER_MAP.items():
            if jp_name in name or name in jp_name:
                return char_id

        return None

    def get_default_sprite(self, character_id: str) -> str:
        """キャラクターのデフォルトスプライトを取得する"""
        if not self.characters_data:
            return f"{character_id}_neutral"

        sprites = self.characters_data.get('characters', {}).get(character_id, {}).get('sprites', {})
        return sprites.get('neutral', f"{character_id}_neutral")

    def detect_expression(self, text: str) -> str:
        """テキストから表情を検出する"""
        for pattern, expr in self.EXPRESSION_MAP.items():
            if pattern in text:
                return expr
        return "neutral"

    def detect_background(self, text: str) -> Optional[str]:
        """テキストから背景を検出する"""
        for keyword, bg in self.BACKGROUND_MAP.items():
            if keyword in text:
                return bg
        return None

    def detect_bgm(self, text: str) -> Optional[str]:
        """テキストからBGMを検出する"""
        for keyword, bgm in self.BGM_MAP.items():
            if keyword in text:
                return bgm
        return None

    def parsed_to_commands(self, parsed_data: List[Dict[str, Any]], label: str = None) -> List[Dict[str, Any]]:
        """解析済みデータをコマンドリストに変換する"""
        commands = []

        # ラベルを追加
        if label:
            commands.append({
                "type": "label",
                "id": label
            })

        # 現在のキャラクター追跡
        current_characters = set()
        current_bg = None
        current_bgm = None

        for i, item in enumerate(parsed_data):
            item_type = item.get('type')

            # セパレーターはスキップ
            if item_type in ['section_separator', 'scene_separator']:
                continue

            # 地の文から背景/BGMを検出
            if item_type == 'narration':
                text = item.get('text', '')

                # 背景変更を検出
                new_bg = self.detect_background(text)
                if new_bg and new_bg != current_bg:
                    commands.append({
                        "type": "bg",
                        "image": new_bg
                    })
                    current_bg = new_bg

                # BGM変更を検出
                new_bgm = self.detect_bgm(text)
                if new_bgm and new_bgm != current_bgm:
                    commands.append({
                        "type": "bgm",
                        "file": new_bgm
                    })
                    current_bgm = new_bgm

                # 地の文はモノローグとして表示
                commands.append({
                    "type": "monologue",
                    "text": text
                })
                continue

            # キャラクター名
            if item_type == 'character':
                char_id = item.get('character_id')
                if char_id:
                    current_characters.add(char_id)
                continue

            # ダイアログ
            if item_type == 'dialogue':
                speaker = item.get('speaker')
                text = item.get('text', '')

                if speaker:
                    # 話者IDを正規化
                    speaker_id = self.normalize_character_name(speaker)

                    if speaker_id:
                        # キャラクターが表示されていなければ表示
                        if speaker_id not in current_characters:
                            sprite = self.get_default_sprite(speaker_id)
                            commands.append({
                                "type": "char",
                                "position": "center",
                                "image": sprite,
                                "highlight": True
                            })
                            current_characters.add(speaker_id)

                        # 表情を検出
                        expr = self.detect_expression(text)
                        if expr != "neutral":
                            sprite = f"{speaker_id}_{expr}"
                            commands.append({
                                "type": "char",
                                "position": "center",
                                "image": sprite,
                                "highlight": True
                            })

                        commands.append({
                            "type": "text",
                            "speaker": speaker_id,
                            "text": text
                        })
                    else:
                        # 不明な話者はテキストのみ
                        commands.append({
                            "type": "text",
                            "speaker": "",
                            "text": text
                        })
                else:
                    # 話者なし
                    commands.append({
                        "type": "text",
                        "speaker": "",
                        "text": text
                    })
                continue

            # モノローグ
            if item_type == 'monologue':
                commands.append({
                    "type": "monologue",
                    "text": item.get('text', '')
                })
                continue

            # 選択肢マーカー
            if item_type == 'choice_marker':
                # 後で処理
                continue

            # 分岐マーカー
            if item_type == 'branch_marker':
                # 後で処理
                continue

        return commands

    def create_choice_command(self, prompt: str, choices: List[Dict[str, Any]]) -> Dict[str, Any]:
        """選択肢コマンドを作成する"""
        return {
            "type": "choice",
            "prompt": prompt,
            "choices": choices
        }

    def create_main_choice(self) -> Dict[str, Any]:
        """メインのルート選択肢を作成する"""
        return {
            "type": "choice",
            "prompt": "七人の筋肉美女。君は誰を選ぶ？",
            "choices": [
                {"text": "幼なじみ", "next": "route_osananajimi", "affinity": {"osananajimi": 50}},
                {"text": "生徒会長", "next": "route_seitokai", "affinity": {"seitokai": 50}},
                {"text": "ギャル", "next": "route_gyaru", "affinity": {"gyaru": 50}},
                {"text": "オタク", "next": "route_otaku", "affinity": {"otaku": 50}},
                {"text": "格闘技部", "next": "route_kakutogi", "affinity": {"kakutogi": 50}},
                {"text": "不良", "next": "route_furyo", "affinity": {"furyo": 50}},
                {"text": "友達の妹", "next": "route_imouto", "affinity": {"imouto": 50}},
                {"text": "選ばない", "next": "route_harem_start", "affinity": {}}
            ]
        }

    def create_harem_choice(self) -> Dict[str, Any]:
        """ハーレムルートの選択肢を作成する"""
        return {
            "type": "choice",
            "prompt": "どうする？",
            "choices": [
                {"text": "みんなを集めて、話し合う", "next": "harem_true_club_end"},
                {"text": "このまま、全員の隣にいる", "next": "harem_codependent_end"}
            ]
        }


def main():
    parser = argparse.ArgumentParser(description='コマンド生成器')
    parser.add_argument('--input', required=True, help='解析済みJSONファイル')
    parser.add_argument('--output', required=True, help='出力JSONファイル')
    parser.add_argument('--label', help='ラベル名')
    parser.add_argument('--characters', default='game/public/assets/characters.json', help='キャラクターデータファイル')

    args = parser.parse_args()

    # 解析済みデータを読み込み
    with open(args.input, 'r', encoding='utf-8') as f:
        parsed_data = json.load(f)

    # コマンド生成器を作成
    generator = CommandGenerator(args.characters)

    # コマンドに変換
    commands = generator.parsed_to_commands(parsed_data, args.label)

    # 出力
    output_path = Path(args.output)
    output_path.parent.mkdir(parents=True, exist_ok=True)

    with open(output_path, 'w', encoding='utf-8') as f:
        json.dump(commands, f, ensure_ascii=False, indent=2)

    print(f"Generated {len(commands)} commands")
    print(f"Output: {output_path}")


if __name__ == '__main__':
    main()
