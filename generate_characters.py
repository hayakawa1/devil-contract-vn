"""
ComfyUI API を使用したキャラクター画像自動生成スクリプト
ゲーム「悪魔との契約」用 - 既存ワークフローベース
"""

import json
import urllib.request
import urllib.parse
import time
import os
import random
import copy

# ComfyUI API設定
COMFYUI_URL = "http://127.0.0.1:8188"
OUTPUT_DIR = r"C:\ComfyUI1\output\akuma_characters"

# ベースワークフロー（base_workflow.jsonから読み込み）
BASE_WORKFLOW_PATH = r"c:\Users\hayak\Dropbox\悪魔との契約\base_workflow.json"

# 筋肉レベル別のLoRA強度設定 (MusctonkXL.safetensors用)
MUSCLE_STRENGTH = {
    "normal": 0.0,      # 筋肉なし
    "stage1": 0.3,      # うっすら筋肉
    "stage2": 0.6,      # バランス型・主人公の理想
    "stage3": 0.85,     # 明らかに人間離れ
    "stage4": 1.0,      # 完全に人外
}

# キャラクター定義
CHARACTERS = {
    "protagonist": {
        "name": "主人公",
        "stages": ["normal"],
        "prompt": "score_9, score_8, 1boy, male high school student, black gakuran uniform, handsome face, black hair, friendly smile, standing pose, full body, white background, simple background, solo, looking at viewer, BREAK, solid white background, plain backdrop",
        "filename": "protagonist"
    },

    "heroine1": {
        "name": "幼なじみ",
        "stages": ["normal", "stage1", "stage2", "stage3", "stage4"],
        "prompt_base": "score_9, score_8, 1girl, {muscle}gentle expression, long brown hair, soft smile, school uniform, sailor uniform with red ribbon, warm personality, full body, white background, simple background, solo, standing pose, looking at viewer, BREAK, solid white background, plain backdrop",
        "muscle_tags": {
            "normal": "",
            "stage1": "slightly toned arms, hint of athletic build, ",
            "stage2": "muscular female, fit bodybuilder, visible abs, toned arms, ",
            "stage3": "muscular female, heavily muscular, massive arms, professional bodybuilder, ",
            "stage4": "muscular female, extremely muscular, hulking muscles, superhuman physique, "
        },
        "filename": "heroine1"
    },

    "heroine2": {
        "name": "生徒会長",
        "stages": ["normal", "stage1", "stage2", "stage3", "stage4"],
        "prompt_base": "score_9, score_8, 1girl, {muscle}serious expression, long black hair, ponytail, red glasses, student council president, elegant uniform with armband, dignified posture, full body, white background, simple background, solo, standing pose, looking at viewer, BREAK, solid white background, plain backdrop",
        "muscle_tags": {
            "normal": "",
            "stage1": "slightly toned, athletic build, ",
            "stage2": "muscular female, defined arms and shoulders, disciplined athlete, ",
            "stage3": "muscular female, heavily muscular, massive shoulders, competitive bodybuilder, ",
            "stage4": "muscular female, extremely massive muscles, hulking frame, inhuman muscle mass, "
        },
        "filename": "heroine2"
    },

    "heroine3": {
        "name": "ギャル",
        "stages": ["normal", "stage1", "stage2", "stage3", "stage4"],
        "prompt_base": "score_9, score_8, 1girl, {muscle}gyaru, bright cheerful expression, bleached brown hair with highlights, makeup, decorated school uniform, trendy accessories, full body, white background, simple background, solo, posing, looking at viewer, BREAK, solid white background, plain backdrop",
        "muscle_tags": {
            "normal": "",
            "stage1": "slightly muscular, showing off arms, flexing, ",
            "stage2": "muscular female, fitness model, visible abs, bodybuilder pose, ",
            "stage3": "muscular female, heavily muscular, massive arms flexing, extreme bodybuilder, ",
            "stage4": "muscular female, extremely massive muscles, hulking body, inhuman physique, "
        },
        "filename": "heroine3"
    },

    "heroine4": {
        "name": "オタク",
        "stages": ["normal", "stage1", "stage2", "stage3", "stage4"],
        "prompt_base": "score_9, score_8, 1girl, {muscle}nerdy girl, calm analytical expression, short black hair, large round glasses, lab coat over school uniform, holding notebook, intellectual, full body, white background, simple background, solo, standing pose, looking at viewer, BREAK, solid white background, plain backdrop",
        "muscle_tags": {
            "normal": "petite build, ",
            "stage1": "slightly muscular build, ",
            "stage2": "muscular female, muscular arms and legs, researcher physique, ",
            "stage3": "muscular female, heavily muscular, lab coat barely fitting, ",
            "stage4": "muscular female, extremely massive muscles, torn lab coat, beyond human limits, "
        },
        "filename": "heroine4"
    },

    "heroine5": {
        "name": "格闘技部",
        "stages": ["normal", "stage1", "stage2", "stage3", "stage4"],
        "prompt_base": "score_9, score_8, 1girl, {muscle}female martial artist, determined serious expression, short black hair, athletic uniform, gi, confident fighting stance, full body, white background, simple background, solo, martial arts pose, looking at viewer, BREAK, solid white background, plain backdrop",
        "muscle_tags": {
            "normal": "fit athletic build, ",
            "stage1": "moderately muscular, training stance, ",
            "stage2": "muscular female, powerful arms and legs, champion stance, fighter physique, ",
            "stage3": "muscular female, heavily muscular, overwhelming presence, heavyweight fighter, ",
            "stage4": "muscular female, extremely massive muscles, superhuman fighter, aura of invincibility, "
        },
        "filename": "heroine5"
    },

    "heroine6": {
        "name": "不良",
        "stages": ["normal", "stage1", "stage2", "stage3", "stage4"],
        "prompt_base": "score_9, score_8, 1girl, {muscle}delinquent girl, cool sharp expression, black school uniform, sharp eyes, lone wolf aura, edgy beauty, full body, white background, simple background, solo, standing pose, looking at viewer, BREAK, solid white background, plain backdrop",
        "muscle_tags": {
            "normal": "lean athletic build, ",
            "stage1": "slightly muscular, dangerous aura, ",
            "stage2": "muscular female, overwhelming presence, street fighter physique, ",
            "stage3": "muscular female, heavily muscular, expression of strength and sadness, ",
            "stage4": "muscular female, extremely massive muscles, destroyed uniform, inhuman power, "
        },
        "filename": "heroine6"
    },

    "heroine7": {
        "name": "友達の妹",
        "stages": ["normal", "stage1", "stage2", "stage3", "stage4"],
        "prompt_base": "score_9, score_8, 1girl, {muscle}younger high school girl, sweet shy expression, twin tails brown hair, cute school uniform, adorable, innocent charm, full body, white background, simple background, solo, standing pose, looking at viewer, BREAK, solid white background, plain backdrop",
        "muscle_tags": {
            "normal": "petite cute build, ",
            "stage1": "slightly muscular, trying to hide muscles, nervous expression, ",
            "stage2": "muscular female, unexpected strength, embarrassed expression, ",
            "stage3": "muscular female, heavily muscular, powerful physique, expression of resolve, ",
            "stage4": "muscular female, extremely massive muscles, sweet face with monstrous body, protective stance, "
        },
        "filename": "heroine7"
    },

    "devil": {
        "name": "悪魔",
        "stages": ["normal"],
        "prompt": "score_9, score_8, creature, mascot character, black cat with small demon horns, glowing red eyes, devil tail with arrow tip, black fur, small cute but sinister appearance, floating slightly, mischievous smile, no human features, dark familiar, full body, white background, simple background, solo, BREAK, solid white background, plain backdrop",
        "filename": "devil"
    }
}


def load_base_workflow():
    """ベースワークフローを読み込み"""
    with open(BASE_WORKFLOW_PATH, 'r', encoding='utf-8') as f:
        return json.load(f)


def create_workflow(char_data: dict, stage: str, seed: int = None):
    """キャラクター用のワークフローを生成"""
    if seed is None:
        seed = random.randint(1, 2**62)

    workflow = load_base_workflow()

    # プロンプト設定
    if "prompt" in char_data:
        # 固定プロンプト（主人公、悪魔）
        positive_prompt = char_data["prompt"]
    else:
        # 筋肉タグ付きプロンプト（ヒロイン）
        muscle_tag = char_data["muscle_tags"].get(stage, "")
        positive_prompt = char_data["prompt_base"].format(muscle=muscle_tag)

    # ノード229（ポジティブプロンプト）を更新
    if "229" in workflow:
        workflow["229"]["inputs"]["text"] = positive_prompt

    # ノード75（KSampler）のシードを更新
    if "75" in workflow:
        workflow["75"]["inputs"]["seed"] = seed

    # ノード202（MusctonkXL LoRA）の強度を更新
    if "202" in workflow:
        muscle_strength = MUSCLE_STRENGTH.get(stage, 0.0)
        workflow["202"]["inputs"]["strength_model"] = muscle_strength
        workflow["202"]["inputs"]["strength_clip"] = muscle_strength

    # ノード249（Image Saver）のファイル名とパスを更新
    if "249" in workflow:
        if stage == "normal":
            filename = f"{char_data['filename']}_normal_%seed"
        else:
            filename = f"{char_data['filename']}_{stage}_%seed"
        workflow["249"]["inputs"]["filename"] = filename
        workflow["249"]["inputs"]["path"] = OUTPUT_DIR

    # FaceDetailer（256）のシードも更新
    if "256" in workflow:
        workflow["256"]["inputs"]["seed"] = seed + 1

    return {"prompt": workflow}


def queue_prompt(workflow: dict) -> str:
    """プロンプトをキューに追加"""
    data = json.dumps(workflow).encode('utf-8')
    req = urllib.request.Request(
        f"{COMFYUI_URL}/prompt",
        data=data,
        headers={'Content-Type': 'application/json'}
    )

    with urllib.request.urlopen(req) as response:
        result = json.loads(response.read())
        return result.get('prompt_id')


def get_history(prompt_id: str) -> dict:
    """履歴を取得"""
    with urllib.request.urlopen(f"{COMFYUI_URL}/history/{prompt_id}") as response:
        return json.loads(response.read())


def wait_for_completion(prompt_id: str, timeout: int = 600) -> dict:
    """生成完了を待機"""
    start_time = time.time()
    while time.time() - start_time < timeout:
        history = get_history(prompt_id)
        if prompt_id in history:
            return history[prompt_id]
        time.sleep(2)
    raise TimeoutError(f"Generation timed out after {timeout} seconds")


def check_comfyui():
    """ComfyUIの起動確認"""
    try:
        with urllib.request.urlopen(f"{COMFYUI_URL}/system_stats", timeout=5) as response:
            return True
    except:
        return False


def generate_character(char_id: str, char_data: dict, stage: str):
    """キャラクター画像を生成"""
    print(f"Generating: {char_data['name']} - {stage}")

    # ワークフロー作成
    workflow = create_workflow(char_data, stage)

    # キューに追加
    prompt_id = queue_prompt(workflow)
    print(f"  Queued: {prompt_id}")

    # 完了待機
    try:
        result = wait_for_completion(prompt_id)
        print(f"  Completed!")
        return True
    except TimeoutError as e:
        print(f"  Timeout: {e}")
        return False
    except Exception as e:
        print(f"  Error: {e}")
        return False


def main():
    """メイン処理"""
    # ComfyUI起動確認
    print("Checking ComfyUI...")
    if not check_comfyui():
        print("ERROR: ComfyUI is not running!")
        print("Please start ComfyUI first: cd C:\\ComfyUI1 && python main.py")
        return

    print("ComfyUI is running!")

    # 出力ディレクトリ作成
    os.makedirs(OUTPUT_DIR, exist_ok=True)

    print("=" * 60)
    print("キャラクター画像生成開始")
    print(f"出力先: {OUTPUT_DIR}")
    print("=" * 60)

    total = sum(len(c['stages']) for c in CHARACTERS.values())
    current = 0
    success = 0
    failed = 0

    for char_id, char_data in CHARACTERS.items():
        for stage in char_data['stages']:
            current += 1
            print(f"\n[{current}/{total}] ", end="")

            try:
                if generate_character(char_id, char_data, stage):
                    success += 1
                else:
                    failed += 1
                time.sleep(3)  # サーバー負荷軽減
            except Exception as e:
                print(f"  Error: {e}")
                failed += 1
                continue

    print("\n" + "=" * 60)
    print("生成完了!")
    print(f"成功: {success} / 失敗: {failed} / 合計: {total}")
    print(f"出力先: {OUTPUT_DIR}")
    print("=" * 60)


def generate_single(char_id: str, stage: str = "normal"):
    """単一キャラクターを生成（テスト用）"""
    if char_id not in CHARACTERS:
        print(f"Unknown character: {char_id}")
        print(f"Available: {list(CHARACTERS.keys())}")
        return

    if not check_comfyui():
        print("ERROR: ComfyUI is not running!")
        return

    os.makedirs(OUTPUT_DIR, exist_ok=True)
    generate_character(char_id, CHARACTERS[char_id], stage)


if __name__ == "__main__":
    import sys
    if len(sys.argv) > 1:
        # 引数指定で単一生成
        char_id = sys.argv[1]
        stage = sys.argv[2] if len(sys.argv) > 2 else "normal"
        generate_single(char_id, stage)
    else:
        # 全キャラクター生成
        main()
