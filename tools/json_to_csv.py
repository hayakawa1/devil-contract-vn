#!/usr/bin/env python3
"""
JSON→CSV変換スクリプト
シナリオファイルをJSONからCSV形式に変換する
"""
import json
import csv
import os
import re

SCENARIOS_DIR = os.path.join(os.path.dirname(__file__), '..', 'game', 'public', 'scenarios')
OUTPUT_DIR = SCENARIOS_DIR  # 同じディレクトリにCSVを出力

# CSVカラム定義（17カラム）
CSV_COLUMNS = [
    'type',           # コマンドタイプ
    'speaker',        # 話者ID
    'text',           # テキスト内容
    'image',          # 画像ファイル名（bg, char用）
    'file',           # 音声ファイル名（bgm, se用）
    'position',       # キャラ位置（left, center, right）
    'highlight',      # ハイライト（true/false）
    'name',           # 変数名（set_flag, pov用）
    'value',          # 値（set_flag, affinity用）
    'character',      # キャラクターID（affinity, pov用）
    'prompt',         # 選択肢のプロンプト
    'choice_index',   # 選択肢インデックス（0, 1, 2...）
    'choice_text',    # 選択肢テキスト
    'choice_next',    # 選択肢の遷移先
    'choice_flags',   # 選択肢のフラグ設定（JSON形式）
    'choice_affinity',# 選択肢の好感度設定（JSON形式）
    'label_id'        # ラベルID
]

def escape_csv_value(value):
    """CSV値をエスケープ"""
    if value is None:
        return ''
    if isinstance(value, bool):
        return 'true' if value else 'false'
    if isinstance(value, (int, float)):
        return str(value)
    if isinstance(value, dict):
        return json.dumps(value, ensure_ascii=False)

    s = str(value)
    # ダブルクォートをエスケープ
    s = s.replace('"', '""')
    return s

def command_to_rows(cmd):
    """JSONコマンドをCSV行（複数可）に変換"""
    rows = []
    cmd_type = cmd.get('type', '')

    # 基本行の初期化
    row = {col: '' for col in CSV_COLUMNS}
    row['type'] = cmd_type

    if cmd_type == 'bg':
        row['image'] = cmd.get('image', '')
        rows.append(row)

    elif cmd_type == 'bgm':
        row['file'] = cmd.get('file', '')
        rows.append(row)

    elif cmd_type == 'se':
        row['file'] = cmd.get('file', '')
        rows.append(row)

    elif cmd_type == 'text':
        row['speaker'] = cmd.get('speaker', '')
        row['text'] = cmd.get('text', '')
        rows.append(row)

    elif cmd_type == 'monologue':
        row['text'] = cmd.get('text', '')
        rows.append(row)

    elif cmd_type == 'char':
        row['image'] = cmd.get('image', '')
        row['position'] = cmd.get('position', '')
        row['highlight'] = 'true' if cmd.get('highlight') else 'false'
        rows.append(row)

    elif cmd_type == 'char_exit':
        row['position'] = cmd.get('position', '')
        rows.append(row)

    elif cmd_type == 'choice':
        # 選択肢は複数行に展開
        prompt = cmd.get('prompt', '')
        choices = cmd.get('choices', [])
        for i, choice in enumerate(choices):
            choice_row = {col: '' for col in CSV_COLUMNS}
            choice_row['type'] = 'choice'
            choice_row['prompt'] = prompt
            choice_row['choice_index'] = str(i)
            choice_row['choice_text'] = choice.get('text', '')
            choice_row['choice_next'] = choice.get('next', '') if choice.get('next') is not None else ''

            # フラグ設定があれば
            if 'flags' in choice:
                choice_row['choice_flags'] = json.dumps(choice['flags'], ensure_ascii=False)

            # 好感度設定があれば
            if 'affinity' in choice:
                choice_row['choice_affinity'] = json.dumps(choice['affinity'], ensure_ascii=False)

            rows.append(choice_row)

    elif cmd_type == 'label':
        row['label_id'] = cmd.get('id', '')
        rows.append(row)

    elif cmd_type == 'end':
        rows.append(row)

    elif cmd_type == 'pov':
        row['character'] = cmd.get('character', '')
        row['name'] = cmd.get('name', '')
        rows.append(row)

    elif cmd_type == 'set_flag':
        row['name'] = cmd.get('name', '')
        row['value'] = escape_csv_value(cmd.get('value'))
        rows.append(row)

    elif cmd_type == 'affinity':
        row['character'] = cmd.get('character', '')
        row['value'] = str(cmd.get('value', 0))
        rows.append(row)

    else:
        # 未知のコマンドタイプはそのまま
        print(f"  警告: 未知のコマンドタイプ '{cmd_type}'")
        rows.append(row)

    return rows

def convert_json_to_csv(json_path, csv_path):
    """JSONファイルをCSVに変換"""
    print(f"変換中: {os.path.basename(json_path)}")

    with open(json_path, 'r', encoding='utf-8') as f:
        data = json.load(f)

    # シナリオ名を取得（ファイル名からキーを推測）
    scenario_name = os.path.splitext(os.path.basename(json_path))[0]

    # データ構造を確認
    if scenario_name in data:
        commands = data[scenario_name]
    elif len(data) == 1:
        commands = list(data.values())[0]
    else:
        print(f"  エラー: シナリオキーが見つかりません: {list(data.keys())}")
        return False

    if not isinstance(commands, list):
        print(f"  エラー: コマンドリストが配列ではありません")
        return False

    # CSV行を生成
    all_rows = []
    for cmd in commands:
        rows = command_to_rows(cmd)
        all_rows.extend(rows)

    # CSVファイルに書き出し
    with open(csv_path, 'w', encoding='utf-8', newline='') as f:
        writer = csv.DictWriter(f, fieldnames=CSV_COLUMNS, quoting=csv.QUOTE_ALL)
        writer.writeheader()
        for row in all_rows:
            writer.writerow(row)

    print(f"  → {os.path.basename(csv_path)} ({len(all_rows)}行)")
    return True

def main():
    """メイン処理"""
    print("=== JSON→CSV変換開始 ===\n")

    # 変換対象のJSONファイルをリスト
    json_files = [
        'prologue.json',
        'episode_01.json',
        'episode_02.json',
        'episode_03.json',
        'route_osananajimi.json',
        'route_seitokai.json',
        'route_gyaru.json',
        'route_otaku.json',
        'route_kakutogi.json',
        'route_furyo.json',
        'route_imouto.json',
        'route_harem.json',
    ]

    success_count = 0
    fail_count = 0

    for json_file in json_files:
        json_path = os.path.join(SCENARIOS_DIR, json_file)
        csv_file = json_file.replace('.json', '.csv')
        csv_path = os.path.join(OUTPUT_DIR, csv_file)

        if not os.path.exists(json_path):
            print(f"スキップ: {json_file} (ファイルなし)")
            continue

        if convert_json_to_csv(json_path, csv_path):
            success_count += 1
        else:
            fail_count += 1

    print(f"\n=== 変換完了 ===")
    print(f"成功: {success_count}, 失敗: {fail_count}")

    # full_game_scenario.jsonは壊れているのでスキップ
    print("\n注意: full_game_scenario.json は壊れているためスキップしました。")

if __name__ == '__main__':
    main()
