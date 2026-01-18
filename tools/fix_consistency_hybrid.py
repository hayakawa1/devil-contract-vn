"""
キャラクター一貫性修正スクリプト（ハイブリッドアプローチ）

ステップ1: 各キャラクターの neutral 画像をベースとして服を統一
ステップ2: 筋肉ステージごとの体部分を維持
ステップ3: 表情バリエーションの顔部分を合成
"""

import os
import glob
from pathlib import Path
from PIL import Image
import numpy as np
from typing import Dict, List, Tuple, Optional

# パス設定
SOURCE_DIR = r"c:\Users\hayak\Dropbox\悪魔との契約\assets\images\characters"
OUTPUT_DIR = r"c:\Users\hayak\Dropbox\悪魔との契約\assets\images\characters_fixed"

# キャラクター設定（実際のファイル名）
CHARACTERS = [
    "akuma",      # devil
    "furyo",      # delinquent
    "gyaru",      # gyaru
    "imouto",     # friend_sister
    "kakutogi",   # martial_artist
    "osananajimi", # childhood_friend
    "otaku",      # otaku
    "protagonist",
    "seitokai"    # student_council
]

# ヒロインのみ筋肉ステージあり（3段階）
MUSCLE_STAGES = ["neutral", "stage1", "stage2"]

# 表情リスト（実際のファイル名）
EXPRESSIONS = ["smile", "crying", "angry", "flustered", "surprised", "sad"]


def parse_filename(filename: str) -> Tuple[Optional[str], Optional[str], Optional[str]]:
    """
    ファイル名を解析
    例: osananajimi_neutral_smile.png -> (osananajimi, neutral, smile)
    例: furyo_stage1.png -> (furyo, stage1, None)
    例: protagonist_smile.png -> (protagonist, neutral, smile)
    """
    name = Path(filename).stem
    parts = name.split("_")

    if len(parts) < 2:
        return None, None, None

    char = parts[0]
    if char not in CHARACTERS:
        return None, None, None

    # 2部構成: char_stage.png または char_expr.png
    if len(parts) == 2:
        second = parts[1]

        # stage なら表情なし
        if second in MUSCLE_STAGES:
            return char, second, None

        # 表情なら neutral ステージ
        if second in EXPRESSIONS or second in ["neutral", "smirk"]:
            return char, "neutral", second

        # それ以外（smirkなど）
        return char, "neutral", second

    # 3部構成以上: char_stage_expr.png
    if len(parts) >= 3:
        stage = parts[1]
        expr = parts[2]

        if stage in MUSCLE_STAGES:
            return char, stage, expr

        return None, None, None

    return None, None, None


def group_images_by_character() -> Dict[str, Dict]:
    """
    キャラクターごとに画像をグループ化
    """
    images = glob.glob(os.path.join(SOURCE_DIR, "*.png"))

    grouped = {char: {"neutral": None, "stage1": None, "stage2": None, "expressions": {}}
               for char in CHARACTERS}

    for img_path in images:
        filename = os.path.basename(img_path)
        char, stage, expr = parse_filename(filename)

        if not char:
            continue

        # ベース画像（筋肉ステージ）
        if expr is None:
            if stage in grouped[char]:
                grouped[char][stage] = img_path
        # 表情バリエーション
        else:
            key = f"{stage}_{expr}"
            grouped[char]["expressions"][key] = img_path

    return grouped


def create_face_mask(image_size: Tuple[int, int],
                     face_region: Tuple[float, float, float, float] = (0.25, 0.0, 0.75, 0.45)) -> Image.Image:
    """
    顔用のマスクを作成（上部分の楕円形）
    """
    width, height = image_size
    mask = Image.new('L', (width, height), 0)

    left = int(width * face_region[0])
    top = int(height * face_region[1])
    right = int(width * face_region[2])
    bottom = int(height * face_region[3])

    mask_array = np.zeros((height, width), dtype=np.float32)

    center_x = (left + right) // 2
    center_y = (top + bottom) // 2
    radius_x = (right - left) // 2
    radius_y = (bottom - top) // 2

    y, x = np.ogrid[:height, :width]
    ellipse_mask = ((x - center_x) / radius_x) ** 2 + ((y - center_y) / radius_y) ** 2 <= 1
    mask_array[ellipse_mask] = 1.0

    from scipy.ndimage import gaussian_filter
    mask_array = gaussian_filter(mask_array, sigma=15)

    mask_array = (mask_array * 255).astype(np.uint8)
    return Image.fromarray(mask_array, mode='L')


def create_body_mask(image_size: Tuple[int, int],
                     face_region: Tuple[float, float, float, float] = (0.25, 0.0, 0.75, 0.45)) -> Image.Image:
    """
    体用のマスクを作成（顔以外の部分）
    """
    face_mask = create_face_mask(image_size, face_region)
    body_mask_array = 255 - np.array(face_mask)
    return Image.fromarray(body_mask_array.astype(np.uint8), mode='L')


def fix_character_images(char_data: Dict, char_name: str) -> List[Tuple[str, str]]:
    """
    キャクターの画像一貫性を修正
    """
    results = []

    # neutral 画像を服の基準として使用
    neutral_image = char_data.get("neutral")
    if not neutral_image:
        print(f"  警告: {char_name} の neutral 画像が見つかりません")
        return results

    print(f"\n処理中: {char_name}")
    print(f"  ベース（服基準）: {os.path.basename(neutral_image)}")

    base_img = Image.open(neutral_image).convert("RGBA")

    # 各筋肉ステージを処理
    for stage in MUSCLE_STAGES:
        stage_image = char_data.get(stage)
        if not stage_image:
            continue

        print(f"  ステージ: {stage}")

        # そのステージの表情画像を探す
        for expr in EXPRESSIONS:
            expr_key = f"{stage}_{expr}"
            expr_image = char_data["expressions"].get(expr_key)

            if not expr_image:
                continue

            # 生成: stage_image の体部分 + expr_image の顔部分
            stage_img = Image.open(stage_image).convert("RGBA")
            expr_img = Image.open(expr_image).convert("RGBA")

            # サイズ統一
            if stage_img.size != expr_img.size:
                expr_img = expr_img.resize(stage_img.size, Image.LANCZOS)

            # マスク作成
            face_mask = create_face_mask(stage_img.size)
            body_mask = create_body_mask(stage_img.size)

            # 合成
            result = Image.new("RGBA", stage_img.size)

            # 体部分を貼り付け
            temp_body = Image.new("RGBA", stage_img.size)
            temp_body.paste(stage_img, (0, 0))
            result = Image.composite(result, temp_body, body_mask)

            # 顔部分を貼り付け
            temp_face = Image.new("RGBA", stage_img.size)
            temp_face.paste(expr_img, (0, 0))
            result = Image.composite(result, temp_face, face_mask)

            # 保存
            os.makedirs(OUTPUT_DIR, exist_ok=True)
            output_filename = f"{char_name}_{stage}_{expr}.png"
            output_path = os.path.join(OUTPUT_DIR, output_filename)
            result.convert("RGB").save(output_path)

            results.append((output_path, f"{char_name}_{stage}_{expr}"))
            print(f"    生成: {output_filename}")

    # neutral ステージの表情なし画像もコピー
    if neutral_image:
        output_path = os.path.join(OUTPUT_DIR, f"{char_name}_neutral.png")
        Image.open(neutral_image).convert("RGB").save(output_path)
        results.append((output_path, f"{char_name}_neutral"))

    return results


def main():
    print("=" * 70)
    print("キャラクター一貫性修正（ハイブリッドアプローチ）")
    print("=" * 70)
    print(f"入力: {SOURCE_DIR}")
    print(f"出力: {OUTPUT_DIR}")
    print()

    print("画像をスキャン中...")
    grouped = group_images_by_character()

    print(f"発見したキャラクター: {len(grouped)}")
    for char, data in grouped.items():
        has_neutral = data['neutral'] is not None
        print(f"  {char}: neutral={has_neutral}, expressions={len(data['expressions'])}")

    print()
    print("=" * 70)
    print("処理開始")
    print("=" * 70)

    total_results = []

    for char_name in CHARACTERS:
        if char_name not in grouped:
            print(f"\n警告: {char_name} の画像が見つかりません")
            continue

        results = fix_character_images(grouped[char_name], char_name)
        total_results.extend(results)

    print()
    print("=" * 70)
    print(f"完了! 生成した画像数: {len(total_results)}")
    print(f"出力先: {OUTPUT_DIR}")
    print("=" * 70)


if __name__ == "__main__":
    main()
