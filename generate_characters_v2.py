"""
ComfyUI API を使用したキャラクター画像自動生成スクリプト V2
ゲーム「悪魔との契約」用 - ControlNet OpenPoseで同一性維持版

方式:
1. 各キャラクターの「通常版」を生成
2. 通常版をControlNet OpenPoseの参照画像として使用
3. last.safetensorsの強度のみ変更して筋肉量を調整
"""

import json
import urllib.request
import urllib.parse
import time
import os
import random
import shutil

# ComfyUI API設定
COMFYUI_URL = "http://127.0.0.1:8188"
OUTPUT_DIR = r"C:\ComfyUI1\output\akuma_characters_v2"
COMFYUI_INPUT_DIR = r"C:\ComfyUI1\input"

# ベースワークフロー
BASE_WORKFLOW_PATH = r"c:\Users\hayak\Dropbox\悪魔との契約\tools\base_workflow.json"

# 筋肉レベル設定（C:\ComfyUI1の設定準拠）
# MusctonkXL, BigPecsGirl, last.safetensors, 筋肉プロンプトを組み合わせて制御
MUSCLE_CONFIG = {
    "neutral": {
        "musctonk": 0.0,
        "bigpecs": 0.0,
        "last": 0.0,
        "muscle_prompt": "",  # 筋肉プロンプトなし
    },
    "stage1": {
        "musctonk": 0.6,
        "bigpecs": 0.1,
        "last": 1.0,
        "muscle_prompt": "(muscular:1.2), (abs:1.1), toned arms, fit body",
    },
    "stage2": {
        "musctonk": 1.0,
        "bigpecs": 0.2,
        "last": 1.0,
        "muscle_prompt": "(extremely muscular:1.5), (huge muscles:1.4), bodybuilder, massive biceps, huge abs",
    },
}

# キャラクター定義（筋肉タグは削除 - LoRAで制御するため）
# 固定シードで一貫性を保つ
CHARACTERS = {
    "protagonist": {
        "name": "主人公",
        "stages": ["normal"],
        "prompt": "score_9, score_8, 1boy, male high school student, black gakuran uniform, handsome face, black hair, friendly smile, standing pose, full body, white background, simple background, solo, looking at viewer, BREAK, solid white background, plain backdrop",
        "filename": "protagonist",
        "seed": 1001001001001001  # 固定シード
    },

    "heroine1": {
        "name": "幼なじみ",
        "stages": ["neutral", "stage1", "stage2"],
        "prompt": "score_9, score_8, 1girl, gentle expression, long straight brown hair, soft smile, warm personality, navy blue sailor school uniform with white blouse and red ribbon tie, pleated skirt, standard high school uniform, full body, white background, simple background, solo, standing pose, looking at viewer, BREAK, solid white background, plain backdrop",
        "filename": "heroine1",
        "seed": 2002002002002002  # 固定シード
    },

    "heroine2": {
        "name": "生徒会長",
        "stages": ["neutral", "stage1", "stage2"],
        "prompt": "score_9, score_8, 1girl, serious expression, long straight black hair in ponytail, red glasses, dignified posture, navy blue sailor school uniform with white blouse and red ribbon tie, pleated skirt, standard high school uniform, full body, white background, simple background, solo, standing pose, looking at viewer, BREAK, solid white background, plain backdrop",
        "filename": "heroine2",
        "seed": 3003003003003003  # 固定シード
    },

    "heroine3": {
        "name": "ギャル",
        "stages": ["neutral", "stage1", "stage2"],
        "prompt": "score_9, score_8, 1girl, bright cheerful expression, bleached light brown hair with subtle highlights, makeup, navy blue sailor school uniform with white blouse and red ribbon tie, pleated skirt, standard high school uniform, full body, white background, simple background, solo, standing pose, looking at viewer, BREAK, solid white background, plain backdrop",
        "filename": "heroine3",
        "seed": 4004004004004004  # 固定シード
    },

    "heroine4": {
        "name": "オタク",
        "stages": ["neutral", "stage1", "stage2"],
        "prompt": "score_9, score_8, 1girl, calm analytical expression, short black hair, large round glasses, intellectual, navy blue sailor school uniform with white blouse and red ribbon tie, pleated skirt, standard high school uniform, full body, white background, simple background, solo, standing pose, looking at viewer, BREAK, solid white background, plain backdrop",
        "filename": "heroine4",
        "seed": 5005005005005005  # 固定シード
    },

    "heroine5": {
        "name": "格闘技部",
        "stages": ["neutral", "stage1", "stage2"],
        "prompt": "score_9, score_8, 1girl, determined serious expression, short black hair, confident stance, navy blue sailor school uniform with white blouse and red ribbon tie, pleated skirt, standard high school uniform, full body, white background, simple background, solo, standing pose, looking at viewer, BREAK, solid white background, plain backdrop",
        "filename": "heroine5",
        "seed": 6006006006006006  # 固定シード
    },

    "heroine6": {
        "name": "不良",
        "stages": ["neutral", "stage1", "stage2"],
        "prompt": "score_9, score_8, 1girl, cool sharp expression, long straight black hair, sharp eyes, lone wolf aura, edgy beauty, high school student, navy blue sailor school uniform with white blouse and red ribbon tie, pleated skirt, standard high school uniform, no weapons, empty hands, school setting, full body, white background, simple background, solo, standing pose, looking at viewer, BREAK, solid white background, plain backdrop",
        "filename": "heroine6",
        "seed": 7007007007007007  # 固定シード
    },

    "heroine7": {
        "name": "友達の妹",
        "stages": ["neutral", "stage1", "stage2"],
        "prompt": "score_9, score_8, 1girl, sweet shy expression, twin tails brown hair, adorable, innocent charm, navy blue sailor school uniform with white blouse and red ribbon tie, pleated skirt, standard high school uniform, full body, white background, simple background, solo, standing pose, looking at viewer, BREAK, solid white background, plain backdrop",
        "filename": "heroine7",
        "seed": 8008008008008008  # 固定シード
    },

    "devil": {
        "name": "悪魔",
        "stages": ["neutral"],
        "prompt": "score_9, score_8, creature, mascot character, black cat with small demon horns, glowing red eyes, devil tail with arrow tip, black fur, small cute but sinister appearance, floating slightly, mischievous smile, no human features, dark familiar, full body, white background, simple background, solo, BREAK, solid white background, plain backdrop",
        "filename": "devil",
        "seed": 9009009009009009  # 固定シード
    }
}


def load_base_workflow():
    """ベースワークフローを読み込み"""
    with open(BASE_WORKFLOW_PATH, 'r', encoding='utf-8') as f:
        return json.load(f)


def create_normal_workflow(char_data: dict, seed: int = None):
    """neutral版（筋肉なし）用のワークフローを生成"""
    # キャラクター固定シードを使用（一貫性のため）
    if seed is None:
        seed = char_data.get("seed", random.randint(1, 2**62))

    workflow = load_base_workflow()

    # プロンプト設定
    if "229" in workflow:
        workflow["229"]["inputs"]["text"] = char_data["prompt"]

    # シード設定
    if "75" in workflow:
        workflow["75"]["inputs"]["seed"] = seed

    # neutral版の筋肉設定
    config = MUSCLE_CONFIG["neutral"]

    # MusctonkXL を 0（筋肉なし）に設定
    if "202" in workflow:
        workflow["202"]["inputs"]["strength_model"] = config["musctonk"]
        workflow["202"]["inputs"]["strength_clip"] = config["musctonk"]

    # BigPecsGirl を設定（ノード234）
    if "234" in workflow:
        workflow["234"]["inputs"]["strength_model"] = config["bigpecs"]
        workflow["234"]["inputs"]["strength_clip"] = config["bigpecs"]

    # last.safetensors も 0（筋肉なし）に設定
    if "237" in workflow:
        workflow["237"]["inputs"]["strength_model"] = config["last"]
        workflow["237"]["inputs"]["strength_clip"] = config["last"]

    # ファイル名設定（neutralに変更）
    if "249" in workflow:
        workflow["249"]["inputs"]["filename"] = f"{char_data['filename']}_neutral_%seed"
        workflow["249"]["inputs"]["path"] = OUTPUT_DIR

    # FaceDetailerのシードも設定
    if "256" in workflow:
        workflow["256"]["inputs"]["seed"] = seed + 1

    return {"prompt": workflow}, seed


def create_muscle_variation_workflow(char_data: dict, stage: str, reference_image: str, seed: int = None):
    """
    筋肉バリエーション用のワークフローを生成
    ControlNet OpenPoseで参照画像のポーズを固定
    MusctonkXL, BigPecsGirl, last.safetensors, 筋肉プロンプトで筋肉量を制御
    """
    # キャラクター固定シードを使用（一貫性のため）
    if seed is None:
        seed = char_data.get("seed", random.randint(1, 2**62))

    workflow = load_base_workflow()

    # 筋肉設定を取得
    config = MUSCLE_CONFIG.get(stage, MUSCLE_CONFIG["neutral"])

    # プロンプト設定（キャラプロンプト + 筋肉プロンプト）
    base_prompt = char_data["prompt"]
    muscle_prompt = config["muscle_prompt"]
    if muscle_prompt:
        full_prompt = f"{base_prompt}, {muscle_prompt}"
    else:
        full_prompt = base_prompt

    if "229" in workflow:
        workflow["229"]["inputs"]["text"] = full_prompt

    # シード設定
    if "75" in workflow:
        workflow["75"]["inputs"]["seed"] = seed

    # MusctonkXL を設定
    if "202" in workflow:
        workflow["202"]["inputs"]["strength_model"] = config["musctonk"]
        workflow["202"]["inputs"]["strength_clip"] = config["musctonk"]

    # BigPecsGirl を設定（ノード234）
    if "234" in workflow:
        workflow["234"]["inputs"]["strength_model"] = config["bigpecs"]
        workflow["234"]["inputs"]["strength_clip"] = config["bigpecs"]

    # last.safetensors を設定
    if "237" in workflow:
        workflow["237"]["inputs"]["strength_model"] = config["last"]
        workflow["237"]["inputs"]["strength_clip"] = config["last"]

    # ファイル名設定
    if "249" in workflow:
        workflow["249"]["inputs"]["filename"] = f"{char_data['filename']}_{stage}_%seed"
        workflow["249"]["inputs"]["path"] = OUTPUT_DIR

    # FaceDetailerのシードも設定
    if "256" in workflow:
        workflow["256"]["inputs"]["seed"] = seed + 1

    # === ControlNet OpenPose ノードを追加 ===

    # 500: 参照画像をロード
    workflow['500'] = {
        'class_type': 'LoadImage',
        'inputs': {
            'image': reference_image
        }
    }

    # 501: OpenPose抽出
    workflow['501'] = {
        'class_type': 'DWPreprocessor',
        'inputs': {
            'detect_hand': 'enable',
            'detect_body': 'enable',
            'detect_face': 'enable',
            'resolution': 1024,
            'image': ['500', 0]
        }
    }

    # 502: OpenPose ControlNet ロード
    workflow['502'] = {
        'class_type': 'ControlNetLoader',
        'inputs': {
            'control_net_name': 'xinsir-controlnet-openpose-sdxl-1.0.safetensors'
        }
    }

    # 503: ControlNet OpenPose 適用
    workflow['503'] = {
        'class_type': 'ControlNetApplyAdvanced',
        'inputs': {
            'strength': 0.75,  # ポーズを維持しつつ自由度も残す
            'start_percent': 0.0,
            'end_percent': 1.0,
            'positive': ['229', 0],
            'negative': ['230', 0],
            'control_net': ['502', 0],
            'image': ['501', 0]
        }
    }

    # KSamplerの入力をControlNet適用後に変更
    if "75" in workflow:
        workflow['75']['inputs']['positive'] = ['503', 0]
        workflow['75']['inputs']['negative'] = ['503', 1]

    return {"prompt": workflow}, seed


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


def get_latest_output_file(char_filename: str) -> str:
    """最新の出力ファイルを取得"""
    import glob
    pattern = os.path.join(OUTPUT_DIR, f"{char_filename}_neutral_*.png")
    files = glob.glob(pattern)
    if files:
        return max(files, key=os.path.getctime)
    return None


def copy_to_comfyui_input(src_path: str) -> str:
    """画像をComfyUIのinputフォルダにコピー"""
    filename = os.path.basename(src_path)
    dst_path = os.path.join(COMFYUI_INPUT_DIR, filename)
    shutil.copy2(src_path, dst_path)
    return filename


def main():
    """メイン処理 - 2段階生成"""
    # ComfyUI起動確認
    print("Checking ComfyUI...")
    if not check_comfyui():
        print("ERROR: ComfyUI is not running!")
        print("Please start ComfyUI first")
        return

    print("ComfyUI is running!")

    # 出力ディレクトリ作成
    os.makedirs(OUTPUT_DIR, exist_ok=True)

    print("=" * 70)
    print("キャラクター画像生成 V3 - 3段階筋肉システム")
    print("=" * 70)
    print()

    # ========== Stage 1: neutral版を生成 ==========
    print("【Stage 1】neutral版（筋肉なし）を生成中...")
    print("-" * 70)

    neutral_images = {}  # キャラID -> neutral版画像ファイル名

    for char_id, char_data in CHARACTERS.items():
        print(f"  {char_data['name']}...", end=" ")

        workflow, seed = create_normal_workflow(char_data)
        prompt_id = queue_prompt(workflow)

        try:
            wait_for_completion(prompt_id)
            print(f"完了 (seed: {seed})")

            # 生成された画像を記録
            time.sleep(1)  # ファイル書き込み待ち
            latest_file = get_latest_output_file(char_data['filename'])
            if latest_file:
                neutral_images[char_id] = latest_file
        except Exception as e:
            print(f"エラー: {e}")

        time.sleep(2)

    print()
    print(f"neutral版生成完了: {len(neutral_images)}/{len(CHARACTERS)} キャラクター")
    print()

    # ========== Stage 2: 筋肉バリエーションを生成 ==========
    print("【Stage 2】筋肉バリエーション（stage1/stage2）を生成中...")
    print("-" * 70)

    for char_id, char_data in CHARACTERS.items():
        # neutral版のみのキャラクターはスキップ
        if len(char_data['stages']) == 1:
            continue

        # 参照画像を取得
        if char_id not in neutral_images:
            print(f"  {char_data['name']}: neutral版がないためスキップ")
            continue

        # 参照画像をComfyUIのinputフォルダにコピー
        reference_path = neutral_images[char_id]
        reference_filename = copy_to_comfyui_input(reference_path)
        print(f"  {char_data['name']} (参照: {reference_filename})")

        for stage in char_data['stages']:
            if stage == "neutral":
                continue  # neutral版は既に生成済み

            print(f"    {stage}...", end=" ")

            workflow, seed = create_muscle_variation_workflow(
                char_data, stage, reference_filename
            )
            prompt_id = queue_prompt(workflow)

            try:
                wait_for_completion(prompt_id)
                cfg = MUSCLE_CONFIG[stage]
                print(f"完了 (MusctonkXL={cfg['musctonk']}, BigPecs={cfg['bigpecs']}, last={cfg['last']})")
            except Exception as e:
                print(f"エラー: {e}")

            time.sleep(2)

    print()
    print("=" * 70)
    print("生成完了!")
    print(f"出力先: {OUTPUT_DIR}")
    print("=" * 70)


if __name__ == "__main__":
    main()
