#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
シナリオ.txtをプレーンテキスト/JSON/ゲームスクリプト形式に変換するツール

使用方法:
    python convert_scenario.py --format plain     # プレーンテキスト出力
    python convert_scenario.py --format json      # JSON形式出力
    python convert_scenario.py --format script    # ゲームスクリプト形式出力
"""

import re
import json
import argparse
from pathlib import Path
from typing import List, Dict, Any


class ScenarioParser:
    """シナリオファイルを解析するクラス"""

    def __init__(self, filepath: str):
        self.filepath = Path(filepath)
        self.scenes = []
        self.current_scene = None

    def parse(self) -> List[Dict[str, Any]]:
        """シナリオファイルを解析してデータ構造に変換"""
        with open(self.filepath, 'r', encoding='utf-8') as f:
            lines = f.readlines()

        current_scene = {
            'title': '',
            'content': []
        }

        in_separator = False

        for line in lines:
            line = line.rstrip()

            # 区切り線をスキップ
            if re.match(r'^=+$', line):
                if current_scene['title'] and current_scene['content']:
                    self.scenes.append(current_scene)
                    current_scene = {
                        'title': '',
                        'content': []
                    }
                in_separator = True
                continue

            # 空行
            if not line.strip():
                if current_scene['content']:
                    current_scene['content'].append({
                        'type': 'blank',
                        'text': ''
                    })
                continue

            # シーンタイトル（区切り線の直後の行）
            if in_separator and not current_scene['title']:
                current_scene['title'] = line.strip()
                in_separator = False
                continue

            # キャラクター名と台詞の判定
            character_match = re.match(r'^([^「\n]+)\n*$', line)
            if character_match and len(line) < 30 and '。' not in line and '、' not in line:
                # 次の行が台詞か確認が必要なので、一旦キャラクター名として保存
                current_scene['content'].append({
                    'type': 'character',
                    'name': character_match.group(1).strip()
                })
                continue

            # 台詞（「」で囲まれている）
            if '「' in line or '」' in line:
                current_scene['content'].append({
                    'type': 'dialogue',
                    'text': line.strip()
                })
                continue

            # モノローグ（（）で囲まれている）
            if '（' in line or '）' in line:
                current_scene['content'].append({
                    'type': 'monologue',
                    'text': line.strip()
                })
                continue

            # 地の文・ト書き
            current_scene['content'].append({
                'type': 'narration',
                'text': line.strip()
            })

        # 最後のシーンを追加
        if current_scene['title'] and current_scene['content']:
            self.scenes.append(current_scene)

        return self.scenes


class ScenarioConverter:
    """シナリオを各種フォーマットに変換するクラス"""

    def __init__(self, scenes: List[Dict[str, Any]]):
        self.scenes = scenes

    def to_plain_text(self) -> str:
        """プレーンテキスト形式に変換（区切り線なし、読みやすい形式）"""
        output = []

        for scene in self.scenes:
            if scene['title']:
                output.append(f"\n■ {scene['title']}\n")

            current_character = None

            for item in scene['content']:
                if item['type'] == 'blank':
                    output.append('')
                    current_character = None

                elif item['type'] == 'character':
                    current_character = item['name']

                elif item['type'] == 'dialogue':
                    if current_character:
                        output.append(f"{current_character}：{item['text']}")
                        current_character = None
                    else:
                        output.append(item['text'])

                elif item['type'] == 'monologue':
                    if current_character:
                        output.append(f"{current_character}：{item['text']}")
                        current_character = None
                    else:
                        output.append(item['text'])

                elif item['type'] == 'narration':
                    output.append(item['text'])
                    current_character = None

        return '\n'.join(output)

    def to_json(self) -> str:
        """JSON形式に変換"""
        return json.dumps(self.scenes, ensure_ascii=False, indent=2)

    def to_game_script(self) -> str:
        """ゲームスクリプト形式に変換（ADVエンジン用）"""
        output = []

        for i, scene in enumerate(self.scenes):
            # シーン開始
            scene_id = f"scene_{i:03d}"
            output.append(f"\n; {scene['title']}")
            output.append(f"*{scene_id}")
            output.append("")

            current_character = None

            for item in scene['content']:
                if item['type'] == 'blank':
                    output.append("")
                    current_character = None

                elif item['type'] == 'character':
                    current_character = item['name']

                elif item['type'] == 'dialogue':
                    text = item['text'].strip('「」')
                    if current_character:
                        output.append(f"[{current_character}]")
                        output.append(text)
                        current_character = None
                    else:
                        output.append(text)

                elif item['type'] == 'monologue':
                    text = item['text'].strip('（）')
                    if current_character:
                        output.append(f"[{current_character}]")
                        output.append(f"({text})")
                        current_character = None
                    else:
                        output.append(f"({text})")

                elif item['type'] == 'narration':
                    output.append(f"[narration]")
                    output.append(item['text'])
                    current_character = None

            output.append("")

        return '\n'.join(output)

    def to_renpy_script(self) -> str:
        """Ren'Py形式に変換"""
        output = []

        for i, scene in enumerate(self.scenes):
            # ラベル作成
            label = scene['title'].replace('：', '_').replace(' ', '_').replace('　', '_')
            label = re.sub(r'[^\w]', '', label)

            output.append(f"\nlabel {label}:")
            output.append(f"    # {scene['title']}")
            output.append("")

            current_character = None

            for item in scene['content']:
                if item['type'] == 'blank':
                    output.append("")
                    current_character = None

                elif item['type'] == 'character':
                    current_character = item['name']

                elif item['type'] == 'dialogue':
                    text = item['text'].strip('「」')
                    if current_character:
                        char_var = current_character.replace(' ', '_').lower()
                        output.append(f'    {char_var} "{text}"')
                        current_character = None
                    else:
                        output.append(f'    "{text}"')

                elif item['type'] == 'monologue':
                    text = item['text'].strip('（）')
                    output.append(f'    "({text})"')
                    current_character = None

                elif item['type'] == 'narration':
                    output.append(f'    "{item["text"]}"')
                    current_character = None

            output.append("")

        return '\n'.join(output)


def main():
    parser = argparse.ArgumentParser(
        description='シナリオ.txtを各種フォーマットに変換'
    )
    parser.add_argument(
        '--format',
        choices=['plain', 'json', 'script', 'renpy'],
        default='plain',
        help='出力フォーマット (default: plain)'
    )
    parser.add_argument(
        '--input',
        default='シナリオ.txt',
        help='入力ファイル (default: シナリオ.txt)'
    )
    parser.add_argument(
        '--output',
        help='出力ファイル（指定しない場合は標準出力）'
    )

    args = parser.parse_args()

    # シナリオを解析
    scenario_parser = ScenarioParser(args.input)
    scenes = scenario_parser.parse()

    # 変換
    converter = ScenarioConverter(scenes)

    if args.format == 'plain':
        result = converter.to_plain_text()
    elif args.format == 'json':
        result = converter.to_json()
    elif args.format == 'script':
        result = converter.to_game_script()
    elif args.format == 'renpy':
        result = converter.to_renpy_script()

    # 出力
    if args.output:
        with open(args.output, 'w', encoding='utf-8') as f:
            f.write(result)
        print(f"変換完了: {args.output}")
    else:
        print(result)


if __name__ == '__main__':
    main()
