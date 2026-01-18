#!/usr/bin/env python3
"""
シナリオファイルのspeaker修正スクリプト
"""
import json
import os

SCENARIOS_DIR = os.path.join(os.path.dirname(__file__), '..', 'game', 'public', 'scenarios')

def fix_route_imouto():
    """route_imouto.jsonの親友とLINEメッセージのspeakerを修正"""
    filepath = os.path.join(SCENARIOS_DIR, 'route_imouto.json')

    with open(filepath, 'r', encoding='utf-8') as f:
        data = json.load(f)

    scenario = data['route_imouto']

    # 親友のセリフ（テキスト内容でマッチング）
    friend_texts = [
        "なあ、今日うち来ない？",
        "妹がさ……お前に会いたいって",
        "あの体になってから、外出れなくなっててさ",
        "でも、お前には会いたいんだと",
        "頼む。妹、元気づけてやってくれ",
        "おい、なに赤くなってんだよ",
        "はいはい",
        "なあ、ちょっと相談があるんだけど",
        "妹が……お前のこと、好きみたいなんだ",
        "前から薄々気づいてたけど、最近ひどくなってて",
        "お前の名前ばっかり言うし、お前が来ると急に元気になるし",
        "悪いんだけど——あいつに優しくしすぎないでくれ",
        "変な期待、持たせたくないんだ",
        "あいつ、中学生だし。お前には他に——",
        "頼む。傷つく前に、距離置いてくれ",
        "なんだ、急に",
        "……何があった",
        "……断ったのか",
        "……は？",
        "……お前、何言って——",
        "待て。あいつは中学生だぞ。お前の3つ下だぞ",
        "俺の妹だぞ！",
        "——っ",
        "ふざけんな。あいつは——あいつは——",
        "あの体になってから、ずっと落ち込んでた。外にも出られなくなった",
        "なのに、お前が来ると笑うんだ。嬉しそうに",
        "俺は——あいつを守りたいんだよ",
        "わかってるなら——",
        "——",
        "……本気なんだな",
        "……泣かせたら、殺す",
        "幸せにしなかったら、殺す",
        "……まさか、お前に取られるとはな",
        "謝るな。余計むかつく",
        "……あいつを、頼む",
        "……二人で話せ",
        "うるせー。俺は部屋にいるから",
        "……ちっ。見せつけやがって",
        "……幸せにしろよ、バカ",
    ]

    # 妹のLINEメッセージ（『』で囲まれている）
    imouto_line_texts = [
        "『先輩、今日来てくれないんですか？』",
        "『先輩？ 何かありましたか？』",
        "『お兄ちゃんに何か言われたんですか？』",
        "『……ごめんなさい。迷惑でしたよね』",
        "『もう連絡しません』",
    ]

    modified = 0
    for cmd in scenario:
        if cmd.get('type') == 'text' and cmd.get('speaker') == '':
            text = cmd.get('text', '')
            if text in friend_texts:
                cmd['speaker'] = 'friend'
                modified += 1
            elif text in imouto_line_texts:
                cmd['speaker'] = 'imouto'
                modified += 1

    with open(filepath, 'w', encoding='utf-8') as f:
        json.dump(data, f, ensure_ascii=False, indent=2)

    print(f"route_imouto.json: {modified}箇所修正")

def fix_route_seitokai():
    """route_seitokai.jsonの教頭と理事長のspeakerを修正"""
    filepath = os.path.join(SCENARIOS_DIR, 'route_seitokai.json')

    with open(filepath, 'r', encoding='utf-8') as f:
        data = json.load(f)

    scenario = data['route_seitokai']

    # 教頭のセリフの行番号（0-indexed）
    kyoutou_lines = [217, 234, 243, 259, 269, 288, 298, 307, 317, 327, 337, 352]

    # 理事長のセリフの行番号（0-indexed）
    rijichou_lines = [814, 831, 840, 856, 861, 871, 876, 887, 896, 905, 916, 922, 932,
                      945, 956, 961, 965, 1027, 1036, 1046, 1055, 1065, 1076, 1081, 1086]

    modified = 0
    for i, cmd in enumerate(scenario):
        if cmd.get('type') == 'text' and cmd.get('speaker') == '':
            if i in kyoutou_lines:
                cmd['speaker'] = 'kyoutou'
                modified += 1
            elif i in rijichou_lines:
                cmd['speaker'] = 'rijichou'
                modified += 1

    with open(filepath, 'w', encoding='utf-8') as f:
        json.dump(data, f, ensure_ascii=False, indent=2)

    print(f"route_seitokai.json: {modified}箇所修正")

def fix_route_kakutogi():
    """route_kakutogi.jsonの顧問のspeakerを修正"""
    filepath = os.path.join(SCENARIOS_DIR, 'route_kakutogi.json')

    with open(filepath, 'r', encoding='utf-8') as f:
        data = json.load(f)

    scenario = data['route_kakutogi']

    # 顧問のセリフの行番号（0-indexed）
    komon_lines = [254, 265, 275, 284, 294, 303]

    modified = 0
    for i, cmd in enumerate(scenario):
        if cmd.get('type') == 'text' and cmd.get('speaker') == '':
            if i in komon_lines:
                cmd['speaker'] = 'komon'
                modified += 1

    with open(filepath, 'w', encoding='utf-8') as f:
        json.dump(data, f, ensure_ascii=False, indent=2)

    print(f"route_kakutogi.json: {modified}箇所修正")

def fix_episode_01_images():
    """episode_01.jsonのキャラクター画像参照を修正"""
    filepath = os.path.join(SCENARIOS_DIR, 'episode_01.json')

    with open(filepath, 'r', encoding='utf-8') as f:
        data = json.load(f)

    scenario = data['episode_01']

    # 修正対象のマッピング
    image_fixes = {
        'osananajimi_surprised': 'osananajimi_neutral_surprised',
        'seitokai_surprised': 'seitokai_neutral_surprised',
        'gyaru_surprised': 'gyaru_neutral_surprised',
        'otaku_surprised': 'otaku_neutral_surprised',
        'kakutogi_surprised': 'kakutogi_neutral_surprised',
        'furyo_surprised': 'furyo_neutral_surprised',
        'imouto_surprised': 'imouto_neutral_surprised',
    }

    modified = 0
    for cmd in scenario:
        if cmd.get('type') == 'char' and cmd.get('image') in image_fixes:
            old_image = cmd['image']
            cmd['image'] = image_fixes[old_image]
            modified += 1
            print(f"  {old_image} -> {cmd['image']}")

    with open(filepath, 'w', encoding='utf-8') as f:
        json.dump(data, f, ensure_ascii=False, indent=2)

    print(f"episode_01.json: {modified}箇所修正")

if __name__ == '__main__':
    print("=== シナリオファイル修正開始 ===")
    fix_route_imouto()
    fix_route_seitokai()
    fix_route_kakutogi()
    fix_episode_01_images()
    print("=== 修正完了 ===")
