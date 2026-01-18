"""
キャラクター画像ファイル名をシナリオ命名規則に統一（完全版）

アンダースコア含むキャラクター名（childhood_friend等）を正しく処理
"""
import os
import glob
import shutil
from pathlib import Path

# パス設定
SOURCE_DIR = r"c:\Users\hayak\Dropbox\悪魔との契約\assets\images\characters"
TEMP_DIR = r"c:\Users\hayak\Dropbox\悪魔との契約\assets\images\characters_temp"

# 既知のキャラクター名（長い順にマッチング）
CHARACTER_NAMES = [
    "childhood_friend",
    "student_council",
    "martial_artist",
    "friend_sister",
    "delinquent",
    "protagonist",
    "gyaru",
    "otaku",
    "furyo",
    "kakutogi",
    "osananajimi",
    "seitokai",
    "imouto",
    "devil",
    "akuma",
]

# キャラクター名マッピング（生成名 → シナリオ名）
CHARACTER_MAP = {
    "childhood_friend": "osananajimi",
    "student_council": "seitokai",
    "martial_artist": "kakutogi",
    "delinquent": "furyo",
    "friend_sister": "imouto",
    "protagonist": "protagonist",
    "devil": "akuma",
    # 既に正しい名前はそのまま
    "gyaru": "gyaru",
    "otaku": "otaku",
    "furyo": "furyo",
    "kakutogi": "kakutogi",
    "osananajimi": "osananajimi",
    "seitokai": "seitokai",
    "imouto": "imouto",
    "akuma": "akuma",
}

# ステージ名
STAGES = ["neutral", "normal", "stage1", "stage2", "stage3", "stage4"]

# 表情名
EXPRESSIONS = ["angry", "smile", "crying", "blush", "flustered", "surprised", "sad", "smirk"]

# 表情マッピング
EXPRESSION_MAP = {
    "blush": "flustered",
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

    # キャラクター名を特定（長い順）
    char_id = None
    remaining_start = 0

    for char_name in sorted(CHARACTER_NAMES, key=len, reverse=True):
        if "_".join(parts[:len(char_name.split("_"))]) == char_name:
            char_id = char_name
            remaining_start = len(char_name.split("_"))
            break

    if not char_id:
        return None, None, None

    remaining_parts = parts[remaining_start:]
    stage = None
    expression = None

    # 残りの部分を解析
    if not remaining_parts:
        # ステージも表情もない
        stage = "neutral"
    elif len(remaining_parts) == 1:
        part = remaining_parts[0]
        if part in STAGES:
            stage = part
        elif part in EXPRESSIONS:
            stage = "neutral"
            expression = part
        else:
            # 不明な場合はステージと仮定
            stage = part
    else:
        # 2つ以上の部分
        # 最初がステージ、次が表情
        potential_stage = remaining_parts[0]
        potential_expr = remaining_parts[1]

        if potential_stage in STAGES:
            stage = potential_stage
            if potential_expr in EXPRESSIONS:
                expression = potential_expr
        elif potential_stage in EXPRESSIONS:
            stage = "neutral"
            expression = potential_stage

    return char_id, stage, expression


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
    print("キャラクター画像ファイル名統一（完全版）")
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
                # 既に正しい名前の可能性
                if filename not in file_mapping.values():
                    # 保持
                    temp_filename = f"keep_{len(file_mapping)}_{filename}"
                    temp_path = os.path.join(TEMP_DIR, temp_filename)
                    file_mapping[temp_path] = (src_path, filename)
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
    duplicates = 0
    seen = set()

    for temp_path, (src_path, new_filename) in file_mapping.items():
        dest_path = os.path.join(SOURCE_DIR, new_filename)

        if new_filename in seen:
            # 重複 - 上書き
            os.remove(dest_path)
            duplicates += 1

        shutil.move(temp_path, dest_path)
        seen.add(new_filename)
        renamed += 1

    # 一時ディレクトリを削除
    shutil.rmtree(TEMP_DIR)

    print()
    print("=" * 70)
    print(f"完了! 処理したファイル数: {renamed}")
    print(f"重複削除: {duplicates}")
    print(f"対象フォルダ: {SOURCE_DIR}")
    print("=" * 70)


if __name__ == "__main__":
    main()
