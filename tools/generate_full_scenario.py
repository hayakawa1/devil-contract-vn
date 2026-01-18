#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
統合シナリオJSONを生成するメインスクリプト

使用方法:
    python generate_full_scenario.py
"""

import json
import sys
from pathlib import Path
from typing import List, Dict, Any, Optional

# パーサーを同じディレクトリからインポート
sys.path.insert(0, str(Path(__file__).parent))

from parse_scenario import ScenarioParser
from parse_dialogue import DialogueParser
from generate_commands import CommandGenerator
from insert_visuals import VisualInserter


class FullScenarioGenerator:
    """統合シナリオを生成するクラス"""

    def __init__(self, scenario_file: str, characters_file: str):
        self.scenario_file = Path(scenario_file)
        self.characters_file = Path(characters_file)
        self.output_dir = Path(__file__).parent / 'output'
        self.output_dir.mkdir(exist_ok=True)

    def generate(self) -> Dict[str, Any]:
        """統合シナリオを生成する"""
        print("=" * 60)
        print("統合シナリオ生成開始")
        print("=" * 60)

        # 1. シナリオ構造を解析
        print("\n[1/5] シナリオ構造を解析中...")
        scenario_parser = ScenarioParser(str(self.scenario_file))
        section_map = scenario_parser.generate_section_map()

        print(f"  - セクション数: {len(section_map['sections'])}")
        print(f"  - 選択肢ポイント: {len(section_map['choice_points'])}")
        print(f"  - ルート: {list(section_map['route_ranges'].keys())}")

        # 2. セクションごとにコマンドを生成
        print("\n[2/5] 各セクションのコマンドを生成中...")

        command_generator = CommandGenerator(str(self.characters_file))
        visual_inserter = VisualInserter(str(self.characters_file))

        all_commands = []

        # セクションを順番に処理
        for section in section_map['sections']:
            print(f"  処理中: {section['title']} ({section['type']})")

            start = section['start']
            end = section['end']
            section_type = section['type']

            # ラベルを追加
            label_id = self._get_label_for_section(section)
            if label_id:
                all_commands.append({
                    "type": "label",
                    "id": label_id
                })

            # ダイアログを解析
            dialogue_parser = DialogueParser(str(self.scenario_file))
            dialogue_parser.load_lines()
            parsed = dialogue_parser.parse_range(start, end)

            # コマンドに変換
            commands = command_generator.parsed_to_commands(parsed, label=None)

            # 視覚要素を追加
            commands = visual_inserter.insert_visuals(commands)
            commands = visual_inserter.add_initial_background(commands, self._get_default_bg(section_type))
            commands = visual_inserter.add_initial_bgm(commands, self._get_default_bgm(section_type))

            all_commands.extend(commands)

        # 3. メイン選択肢を追加
        print("\n[3/5] メイン選択肢を追加中...")
        main_choice_index = self._find_main_choice_insert_index(all_commands)
        if main_choice_index is not None:
            main_choice = command_generator.create_main_choice()
            all_commands.insert(main_choice_index, main_choice)
            print(f"  - メイン選択肢をインデックス {main_choice_index} に追加")

        # 4. 各ルートのラベルとコマンドを整理
        print("\n[4/5] ルート構造を整理中...")
        all_commands = self._organize_routes(all_commands, section_map)

        # 5. ハーレムルートの選択肢を追加
        print("\n[5/5] ハーレムルート選択肢を追加中...")
        all_commands = self._add_harem_choice(all_commands, command_generator)

        # 統合シナリオを作成
        full_scenario = {
            "full_game": all_commands
        }

        return full_scenario

    def _get_label_for_section(self, section: Dict[str, Any]) -> Optional[str]:
        """セクションに対応するラベルを取得する"""
        title = section['title']
        section_type = section['type']

        if section_type == 'prologue':
            return 'start'
        elif section_type == 'episode_contracts':
            return 'episode_01'
        elif section_type == 'episode_discovery':
            return 'episode_02'
        elif section_type == 'episode_club':
            return 'episode_03'
        elif section_type == 'route':
            # ルート名からIDを抽出
            if '幼なじみ' in title:
                return 'route_osananajimi'
            elif '生徒会' in title:
                return 'route_seitokai'
            elif 'ギャル' in title:
                return 'route_gyaru'
            elif 'オタク' in title:
                return 'route_otaku'
            elif '格闘技' in title:
                return 'route_kakutogi'
            elif '不良' in title:
                return 'route_furyo'
            elif '妹' in title:
                return 'route_imouto'
        elif section_type == 'harem':
            return 'route_harem_start'

        return None

    def _get_default_bg(self, section_type: str) -> str:
        """セクションタイプに対応するデフォルト背景を取得する"""
        bg_map = {
            'prologue': 'train',
            'episode_contracts': 'street_evening',
            'episode_discovery': 'school_morning',
            'episode_club': 'club_room',
            'route': 'school_morning',
            'harem': 'club_room',
        }
        return bg_map.get(section_type, 'black')

    def _get_default_bgm(self, section_type: str) -> str:
        """セクションタイプに対応するデフォルトBGMを取得する"""
        bgm_map = {
            'prologue': 'bgm_daily.mp3',
            'episode_contracts': 'bgm_devil.mp3',
            'episode_discovery': 'bgm_tension.mp3',
            'episode_club': 'bgm_daily.mp3',
            'route': 'bgm_daily.mp3',
            'harem': 'bgm_daily.mp3',
        }
        return bgm_map.get(section_type, 'bgm_daily.mp3')

    def _find_main_choice_insert_index(self, commands: List[Dict[str, Any]]) -> Optional[int]:
        """メイン選択肢を挿入するインデックスを探す"""
        # episode_03ラベルの後を探す
        for i, cmd in enumerate(commands):
            if cmd.get('type') == 'label' and cmd.get('id') == 'episode_03':
                # このラベルの後のコマンドを数えて、適切な位置を探す
                # セクションの終わりあたりを選択肢の位置にする
                j = i + 1
                text_count = 0
                while j < len(commands) and text_count < 20:
                    if commands[j].get('type') in ['text', 'monologue']:
                        text_count += 1
                    j += 1
                return j

        # 見つからない場合はファイルの最後から3番目
        return max(0, len(commands) - 3)

    def _organize_routes(self, commands: List[Dict[str, Any]], section_map: Dict[str, Any]) -> List[Dict[str, Any]]:
        """ルート構造を整理する"""
        # 各ルートの終わりに選択肢を追加
        result = []

        i = 0
        while i < len(commands):
            cmd = commands[i]
            result.append(cmd)

            # ルートのラベルの後
            if cmd.get('type') == 'label' and cmd.get('id', '').startswith('route_'):
                route_id = cmd.get('id')

                # 次のラベルまたは終わりまでがこのルート
                j = i + 1
                while j < len(commands) and commands[j].get('type') != 'label':
                    result.append(commands[j])
                    j += 1

                # ルートの終わりに選択肢を追加
                if route_id != 'route_harem_start':
                    result.append({
                        "type": "choice",
                        "prompt": "エンディング。どうしますか？",
                        "choices": [
                            {"text": "もう一度最初から", "next": "start"},
                            {"text": "タイトルに戻る", "next": None}
                        ]
                    })
                    result.append({"type": "end"})

                i = j
            else:
                i += 1

        return result

    def _add_harem_choice(self, commands: List[Dict[str, Any]], generator: CommandGenerator) -> List[Dict[str, Any]]:
        """ハーレムルートの選択肢を追加する"""
        result = []

        for cmd in commands:
            result.append(cmd)

            # route_harem_startの後に適切な位置で選択肢を追加
            if cmd.get('type') == 'label' and cmd.get('id') == 'route_harem_start':
                # 適切な位置（テキスト数が一定数経過後）に選択肢を追加
                # 簡易的に次のラベルの直前を選択肢位置にする
                pass

        return result

    def save(self, scenario: Dict[str, Any], output_file: str):
        """シナリオを保存する"""
        output_path = Path(output_file)
        output_path.parent.mkdir(parents=True, exist_ok=True)

        with open(output_path, 'w', encoding='utf-8') as f:
            json.dump(scenario, f, ensure_ascii=False, indent=2)

        print(f"\n統合シナリオを保存: {output_path}")
        print(f"コマンド数: {len(scenario['full_game'])}")


def main():
    # パス設定
    base_dir = Path(__file__).parent.parent
    scenario_file = base_dir / 'docs' / 'scenario' / 'シナリオ.txt'
    characters_file = base_dir / 'game' / 'public' / 'assets' / 'characters.json'
    output_file = base_dir / 'game' / 'public' / 'scenarios' / 'full_game_scenario.json'

    # ファイル存在確認
    if not scenario_file.exists():
        print(f"Error: シナリオファイルが見つかりません: {scenario_file}")
        return 1

    if not characters_file.exists():
        print(f"Error: キャラクターファイルが見つかりません: {characters_file}")
        return 1

    # 生成実行
    generator = FullScenarioGenerator(str(scenario_file), str(characters_file))
    scenario = generator.generate()
    generator.save(scenario, str(output_file))

    print("\n" + "=" * 60)
    print("統合シナリオ生成完了！")
    print("=" * 60)

    return 0


if __name__ == '__main__':
    sys.exit(main())
