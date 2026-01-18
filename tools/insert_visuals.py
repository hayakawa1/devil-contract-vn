#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
コマンドリストにスプライトや背景を追加する

使用方法:
    python insert_visuals.py --input commands.json --output enhanced_commands.json
"""

import json
import re
import argparse
from pathlib import Path
from typing import List, Dict, Any, Optional, Set
from copy import deepcopy


class VisualInserter:
    """コマンドリストに視覚要素を追加するクラス"""

    # 背景キーワード（より詳細）
    BACKGROUND_KEYWORDS = {
        # 場所
        "電車": "train",
        "通学": "train",
        "学校": "school_morning",
        "教室": "classroom",
        "部室": "club_room",
        "同好会室": "club_room",
        "生徒会室": "student_council_room",
        "廊下": "hallway",
        "公園": "park",
        "家": "room",
        "部屋": "room",
        "自宅": "room",
        "玄関": "entrance",
        "外": "street",
        "街": "street",
        "道": "street",
        "帰り道": "street_evening",
        "夜": "street_evening",
        "朝": "school_morning",
        "昼": "school_morning",
        "放課後": "school_afternoon",
    }

    # BGMキーワード
    BGM_KEYWORDS = {
        "日常": "bgm_daily.mp3",
        "緊張": "bgm_tension.mp3",
        "悲": "bgm_sad.mp3",
        "切ない": "bgm_sad.mp3",
        "楽": "bgm_cheerful.mp3",
        "嬉": "bgm_cheerful.mp3",
        "悪魔": "bgm_devil.mp3",
        "契約": "bgm_devil.mp3",
        "戦": "bgm_battle.mp3",
    }

    # 表情パターン
    EXPRESSION_PATTERNS = {
        r'^( |…|。|、)+$': 'neutral',
        r'[！!]': 'surprised',
        r'[！?][?！]': 'surprised',
        r'[？?]': 'curious',
        r'(涙|泣|号哭)': 'crying',
        r'(怒|激|悔し|むか)': 'angry',
        r'(笑|嬉|わくわく|パンジー)': 'smile',
        r'(悲|辛|苦|寂)': 'sad',
        r'(顔を赤|照|恥|赤面)': 'flustered',
        r'(驚|えっ|ひっ)': 'surprised',
    }

    # キャラクター状態
    def __init__(self, characters_file: str = None):
        self.characters_data = {}
        self.current_bg = None
        self.current_bgm = None
        self.visible_characters = {}  # position -> character_id

        if characters_file:
            self.load_characters(characters_file)

    def load_characters(self, filepath: str):
        """キャラクターデータを読み込む"""
        with open(filepath, 'r', encoding='utf-8') as f:
            self.characters_data = json.load(f)

    def get_character_sprites(self, character_id: str) -> Dict[str, str]:
        """キャラクターのスプライトを取得する"""
        if not self.characters_data:
            return {
                'neutral': f"{character_id}_neutral",
                'smile': f"{character_id}_smile",
                'sad': f"{character_id}_sad",
                'angry': f"{character_id}_angry",
            }

        sprites = self.characters_data.get('characters', {}).get(character_id, {}).get('sprites', {})
        return sprites

    def detect_expression(self, text: str) -> str:
        """テキストから表情を検出する"""
        for pattern, expr in self.EXPRESSION_PATTERNS.items():
            if re.search(pattern, text):
                return expr
        return 'neutral'

    def detect_background_from_text(self, text: str) -> Optional[str]:
        """テキストから背景を検出する"""
        for keyword, bg in self.BACKGROUND_KEYWORDS.items():
            if keyword in text:
                return bg
        return None

    def detect_bgm_from_text(self, text: str) -> Optional[str]:
        """テキストからBGMを検出する"""
        for keyword, bgm in self.BGM_KEYWORDS.items():
            if keyword in text:
                return bgm
        return None

    def get_sprite_for_character(self, character_id: str, expression: str = 'neutral') -> Optional[str]:
        """キャラクターのスプライト名を取得する"""
        sprites = self.get_character_sprites(character_id)

        # 指定された表情があればそれを優先
        if expression in sprites:
            return sprites[expression]

        # なければneutralを試す
        if 'neutral' in sprites:
            return sprites['neutral']

        # それでもなければ最初のスプライト
        if sprites:
            return list(sprites.values())[0]

        return f"{character_id}_neutral"

    def insert_visuals(self, commands: List[Dict[str, Any]]) -> List[Dict[str, Any]]:
        """コマンドリストに視覚要素を追加する"""
        result = []

        for cmd in commands:
            cmd_type = cmd.get('type')
            cmd_copy = deepcopy(cmd)

            # text コマンドの場合
            if cmd_type == 'text':
                speaker = cmd.get('speaker')
                text = cmd.get('text', '')

                if speaker:
                    # 話者のスプライトを表示
                    expression = self.detect_expression(text)
                    sprite = self.get_sprite_for_character(speaker, expression)

                    if sprite:
                        # キャラクターがまだ表示されていなければ表示
                        if speaker != self.visible_characters.get('center'):
                            result.append({
                                "type": "char",
                                "position": "center",
                                "image": sprite,
                                "highlight": True
                            })
                            self.visible_characters['center'] = speaker
                        elif expression != 'neutral':
                            # 表情が変わる場合は更新
                            result.append({
                                "type": "char",
                                "position": "center",
                                "image": sprite,
                                "highlight": True
                            })

                # テキストから背景/BGMを検出
                new_bg = self.detect_background_from_text(text)
                if new_bg and new_bg != self.current_bg:
                    result.insert(-1 if result else 0, {
                        "type": "bg",
                        "image": new_bg
                    })
                    self.current_bg = new_bg

                new_bgm = self.detect_bgm_from_text(text)
                if new_bgm and new_bgm != self.current_bgm:
                    result.insert(-1 if result else 0, {
                        "type": "bgm",
                        "file": new_bgm
                    })
                    self.current_bgm = new_bgm

            # monologue コマンドの場合
            elif cmd_type == 'monologue':
                text = cmd.get('text', '')

                # テキストから背景/BGMを検出
                new_bg = self.detect_background_from_text(text)
                if new_bg and new_bg != self.current_bg:
                    result.append({
                        "type": "bg",
                        "image": new_bg
                    })
                    self.current_bg = new_bg

                new_bgm = self.detect_bgm_from_text(text)
                if new_bgm and new_bgm != self.current_bgm:
                    result.append({
                        "type": "bgm",
                        "file": new_bgm
                    })
                    self.current_bgm = new_bgm

            # bg コマンドが既にある場合は現在の背景を更新
            elif cmd_type == 'bg':
                self.current_bg = cmd.get('image')

            # bgm コマンドが既にある場合は現在のBGMを更新
            elif cmd_type == 'bgm':
                self.current_bgm = cmd.get('file')

            # char_exit コマンド
            elif cmd_type == 'char_exit':
                position = cmd.get('position', 'center')
                if position in self.visible_characters:
                    del self.visible_characters[position]

            result.append(cmd_copy)

        return result

    def add_initial_background(self, commands: List[Dict[str, Any]], default_bg: str = 'black') -> List[Dict[str, Any]]:
        """最初の背景を追加する"""
        # 既にbgコマンドがあればスキップ
        for cmd in commands:
            if cmd.get('type') == 'bg':
                return commands

        # 最初にbgコマンドを挿入
        result = [{'type': 'bg', 'image': default_bg}]
        result.extend(commands)
        return result

    def add_initial_bgm(self, commands: List[Dict[str, Any]], default_bgm: str = 'bgm_daily.mp3') -> List[Dict[str, Any]]:
        """最初のBGMを追加する"""
        # 既にbgmコマンドがあればスキップ
        for cmd in commands:
            if cmd.get('type') == 'bgm':
                return commands

        # bgコマンドの後にbgmコマンドを挿入
        result = []
        bg_inserted = False

        for cmd in commands:
            result.append(cmd)
            if cmd.get('type') == 'bg' and not bg_inserted:
                result.append({'type': 'bgm', 'file': default_bgm})
                bg_inserted = True

        if not bg_inserted and result:
            result.insert(1, {'type': 'bgm', 'file': default_bgm})

        return result


def main():
    parser = argparse.ArgumentParser(description='視覚要素挿入ツール')
    parser.add_argument('--input', required=True, help='入力コマンドJSONファイル')
    parser.add_argument('--output', required=True, help='出力コマンドJSONファイル')
    parser.add_argument('--characters', default='game/public/assets/characters.json', help='キャラクターデータファイル')
    parser.add_argument('--default-bg', default='black', help='デフォルト背景')
    parser.add_argument('--default-bgm', default='bgm_daily.mp3', help='デフォルトBGM')

    args = parser.parse_args()

    # コマンドを読み込み
    with open(args.input, 'r', encoding='utf-8') as f:
        commands = json.load(f)

    # 挿入器を作成
    inserter = VisualInserter(args.characters)

    # 視覚要素を追加
    enhanced = inserter.insert_visuals(commands)

    # 初期背景/BGMを追加
    enhanced = inserter.add_initial_background(enhanced, args.default_bg)
    enhanced = inserter.add_initial_bgm(enhanced, args.default_bgm)

    # 出力
    output_path = Path(args.output)
    output_path.parent.mkdir(parents=True, exist_ok=True)

    with open(output_path, 'w', encoding='utf-8') as f:
        json.dump(enhanced, f, ensure_ascii=False, indent=2)

    print(f"Enhanced {len(commands)} commands to {len(enhanced)}")
    print(f"Output: {output_path}")


if __name__ == '__main__':
    main()
