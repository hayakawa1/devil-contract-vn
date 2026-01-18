#!/usr/bin/env python3
"""
シナリオテキスト → TyranoScript (.ks) 変換ツール

使い方:
  python scenario_to_ks.py input.txt output.ks
  python scenario_to_ks.py input.txt              # → input.ks に出力

入力形式:
  [BG: background_name]        → 背景変更
  [BGM: bgm_name]              → BGM変更
  [SE: se_name]                → 効果音
  [char: name, expression]     → キャラ表示
  キャラ名：「セリフ」           → セリフ
  （ナレーション）              → 地の文
  主人公（心の声）              → モノローグ

出力確認のポイント:
  - #speaker の後にセリフが正しく続いているか
  - [bg], [playbgm], [chara_show] のパラメータが正しいか
  - ナレーションと心の声が適切に処理されているか
"""

import sys
import re
from pathlib import Path


# キャラクターID変換（日本語名 → 英語ID）
# ★ここを編集してキャラクターを追加できます
CHARACTER_MAP = {
    '主人公': 'protagonist',
    '悪魔': 'akuma',
    '幼馴染': 'osananajimi',
    '幼なじみ': 'osananajimi',
    '生徒会長': 'seitokai',
    '会長': 'seitokai',
    'ギャル': 'gyaru',
    'オタク': 'otaku',
    '格闘技部': 'kakutogi',
    '格闘技部員': 'kakutogi',
    '不良': 'furyo',
    '妹': 'imouto',
    'ルシファー': 'akuma',
    # 臨時キャラ（ナレーション扱い）
    'アナウンス': None,  # Noneはナレーション扱い
    '審判': None,
    '相手': None,
    'モブ': None,
    '生徒': None,
    '先生': None,
    '教師': None,
}

# 背景名の変換
BG_MAP = {
    'dojo': 'gym',
    '道場': 'gym',
    '教室': 'classroom',
    '廊下': 'hallway',
    '屋上': 'rooftop',
    '通学路': 'street_evening',
    '自室': 'protagonist_room',
    '主人公の部屋': 'protagonist_room',
    '悪魔空間': 'devil_space',
    'devil_space': 'devil_space',
    '体育館・リング': 'gym',
    '体育館・外': 'school_gate',
    # 必要に応じて追加
}

# BGM名の変換
BGM_MAP = {
    '日常': 'bgm_daily.mp3',
    '朝・静': 'bgm_daily.mp3',
    '日常・集中': 'bgm_daily.mp3',
    '緊張': 'bgm_tension.mp3',
    '緊張・戦闘前': 'bgm_tension.mp3',
    '悲しみ': 'bgm_sadness.mp3',
    'ロマンス': 'bgm_romance.mp3',
    '夕方・感動': 'bgm_romance.mp3',
    '悪魔': 'bgm_devil.mp3',
    'bgm_devil': 'bgm_devil.mp3',
    '戦闘': 'bgm_fight.mp3',
    '勝利のファンファーレ': 'bgm_ending.mp3',
    # 必要に応じて追加
}


def convert_character_name(name):
    """キャラクター名をIDに変換"""
    # まずマップを確認
    if name in CHARACTER_MAP:
        return CHARACTER_MAP[name]
    # そのまま返す（英語名の場合）
    return name.lower().replace(' ', '_')


def convert_bg_name(name):
    """背景名を変換"""
    name = name.strip()
    if name in BG_MAP:
        return BG_MAP[name]
    # そのまま返す
    return name.lower().replace(' ', '_').replace('・', '_')


def convert_bgm_name(name):
    """BGM名を変換"""
    name = name.strip()
    if name in BGM_MAP:
        return BGM_MAP[name]
    # .mp3がなければ追加
    if not name.endswith('.mp3'):
        return f'{name}.mp3'
    return name


def parse_line(line):
    """1行をパースしてコマンドを返す"""
    line = line.strip()

    # 空行
    if not line:
        return None

    # コメント行（===で始まる区切り線など）
    if line.startswith('=') or line.startswith('■') or line.startswith('【'):
        return {'type': 'comment', 'text': line}

    # 制作ノートなどはスキップ
    if line.startswith('※') or line.startswith('→'):
        return {'type': 'comment', 'text': line}

    # [BG: xxx]
    bg_match = re.match(r'\[BG:\s*(.+?)\]', line, re.IGNORECASE)
    if bg_match:
        return {'type': 'bg', 'name': bg_match.group(1)}

    # [BGM: xxx]
    bgm_match = re.match(r'\[BGM:\s*(.+?)\]', line, re.IGNORECASE)
    if bgm_match:
        return {'type': 'bgm', 'name': bgm_match.group(1)}

    # [SE: xxx]
    se_match = re.match(r'\[SE:\s*(.+?)\]', line, re.IGNORECASE)
    if se_match:
        return {'type': 'se', 'name': se_match.group(1)}

    # [char: name, expression]
    char_match = re.match(r'\[char:\s*(.+?)(?:,\s*(.+?))?\]', line, re.IGNORECASE)
    if char_match:
        name = char_match.group(1).strip()
        expr = char_match.group(2).strip() if char_match.group(2) else 'neutral'
        return {'type': 'char', 'name': name, 'expression': expr}

    # キャラ名：「セリフ」
    dialogue_match = re.match(r'^(.+?)[:：]\s*[「『](.+?)[」』]$', line)
    if dialogue_match:
        speaker = dialogue_match.group(1).strip()
        text = dialogue_match.group(2).strip()
        return {'type': 'dialogue', 'speaker': speaker, 'text': text}

    # キャラ名：「セリフ（改行あり）
    dialogue_start_match = re.match(r'^(.+?)[:：]\s*[「『](.+)$', line)
    if dialogue_start_match:
        speaker = dialogue_start_match.group(1).strip()
        text = dialogue_start_match.group(2).strip()
        return {'type': 'dialogue', 'speaker': speaker, 'text': text}

    # 主人公（心の声）
    thought_match = re.match(r'^(.+?)[（\(](.+?)[）\)]$', line)
    if thought_match:
        speaker = thought_match.group(1).strip()
        text = thought_match.group(2).strip()
        if speaker == '主人公':
            return {'type': 'thought', 'speaker': speaker, 'text': text}

    # （ナレーション）
    narration_match = re.match(r'^[（\(](.+?)[）\)]$', line)
    if narration_match:
        text = narration_match.group(1).strip()
        return {'type': 'narration', 'text': text}

    # その他のテキスト
    return {'type': 'text', 'text': line}


def generate_ks(commands):
    """コマンドリストから.ksスクリプトを生成"""
    lines = []
    lines.append('; Auto-generated TyranoScript')
    lines.append('*start')
    lines.append('')

    current_speaker = None

    for cmd in commands:
        if cmd is None:
            continue

        cmd_type = cmd['type']

        if cmd_type == 'comment':
            lines.append(f"; {cmd['text']}")
            lines.append('')

        elif cmd_type == 'bg':
            bg_name = convert_bg_name(cmd['name'])
            lines.append(f'[bg storage="{bg_name}.png"]')

        elif cmd_type == 'bgm':
            bgm_name = convert_bgm_name(cmd['name'])
            lines.append(f'[playbgm storage="{bgm_name}"]')

        elif cmd_type == 'se':
            se_name = cmd['name'].replace(' ', '_').replace('・', '_').lower()
            if not se_name.endswith('.mp3') and not se_name.endswith('.wav'):
                se_name += '.mp3'
            lines.append(f'[playse storage="{se_name}"]')

        elif cmd_type == 'char':
            char_id = convert_character_name(cmd['name'])
            expr = cmd['expression'].lower()
            lines.append(f'[chara_show name="{char_id}" face="{expr}" pos="center"]')

        elif cmd_type == 'dialogue':
            speaker = cmd['speaker']
            char_id = convert_character_name(speaker)

            # 話者が変わったら#で指定
            if char_id != current_speaker:
                lines.append('')
                lines.append(f'#{char_id}')
                current_speaker = char_id

            lines.append(cmd['text'])

        elif cmd_type == 'thought':
            # 心の声（モノローグ）
            lines.append('')
            lines.append(f"; {cmd['speaker']}の心の声")
            lines.append(cmd['text'])
            current_speaker = None

        elif cmd_type == 'narration':
            # ナレーション（話者なし）
            lines.append('')
            lines.append(cmd['text'])
            current_speaker = None

        elif cmd_type == 'text':
            # その他のテキスト
            text = cmd['text']
            # セリフっぽいものは処理
            if text and not text.startswith('-') and not text.startswith('・'):
                lines.append(text)

    lines.append('')
    lines.append('[end]')

    return '\n'.join(lines)


def convert_file(input_path, output_path=None):
    """ファイルを変換"""
    input_path = Path(input_path)

    if output_path is None:
        output_path = input_path.with_suffix('.ks')
    else:
        output_path = Path(output_path)

    # 入力ファイルを読み込み
    with open(input_path, 'r', encoding='utf-8') as f:
        content = f.read()

    # 行ごとにパース
    commands = []
    for line in content.split('\n'):
        cmd = parse_line(line)
        if cmd:
            commands.append(cmd)

    # .ksスクリプトを生成
    ks_content = generate_ks(commands)

    # 出力ファイルに書き込み
    with open(output_path, 'w', encoding='utf-8') as f:
        f.write(ks_content)

    print(f'変換完了: {input_path} → {output_path}')
    print(f'コマンド数: {len(commands)}')

    return output_path


def main():
    if len(sys.argv) < 2:
        print(__doc__)
        print('\n使い方:')
        print('  python scenario_to_ks.py input.txt [output.ks]')
        sys.exit(1)

    input_file = sys.argv[1]
    output_file = sys.argv[2] if len(sys.argv) > 2 else None

    convert_file(input_file, output_file)


if __name__ == '__main__':
    main()
