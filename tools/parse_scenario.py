#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
シナリオファイルを解析して構造情報を抽出する

使用方法:
    python parse_scenario.py
"""

import re
import json
from pathlib import Path
from typing import List, Dict, Any, Tuple


class ScenarioParser:
    """シナリオファイルの構造を解析するクラス"""

    # セクション区切りパターン
    SECTION_SEPARATOR = re.compile(r'^=+$')
    SCENE_SEPARATOR = re.compile(r'^-+$')

    # 選択肢マーカー
    CHOICE_MARKER = re.compile(r'^【選択】(.+)$')
    BRANCH_MARKER = re.compile(r'^【分岐選択肢】$')

    # キャラクターマーカー
    CHARACTER_MARKER = re.compile(r'^([^「\n]+)$')

    def __init__(self, filepath: str):
        self.filepath = Path(filepath)
        self.lines = []
        self.sections = []

    def load_file(self) -> List[str]:
        """ファイルを読み込む"""
        with open(self.filepath, 'r', encoding='utf-8') as f:
            self.lines = f.readlines()
        return self.lines

    def parse_sections(self) -> List[Dict[str, Any]]:
        """セクション構造を解析する"""
        sections = []
        current_section = None
        current_content_start = 0

        for i, line in enumerate(self.lines):
            line = line.rstrip()

            # メインセクション区切り
            if self.SECTION_SEPARATOR.match(line):
                if current_section:
                    current_section['end'] = i - 1
                    sections.append(current_section)

                # 次の行がセクションタイトル
                if i + 1 < len(self.lines):
                    title = self.lines[i + 1].strip()
                    current_section = {
                        'title': title,
                        'start': i + 2,
                        'end': None,
                        'type': self._detect_section_type(title),
                        'subsections': []
                    }
                    current_content_start = i + 2
                continue

            # サブセクション区切り
            if current_section and self.SCENE_SEPARATOR.match(line):
                if current_content_start < i:
                    # タイトルを取得
                    scene_title = self.lines[i + 1].strip() if i + 1 < len(self.lines) else f"scene_{len(current_section['subsections'])}"

                    current_section['subsections'].append({
                        'title': scene_title,
                        'start': i + 2,
                        'end': None
                    })
                    current_content_start = i + 2
                continue

        # 最後のセクションを追加
        if current_section and current_section['end'] is None:
            current_section['end'] = len(self.lines) - 1
            sections.append(current_section)

        self.sections = sections
        return sections

    def _detect_section_type(self, title: str) -> str:
        """セクションタイプを検出する"""
        if 'プロローグ' in title:
            return 'prologue'
        elif '契約' in title and '夜' in title:
            return 'episode_contracts'
        elif '翌日' in title or '朝' in title or '地獄' in title:
            return 'episode_discovery'
        elif '同好会' in title or '設立' in title:
            return 'episode_club'
        elif 'ルート' in title:
            return 'route'
        elif 'ハーレム' in title:
            return 'harem'
        elif '解毒' in title or '選ばれ' in title:
            return 'antidote'
        else:
            return 'unknown'

    def find_choice_points(self) -> List[Dict[str, Any]]:
        """選択肢ポイントを検出する"""
        choice_points = []

        for i, line in enumerate(self.lines):
            line = line.rstrip()

            # 選択肢マーカー
            choice_match = self.CHOICE_MARKER.match(line)
            if choice_match:
                choice_title = choice_match.group(1)
                choice_points.append({
                    'type': 'choice',
                    'title': choice_title,
                    'line': i,
                    'marker': line
                })
                continue

            # 分岐マーカー
            if self.BRANCH_MARKER.match(line):
                choice_points.append({
                    'type': 'branch',
                    'title': '分岐選択肢',
                    'line': i,
                    'marker': line
                })

        return choice_points

    def extract_route_ranges(self) -> Dict[str, Dict[str, int]]:
        """各ルートの行範囲を抽出する"""
        route_ranges = {}

        for section in self.sections:
            if section['type'] == 'route':
                # ルート名を抽出
                title = section['title']
                route_id = self._extract_route_id(title)
                if route_id:
                    route_ranges[route_id] = {
                        'start': section['start'],
                        'end': section['end'],
                        'title': title
                    }

        return route_ranges

    def _extract_route_id(self, title: str) -> str:
        """タイトルからルートIDを抽出する"""
        route_map = {
            '幼なじみ': 'osananajimi',
            '生徒会': 'seitokai',
            'ギャル': 'gyaru',
            'オタク': 'otaku',
            '格闘技': 'kakutogi',
            '不良': 'furyo',
            '友達の妹': 'imouto',
            '妹': 'imouto'
        }

        for jp_name, route_id in route_map.items():
            if jp_name in title:
                return route_id

        return None

    def parse_dialogue_in_range(self, start: int, end: int) -> List[Dict[str, Any]]:
        """指定範囲内のダイアログを解析する"""
        dialogue_blocks = []
        current_speaker = None

        for i in range(start, min(end + 1, len(self.lines))):
            line = self.lines[i].rstrip()
            if not line:
                continue

            # キャラクター名（短く、記号を含まない）
            char_match = self.CHARACTER_MARKER.match(line)
            if char_match and len(line) < 30:
                potential_name = char_match.group(1).strip()
                # 次の行が「」で始まるならキャラクター名として確定
                if i + 1 < len(self.lines) and self.lines[i + 1].strip().startswith('「'):
                    current_speaker = potential_name
                    continue

            # ダイアログ
            if line.startswith('「') and line.endswith('」'):
                dialogue_blocks.append({
                    'type': 'dialogue',
                    'speaker': current_speaker,
                    'text': line[1:-1],  # 「」を除去
                    'line': i
                })
                current_speaker = None
                continue

            # モノローグ（）
            if line.startswith('（') and line.endswith('）'):
                dialogue_blocks.append({
                    'type': 'monologue',
                    'speaker': current_speaker or '主人公',
                    'text': line[1:-1],
                    'line': i
                })
                current_speaker = None
                continue

            # 地の文
            dialogue_blocks.append({
                'type': 'narration',
                'text': line,
                'line': i
            })
            current_speaker = None

        return dialogue_blocks

    def generate_section_map(self) -> Dict[str, Any]:
        """セクションマップを生成する"""
        self.load_file()
        self.parse_sections()

        return {
            'total_lines': len(self.lines),
            'sections': [
                {
                    'title': s['title'],
                    'type': s['type'],
                    'start': s['start'],
                    'end': s['end'],
                    'subsections_count': len(s.get('subsections', []))
                }
                for s in self.sections
            ],
            'choice_points': self.find_choice_points(),
            'route_ranges': self.extract_route_ranges()
        }


def main():
    # メインのシナリオファイル
    scenario_file = Path(__file__).parent.parent / 'docs' / 'scenario' / 'シナリオ.txt'

    parser = ScenarioParser(str(scenario_file))
    section_map = parser.generate_section_map()

    # 結果を出力
    output_file = Path(__file__).parent / 'output' / 'section_map.json'
    output_file.parent.mkdir(exist_ok=True)

    with open(output_file, 'w', encoding='utf-8') as f:
        json.dump(section_map, f, ensure_ascii=False, indent=2)

    print(f"Section map saved to: {output_file}")
    print(f"\nTotal lines: {section_map['total_lines']}")
    print(f"Sections found: {len(section_map['sections'])}")
    print(f"Choice points: {len(section_map['choice_points'])}")
    print(f"Routes: {list(section_map['route_ranges'].keys())}")


if __name__ == '__main__':
    main()
