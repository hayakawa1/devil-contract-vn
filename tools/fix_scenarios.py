"""
シナリオファイルのスプライト名を修正するスクリプト

実際の画像ファイル名に合わせて、シナリオ内のスプライト名を統一する
"""
import json
import glob
import os
from pathlib import Path

# パス設定
SCENARIOS_DIR = r"c:\Users\hayak\Dropbox\悪魔との契約\game\public\scenarios"
CHARACTERS_DIR = r"c:\Users\hayak\Dropbox\悪魔との契約\game\public\assets"

# 画像ファイル一覧を取得
def get_actual_image_files():
    """実際に存在する画像ファイル名の一覧を取得"""
    image_files = set()

    # キャラクター画像
    char_path = os.path.join(CHARACTERS_DIR, "characters")
    if os.path.exists(char_path):
        for f in os.listdir(char_path):
            if f.endswith('.png'):
                # 拡張子を除いた名前を登録
                name = Path(f).stem
                image_files.add(name)

    return image_files

# スプライト名の変換ルール
SPRITE_FIXES = {
    # akuma: 単独の表情を neutral_表情 に変更
    "akuma_smirk": "akuma_neutral_smirk",
    "akuma_neutral": "akuma_neutral",

    # その他のキャラクターも必要に応じて追加
}

# 存在しない表情の置き換え
EXPRESSION_REPLACEMENTS = {
    "hurt": "sad",          # hurt → sad
    "worried": "sad",       # worried → sad
    "proud": "smile",       # proud → smile
    "excited": "smile",     # excited → smile
    "posing": "smile",      # posing → smile
    "analyzing": "surprised", # analyzing → surprised
    "curious": "surprised",  # curious → surprised
    "fighting": "angry",    # fighting → angry
    "cold": "neutral",      # cold → neutral
    "vulnerable": "sad",    # vulnerable → sad
    "determined": "angry",  # determined → angry
    "shy": "flustered",     # shy → flustered
}


def fix_sprite_name(sprite_name, actual_images):
    """
    スプライト名を修正して、実際のファイル名に合わせる
    """
    if not sprite_name:
        return sprite_name

    # 背景画像（キャラクターではない）はそのまま
    bg_images = ["black", "gym", "classroom", "science_prep_room", "student_council_room",
                 "protagonist_room", "park_night", "train", "train_interior", "dojo",
                 "karaoke", "protagonist_home", "hallway", "staff_room", "abandoned_factory",
                 "protagonist_room_night", "dojo_evening", "street_evening", "devil_space",
                 "nurse_office", "family_restaurant_night", "rooftop", "riverbank"]
    if sprite_name in bg_images:
        return sprite_name

    # 直接の置き換え
    if sprite_name in SPRITE_FIXES:
        return SPRITE_FIXES[sprite_name]

    # パターンマッチングによる修正
    # 例: kakutogi_neutral_sad はそのまま
    # 例: kakutogi_neutral_hurt → kakutogi_neutral_sad

    # 画像ファイルとして存在するか確認
    if sprite_name in actual_images:
        return sprite_name

    # 存在しない場合、表情を置き換えて試す
    parts = sprite_name.split('_')
    if len(parts) >= 3:
        # char_stage_expr パターン
        char = parts[0]
        stage = parts[1]
        expr = parts[2]

        # 表情の置き換え
        new_expr = EXPRESSION_REPLACEMENTS.get(expr, expr)
        new_name = f"{char}_{stage}_{new_expr}"

        if new_name in actual_images:
            return new_name

    # それでも見つからない場合は、元の名前を返す（ログ出力用）
    return sprite_name


def fix_scenario_file(scenario_path, actual_images):
    """
    シナリオファイルのスプライト名を修正
    """
    with open(scenario_path, 'r', encoding='utf-8') as f:
        data = json.load(f)

    scenario_key = list(data.keys())[0]
    commands = data[scenario_key]

    fixed_count = 0
    issues = []

    for cmd in commands:
        if cmd.get('type') == 'char':
            old_image = cmd.get('image', '')
            if old_image:
                new_image = fix_sprite_name(old_image, actual_images)
                if new_image != old_image:
                    cmd['image'] = new_image
                    fixed_count += 1
                    issues.append(f"  {old_image} → {new_image}")

    # 修正した内容を保存
    with open(scenario_path, 'w', encoding='utf-8') as f:
        json.dump(data, f, ensure_ascii=False, indent=2)

    return fixed_count, issues


def main():
    print("=" * 70)
    print("シナリオファイルのスプライト名修正")
    print("=" * 70)
    print()

    # 実際の画像ファイル一覧を取得
    print("画像ファイル一覧を取得中...")
    actual_images = get_actual_image_files()
    print(f"  発見した画像ファイル: {len(actual_images)}個")
    print()

    # 全シナリオファイルを処理
    scenario_files = glob.glob(os.path.join(SCENARIOS_DIR, "*.json"))

    total_fixed = 0
    all_issues = []

    for scenario_path in sorted(scenario_files):
        filename = os.path.basename(scenario_path)
        print(f"処理中: {filename}")

        fixed_count, issues = fix_scenario_file(scenario_path, actual_images)
        total_fixed += fixed_count

        if fixed_count > 0:
            print(f"  修正数: {fixed_count}")
            for issue in issues:
                print(issue)
        else:
            print(f"  変更なし")
        print()

    print("=" * 70)
    print(f"完了! 総修正数: {total_fixed}")
    print("=" * 70)


if __name__ == "__main__":
    main()
