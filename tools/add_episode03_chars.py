"""
第3話シナリオにキャラクター表示イベントを自動追加するスクリプト

発言者に応じて適切なキャラクター表示を追加
"""
import json
from pathlib import Path

# パス設定
SCENARIO_PATH = r"c:\Users\hayak\Dropbox\悪魔との契約\game\public\scenarios\episode_03.json"

# episode_03はstage1なので、スプライト名にstage1を使用
STAGE_FOR_EPISODE = "stage1"

# キャラクター名とスプライト名の対応
CHARACTER_SPRITES = {
    "seitokai": "seitokai_stage1",
    "osananajimi": "osananajimi_stage1",
    "gyaru": "gyaru_stage1",
    "otaku": "otaku_stage1",
    "kakutogi": "kakutogi_stage1",
    "furyo": "furyo_stage1",
    "imouto": "imouto_stage1",
    "protagonist": "protagonist_neutral",
    "akuma": "akuma_neutral_smirk"
}

# 背景画像のリスト（キャラクターではない）
BG_IMAGES = {
    "science_prep_room", "student_council_room", "gym", "black"
}


def should_add_char_event(index, commands):
    """
    その位置にcharイベントを追加すべきか判定
    """
    # 既にcharイベントが直前にある場合は追加しない
    if index > 0 and commands[index - 1].get('type') == 'char':
        return False

    # 直前が同じspeakerのtextなら追加しない（連続発言）
    if index > 0 and commands[index - 1].get('type') == 'text':
        prev_speaker = commands[index - 1].get('speaker', '')
        curr_speaker = commands[index].get('speaker', '')
        if prev_speaker == curr_speaker and curr_speaker:
            return False

    return True


def add_character_events(commands):
    """
    シナリオにキャラクター表示イベントを追加
    """
    new_commands = []
    current_char = None
    scene_index = 0

    i = 0
    while i < len(commands):
        cmd = commands[i]
        cmd_type = cmd.get('type')

        # 背景変更の場合はキャラクターをクリア
        if cmd_type == 'bg':
            if current_char:
                new_commands.append({
                    "type": "char_exit",
                    "position": "center"
                })
                current_char = None
            new_commands.append(cmd)

        # シーン変更テキストの場合もキャラクターをクリア
        elif cmd_type == 'text' and cmd.get('speaker', '') == '' and '──' in cmd.get('text', ''):
            if current_char:
                new_commands.append({
                    "type": "char_exit",
                    "position": "center"
                })
                current_char = None
            new_commands.append(cmd)

        # セリフの場合
        elif cmd_type == 'text':
            speaker = cmd.get('speaker', '')

            if speaker and speaker in CHARACTER_SPRITES:
                # 新しいキャラクターが話し始めたら表示を変更
                if current_char != speaker:
                    if current_char:
                        new_commands.append({
                            "type": "char_exit",
                            "position": "center"
                        })

                    new_commands.append({
                        "type": "char",
                        "position": "center",
                        "image": CHARACTER_SPRITES[speaker],
                        "highlight": True
                    })
                    current_char = speaker

            new_commands.append(cmd)

        # 既にcharイベントがある場合はそのまま保持
        elif cmd_type == 'char':
            current_char = cmd.get('image', '').split('_')[0] if cmd.get('image') else None
            new_commands.append(cmd)

        elif cmd_type == 'char_exit':
            current_char = None
            new_commands.append(cmd)

        # その他のコマンドはそのまま
        else:
            new_commands.append(cmd)

        i += 1

    # 最後にキャラクターが残っていたらクリア
    if current_char:
        new_commands.append({
            "type": "char_exit",
            "position": "center"
        })

    return new_commands


def main():
    print("=" * 70)
    print("第3話シナリオにキャラクター表示イベントを追加")
    print("=" * 70)
    print()

    # シナリオファイルを読み込み
    with open(SCENARIO_PATH, 'r', encoding='utf-8') as f:
        data = json.load(f)

    scenario_key = list(data.keys())[0]
    commands = data[scenario_key]

    print(f"元のコマンド数: {len(commands)}")
    print()

    # キャラクター表示イベントを追加
    new_commands = add_character_events(commands)

    print(f"追加後のコマンド数: {len(new_commands)}")
    print(f"追加されたコマンド数: {len(new_commands) - len(commands)}")
    print()

    # 保存
    data[scenario_key] = new_commands

    with open(SCENARIO_PATH, 'w', encoding='utf-8') as f:
        json.dump(data, f, ensure_ascii=False, indent=2)

    print("保存完了!")
    print("=" * 70)


if __name__ == "__main__":
    main()
