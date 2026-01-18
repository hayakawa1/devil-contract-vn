#!/usr/bin/env python3
"""
.ksファイルにBGMコマンドを自動追加するスクリプト
シーンのコンテキストに基づいてBGMを選択
"""

import os
import re
from pathlib import Path

# BGMマッピング（シーンタイプ → BGMファイル）
BGM_MAP = {
    'daily': 'bgm_daily.mp3',      # 日常シーン
    'romance': 'bgm_romance.mp3',   # ロマンスシーン
    'tension': 'bgm_tension.mp3',   # 緊張シーン
    'sadness': 'bgm_sadness.mp3',   # 悲しみシーン
    'devil': 'bgm_devil.mp3',       # 悪魔シーン
    'fight': 'bgm_fight.mp3',       # 戦闘シーン
    'despair': 'bgm_despair.mp3',   # 絶望シーン
    'isolation': 'bgm_isolation.mp3', # 孤独シーン
    'truth': 'bgm_truth.mp3',       # 真実シーン
    'ending': 'bgm_ending.mp3',     # エンディング
}

# シーン判定用キーワード
SCENE_KEYWORDS = {
    'devil': ['悪魔', 'ルシファー', '契約', '代償', '運命'],
    'romance': ['好き', '愛', 'キス', '告白', '抱き', 'デート', 'ドキドキ', '恋'],
    'tension': ['緊張', '危険', '襲', '追', '逃', '戦', '闘', '怒'],
    'sadness': ['悲し', '泣', '涙', '辛い', '死', '別れ', '失'],
    'fight': ['殴', '蹴', '格闘', '対決', '倒'],
    'despair': ['絶望', '終わり', '無理', 'もう'],
    'isolation': ['孤独', '一人', '独り', '寂し'],
    'truth': ['真実', '正体', '秘密', '本当'],
    'ending': ['エンディング', 'END', 'ハッピー', 'バッド'],
}

# 背景によるBGM判定
BG_BGM_MAP = {
    'classroom': 'daily',
    'school': 'daily',
    'hallway': 'daily',
    'rooftop': 'daily',
    'street': 'daily',
    'home': 'daily',
    'room': 'daily',
    'train': 'daily',
    'park': 'daily',
    'night': 'tension',
    'devil': 'devil',
    'karaoke': 'romance',
    'cafe': 'romance',
    'gym': 'fight',
    'dojo': 'fight',
}


def detect_scene_type(text_block, current_bg=None):
    """テキストブロックからシーンタイプを検出"""

    # 悪魔シーンを最優先
    if any(kw in text_block for kw in SCENE_KEYWORDS['devil']):
        return 'devil'

    # エンディングシーン
    if any(kw in text_block for kw in SCENE_KEYWORDS['ending']):
        return 'ending'

    # 戦闘シーン
    if any(kw in text_block for kw in SCENE_KEYWORDS['fight']):
        return 'fight'

    # 緊張シーン
    if any(kw in text_block for kw in SCENE_KEYWORDS['tension']):
        return 'tension'

    # 悲しみシーン
    if any(kw in text_block for kw in SCENE_KEYWORDS['sadness']):
        return 'sadness'

    # 絶望シーン
    if any(kw in text_block for kw in SCENE_KEYWORDS['despair']):
        return 'despair'

    # ロマンスシーン
    if any(kw in text_block for kw in SCENE_KEYWORDS['romance']):
        return 'romance'

    # 孤独シーン
    if any(kw in text_block for kw in SCENE_KEYWORDS['isolation']):
        return 'isolation'

    # 真実シーン
    if any(kw in text_block for kw in SCENE_KEYWORDS['truth']):
        return 'truth'

    # 背景から判定
    if current_bg:
        for bg_key, scene_type in BG_BGM_MAP.items():
            if bg_key in current_bg.lower():
                return scene_type

    return 'daily'  # デフォルト


def add_bgm_to_ks(file_path):
    """単一の.ksファイルにBGMを追加"""

    with open(file_path, 'r', encoding='utf-8') as f:
        lines = f.readlines()

    new_lines = []
    current_bg = None
    current_bgm = None
    text_buffer = []
    last_bg_line = -1

    # まずファイル全体を解析して、各セクションのシーンタイプを判定
    sections = []
    current_section_start = 0
    current_section_text = []

    for i, line in enumerate(lines):
        # 背景変更を検出
        bg_match = re.search(r'\[bg\s+storage="?([^"\]]+)"?', line)
        if bg_match:
            if current_section_text:
                sections.append({
                    'start': current_section_start,
                    'bg': current_bg,
                    'text': ''.join(current_section_text)
                })
            current_section_start = i
            current_bg = bg_match.group(1)
            current_section_text = []
        else:
            # テキスト行を収集（コメントとタグ以外）
            stripped = line.strip()
            if stripped and not stripped.startswith(';') and not stripped.startswith('[') and not stripped.startswith('*') and not stripped.startswith('#'):
                current_section_text.append(stripped)

    # 最後のセクションを追加
    if current_section_text:
        sections.append({
            'start': current_section_start,
            'bg': current_bg,
            'text': ''.join(current_section_text)
        })

    # 各セクションのシーンタイプを判定
    section_bgm = {}
    for section in sections:
        scene_type = detect_scene_type(section['text'], section['bg'])
        section_bgm[section['start']] = BGM_MAP[scene_type]

    # BGMコマンドを挿入
    current_bgm = None

    for i, line in enumerate(lines):
        # 背景変更の直後にBGMを挿入
        if i in section_bgm:
            new_bgm = section_bgm[i]
            if new_bgm != current_bgm:
                new_lines.append(line)
                # bg行の次にplaybgmを挿入
                new_lines.append(f'[playbgm storage="{new_bgm}"]\n')
                current_bgm = new_bgm
                continue

        new_lines.append(line)

    # ファイルの最初にBGMがない場合、*start後に追加
    has_initial_bgm = False
    for i, line in enumerate(new_lines):
        if '[playbgm' in line:
            has_initial_bgm = True
            break
        if i > 20:  # 最初の20行をチェック
            break

    if not has_initial_bgm:
        # *startラベルの後にデフォルトBGMを追加
        for i, line in enumerate(new_lines):
            if line.strip() == '*start':
                # 次の空行の後にBGMを追加
                insert_pos = i + 1
                while insert_pos < len(new_lines) and new_lines[insert_pos].strip() == '':
                    insert_pos += 1
                new_lines.insert(insert_pos, '[playbgm storage="bgm_daily.mp3"]\n\n')
                break

    # ファイルに書き込み
    with open(file_path, 'w', encoding='utf-8') as f:
        f.writelines(new_lines)

    print(f'Updated: {file_path}')


def main():
    scenarios_dir = Path(__file__).parent.parent / 'game' / 'public' / 'scenarios'

    ks_files = list(scenarios_dir.glob('*.ks'))

    if not ks_files:
        print('No .ks files found!')
        return

    print(f'Found {len(ks_files)} .ks files')

    for ks_file in ks_files:
        print(f'Processing: {ks_file.name}')
        add_bgm_to_ks(ks_file)

    print('\nDone! BGM commands added to all .ks files.')


if __name__ == '__main__':
    main()
