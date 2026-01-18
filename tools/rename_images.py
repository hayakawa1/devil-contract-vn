"""
キャラクター画像ファイル名をシナリオ命名規則に統一

生成された画像ファイル名（英語）をシナリオで使用されている名前（ローマ字）にリネームする

対応表:
- childhood_friend → osananajimi
- student_council → seitokai
- martial_artist → kakutogi
- delinquent → furyo
- friend_sister → imouto
- gyaru → gyaru
- otaku → otaku
- protagonist → protagonist
- devil → akuma
"""
import os
import glob
from pathlib import Path

# パス設定
SOURCE_DIR = r"c:\Users\hayak\Dropbox\悪魔との契約\assets\images\characters"

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
    例: childhood_friend_stage1_smile.png → (childhood_friend, stage1, smile)
    例: childhood_friend_normal.png → (childhood_friend, normal, None)
    """
    name = Path(filename).stem
    parts = name.split("_")

    # シードID部分を除去（最後の長い数字）
    if parts[-1].isdigit() and len(parts[-1]) > 10:
        parts = parts[:-1]

    if len(parts) < 2:
        return None, None, None

    # 2部構成: char_stage.png または char_expression.png
    if len(parts) == 2:
        char_part = parts[0]
        second = parts[1]

        # stage なら表情なし
        if second in ["neutral", "normal", "stage1", "stage2"]:
            return char_part, second, None

        # 表情なら neutral ステージ
        return char_part, "neutral", second

    # 3部構成以上: char_stage_expr.png
    if len(parts) >= 3:
        char_part = parts[0]
        stage = parts[1]
        expr = parts[2]

        return char_part, stage, expr

    return None, None, None


def generate_new_filename(char_id, stage, expression):
    """
    新しいファイル名を生成（シナリオ命名規則）
    """
    # キャラクター名を変換
    char_name = CHARACTER_MAP.get(char_id, char_id)

    # ステージ名を変換
    stage_name = STAGE_MAP.get(stage, stage)

    # 表情名を変換
    expr_name = EXPRESSION_MAP.get(expression, expression) if expression else None

    if expr_name:
        return f"{char_name}_{stage_name}_{expr_name}.png"
    else:
        return f"{char_name}_{stage_name}.png"


def main():
    os.makedirs(SOURCE_DIR, exist_ok=True)

    # ソース画像一覧
    source_files = glob.glob(os.path.join(SOURCE_DIR, "*.png"))

    print("=" * 70)
    print("キャラクター画像ファイル名統一")
    print(f"対象フォルダ: {SOURCE_DIR}")
    print(f"対象ファイル数: {len(source_files)}")
    print("=" * 70)
    print()

    renamed = 0
    skipped = 0
    errors = 0

    for src_path in sorted(source_files):
        filename = os.path.basename(src_path)

        try:
            # ファイル名解析
            char_id, stage, expression = parse_filename(filename)

            if not char_id:
                print(f"  スキップ（解析不能）: {filename}")
                skipped += 1
                continue

            # 新しいファイル名
            new_filename = generate_new_filename(char_id, stage, expression)
            dest_path = os.path.join(SOURCE_DIR, new_filename)

            # 同名ファイルならスキップ
            if src_path == dest_path:
                skipped += 1
                continue

            # 既存ファイルがあれば上書き確認
            if os.path.exists(dest_path) and src_path != dest_path:
                print(f"  上書き: {new_filename}")
                os.remove(dest_path)

            # リネーム
            os.rename(src_path, dest_path)
            print(f"  リネーム: {filename} -> {new_filename}")
            renamed += 1

        except Exception as e:
            print(f"  エラー: {filename} - {e}")
            errors += 1

    print()
    print("=" * 70)
    print(f"完了! リネーム: {renamed} / スキップ: {skipped} / エラー: {errors}")
    print(f"対象フォルダ: {SOURCE_DIR}")
    print("=" * 70)


if __name__ == "__main__":
    main()
