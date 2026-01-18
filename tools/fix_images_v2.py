"""
キャラクター画像ファイル名をシナリオ命名規則に統一（改良版）

全ての画像を一時的な名前にコピーしてから、正しい名前にリネームする
"""
import os
import glob
import shutil
from pathlib import Path
import tempfile

# パス設定
SOURCE_DIR = r"c:\Users\hayak\Dropbox\悪魔との契約\assets\images\characters"
TEMP_DIR = r"c:\Users\hayak\Dropbox\悪魔との契約\assets\images\characters_temp"

# キャラクター名マッピング（生成名 → シナリオ名）
CHARACTER_MAP = {
    "childhood_friend": "osananajimi",
    "student_council": "seitokai",
    "martial_artist": "kakutogi",
    "delinquent": "furyo",
    "friend_sister": "imouto",
    "protagonist": "protagonist",
    "devil": "akuma",
    # 既に正しい名前
    "gyaru": "gyaru",
    "otaku": "otaku",
    "kakutogi": "kakutogi",
    "furyo": "furyo",
    "osananajimi": "osananajimi",
    "seitokai": "seitokai",
    "imouto": "imouto",
    "akuma": "akuma",
}

# 表情マッピング（必要に応じて）
EXPRESSION_MAP = {
    "blush": "flustered",  # blush → flustered
}

# ステージマッピング（normal → neutral）
STAGE_MAP = {
    "normal": "neutral",
}


def parse_filename(filename):
    """
    ファイル名を解析
    """
    name = Path(filename).stem
    parts = name.split("_")

    # シードID部分を除去（最後の長い数字）
    if parts[-1].isdigit() and len(parts[-1]) > 10:
        parts = parts[:-1]

    if len(parts) < 2:
        return None, None, None

    # 最初の部分がキャラクター名
    char_part = parts[0]

    # 残りの部分を結合して解析
    remaining = "_".join(parts[1:])

    # 表情の検出
    expressions = ["angry", "smile", "crying", "blush", "flustered", "surprised", "sad"]
    stage = None
    expression = None

    for expr in expressions:
        if f"_{expr}" in remaining:
            # 表情の前の部分がステージ
            parts_before_expr = remaining.split(f"_{expr}")[0]
            if parts_before_expr:
                stage = parts_before_expr
            else:
                stage = "neutral"
            expression = expr
            break

    if expression is None:
        # 表情なし - 全体がステージ
        stage = remaining
        expression = None

    return char_part, stage, expression


def generate_new_filename(char_id, stage, expression):
    """
    新しいファイル名を生成（シナリオ命名規則）
    """
    # キャラクター名を変換
    char_name = CHARACTER_MAP.get(char_id, char_id)

    # ステージ名を変換
    stage_name = STAGE_MAP.get(stage, stage) if stage else "neutral"

    # 表情名を変換
    if expression:
        expr_name = EXPRESSION_MAP.get(expression, expression)
        return f"{char_name}_{stage_name}_{expr_name}.png"
    else:
        return f"{char_name}_{stage_name}.png"


def main():
    # ソース画像一覧
    source_files = glob.glob(os.path.join(SOURCE_DIR, "*.png"))

    print("=" * 70)
    print("キャラクター画像ファイル名統一（改良版）")
    print(f"対象フォルダ: {SOURCE_DIR}")
    print(f"対象ファイル数: {len(source_files)}")
    print("=" * 70)
    print()

    # 一時ディレクトリを作成
    if os.path.exists(TEMP_DIR):
        shutil.rmtree(TEMP_DIR)
    os.makedirs(TEMP_DIR)

    # ファイル情報を収集
    file_mapping = {}

    for src_path in source_files:
        filename = os.path.basename(src_path)

        try:
            # ファイル名解析
            char_id, stage, expression = parse_filename(filename)

            if not char_id:
                print(f"  スキップ（解析不能）: {filename}")
                continue

            # 新しいファイル名
            new_filename = generate_new_filename(char_id, stage, expression)

            # 一時ファイル名（衝突回避）
            temp_filename = f"temp_{len(file_mapping)}_{filename}"
            temp_path = os.path.join(TEMP_DIR, temp_filename)

            file_mapping[temp_path] = (src_path, new_filename)

        except Exception as e:
            print(f"  エラー: {filename} - {e}")

    # まず一時ディレクトリにコピー
    print(f"\n一時ディレクトリにコピー中...")
    for temp_path, (src_path, new_filename) in file_mapping.items():
        shutil.copy2(src_path, temp_path)

    # 元のファイルを削除
    print(f"元ファイルを削除中...")
    for temp_path, (src_path, new_filename) in file_mapping.items():
        os.remove(src_path)

    # 一時ディレクトリから正しい名前で移動
    print(f"\n正しいファイル名で移動中...")
    renamed = 0
    for temp_path, (src_path, new_filename) in file_mapping.items():
        dest_path = os.path.join(SOURCE_DIR, new_filename)
        shutil.move(temp_path, dest_path)
        print(f"  {new_filename}")
        renamed += 1

    # 一時ディレクトリを削除
    shutil.rmtree(TEMP_DIR)

    print()
    print("=" * 70)
    print(f"完了! 処理したファイル数: {renamed}")
    print(f"対象フォルダ: {SOURCE_DIR}")
    print("=" * 70)


if __name__ == "__main__":
    main()
