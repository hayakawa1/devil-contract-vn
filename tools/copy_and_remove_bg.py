"""
ComfyUI出力画像をゲーム素材フォルダにコピー＆リネーム＆背景除去
"""
import os
import glob
import shutil
from pathlib import Path
from rembg import remove
from PIL import Image

# パス設定
SOURCE_DIR = r"C:\ComfyUI1\output\akuma_characters_v2"
DEST_DIR = r"c:\Users\hayak\Dropbox\悪魔との契約\assets\images\characters"

# キャラクター名マッピング
CHARACTER_MAP = {
    "protagonist": "protagonist",
    "heroine1": "childhood_friend",
    "heroine2": "student_council",
    "heroine3": "gyaru",
    "heroine4": "otaku",
    "heroine5": "martial_artist",
    "heroine6": "delinquent",
    "heroine7": "friend_sister",
    "devil": "devil"
}

# 表情マッピング（英語のまま）
EXPRESSION_MAP = {
    "smile": "smile",
    "crying": "crying",
    "angry": "angry",
    "blush": "blush",
    "surprised": "surprised",
    "sad": "sad"
}


def parse_filename(filename):
    """
    ファイル名を解析（3段階システム対応）
    例: heroine1_stage2_smile_7365204716746550.png
    → (heroine1, stage2, smile)
    例: heroine1_neutral_7365204716746550.png
    → (heroine1, neutral, None)
    """
    name = Path(filename).stem  # 拡張子なし
    parts = name.split("_")

    # シードID部分を除去（最後の長い数字）
    if parts[-1].isdigit() and len(parts[-1]) > 10:
        parts = parts[:-1]

    char_id = parts[0]
    stage = parts[1] if len(parts) > 1 else "neutral"
    expression = parts[2] if len(parts) > 2 else None

    return char_id, stage, expression


def generate_new_filename(char_id, stage, expression):
    """
    新しいファイル名を生成
    """
    char_name = CHARACTER_MAP.get(char_id, char_id)

    if expression:
        return f"{char_name}_{stage}_{expression}.png"
    else:
        return f"{char_name}_{stage}.png"


def process_image(src_path, dest_path):
    """
    画像をコピーして背景除去
    """
    # 画像読み込み
    with open(src_path, 'rb') as f:
        input_data = f.read()

    # 背景除去
    output_data = remove(input_data)

    # 保存
    with open(dest_path, 'wb') as f:
        f.write(output_data)


def main():
    # 出力フォルダ作成
    os.makedirs(DEST_DIR, exist_ok=True)

    # ソース画像一覧
    source_files = glob.glob(os.path.join(SOURCE_DIR, "*.png"))

    print("=" * 70)
    print("キャラクター画像処理")
    print(f"ソース: {SOURCE_DIR}")
    print(f"出力先: {DEST_DIR}")
    print(f"対象ファイル数: {len(source_files)}")
    print("=" * 70)
    print()

    processed = 0
    skipped = 0
    errors = 0

    for src_path in sorted(source_files):
        filename = os.path.basename(src_path)

        try:
            # ファイル名解析
            char_id, stage, expression = parse_filename(filename)

            # 新しいファイル名
            new_filename = generate_new_filename(char_id, stage, expression)
            dest_path = os.path.join(DEST_DIR, new_filename)

            # 既存ファイルスキップ
            if os.path.exists(dest_path):
                print(f"  スキップ: {new_filename} (既存)")
                skipped += 1
                continue

            print(f"  処理中: {filename} -> {new_filename}...", end=" ", flush=True)

            # 背景除去して保存
            process_image(src_path, dest_path)

            print("完了")
            processed += 1

        except Exception as e:
            print(f"エラー: {e}")
            errors += 1

    print()
    print("=" * 70)
    print(f"完了! 処理: {processed} / スキップ: {skipped} / エラー: {errors}")
    print(f"出力先: {DEST_DIR}")
    print("=" * 70)


if __name__ == "__main__":
    main()
