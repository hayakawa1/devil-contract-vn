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
BASE_WORKFLOW_PATH = r"c:\Users\hayak\Dropbox\悪魔との契約\base_workflow.json"

# 筋肉レベル別の last.safetensors 強度設定
# ※ MusctonkXLは固定（0.6）、last.safetensorsの強度で調整
MUSCLE_STRENGTH = {
    "normal": 1.0,      # 基準（通常）
    "stage1": 1.3,      # うっすら筋肉
    "stage2": 1.6,      # バランス型・主人公の理想
    "stage3": 2.0,      # 明らかに人間離れ
    "stage4": 2.5,      # 完全に人外
}

# キャラクター定義（筋肉タグは削除 - LoRAで制御するため）
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
        "prompt": "score_9, score_8, 1girl, gentle expression, long brown hair, soft smile, school uniform, sailor uniform with red ribbon, warm personality, full body, white background, simple background, solo, standing pose, looking at viewer, BREAK, solid white background, plain backdrop",
        "filename": "heroine1"
    },

    "heroine2": {
        "name": "生徒会長",
        "stages": ["normal", "stage1", "stage2", "stage3", "stage4"],
        "prompt": "score_9, score_8, 1girl, serious expression, long black hair, ponytail, red glasses, student council president, elegant uniform with armband, dignified posture, full body, white background, simple background, solo, standing pose, looking at viewer, BREAK, solid white background, plain backdrop",
        "filename": "heroine2"
    },

    "heroine3": {
        "name": "ギャル",
        "stages": ["normal", "stage1", "stage2", "stage3", "stage4"],
        "prompt": "score_9, score_8, 1girl, gyaru, bright cheerful expression, bleached brown hair with highlights, makeup, decorated school uniform, trendy accessories, full body, white background, simple background, solo, posing, looking at viewer, BREAK, solid white background, plain backdrop",
        "filename": "heroine3"
    },

    "heroine4": {
        "name": "オタク",
        "stages": ["normal", "stage1", "stage2", "stage3", "stage4"],
        "prompt": "score_9, score_8, 1girl, nerdy girl, calm analytical expression, short black hair, large round glasses, lab coat over school uniform, holding notebook, intellectual, full body, white background, simple background, solo, standing pose, looking at viewer, BREAK, solid white background, plain backdrop",
        "filename": "heroine4"
    },

    "heroine5": {
        "name": "格闘技部",
        "stages": ["normal", "stage1", "stage2", "stage3", "stage4"],
        "prompt": "score_9, score_8, 1girl, female martial artist, determined serious expression, short black hair, athletic uniform, gi, confident fighting stance, full body, white background, simple background, solo, martial arts pose, looking at viewer, BREAK, solid white background, plain backdrop",
        "filename": "heroine5"
    },

    "heroine6": {
        "name": "不良",
        "stages": ["normal", "stage1", "stage2", "stage3", "stage4"],
        "prompt": "score_9, score_8, 1girl, delinquent girl, cool sharp expression, black school uniform, sharp eyes, lone wolf aura, edgy beauty, full body, white background, simple background, solo, standing pose, looking at viewer, BREAK, solid white background, plain backdrop",
        "filename": "heroine6"
    },

    "heroine7": {
        "name": "友達の妹",
        "stages": ["normal", "stage1", "stage2", "stage3", "stage4"],
        "prompt": "score_9, score_8, 1girl, younger high school girl, sweet shy expression, twin tails brown hair, cute school uniform, adorable, innocent charm, full body, white background, simple background, solo, standing pose, looking at viewer, BREAK, solid white background, plain backdrop",
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


def create_normal_workflow(char_data: dict, seed: int = None):
    """通常版（Stage 0）用のワークフローを生成"""
    if seed is None:
        seed = random.randint(1, 2**62)

    workflow = load_base_workflow()

    # プロンプト設定
    if "229" in workflow:
        workflow["229"]["inputs"]["text"] = char_data["prompt"]

    # シード設定
    if "75" in workflow:
        workflow["75"]["inputs"]["seed"] = seed

    # MusctonkXL を 0（筋肉なし）に設定
    if "202" in workflow:
        workflow["202"]["inputs"]["strength_model"] = 0.0
        workflow["202"]["inputs"]["strength_clip"] = 0.0

    # last.safetensors を基準強度に
    if "237" in workflow:
        workflow["237"]["inputs"]["strength_model"] = 1.0
        workflow["237"]["inputs"]["strength_clip"] = 1.0

    # ファイル名設定
    if "249" in workflow:
        workflow["249"]["inputs"]["filename"] = f"{char_data['filename']}_normal_%seed"
        workflow["249"]["inputs"]["path"] = OUTPUT_DIR

    # FaceDetailerのシードも設定
    if "256" in workflow:
        workflow["256"]["inputs"]["seed"] = seed + 1

    return {"prompt": workflow}, seed


def create_muscle_variation_workflow(char_data: dict, stage: str, reference_image: str, seed: int = None):
    """
    筋肉バリエーション用のワークフローを生成
    ControlNet OpenPoseで参照画像のポーズを固定
    """
    if seed is None:
        seed = random.randint(1, 2**62)

    workflow = load_base_workflow()

    # プロンプト設定（通常版と同じ）
    if "229" in workflow:
        workflow["229"]["inputs"]["text"] = char_data["prompt"]

    # シード設定
    if "75" in workflow:
        workflow["75"]["inputs"]["seed"] = seed

    # MusctonkXL を固定強度に
    if "202" in workflow:
        workflow["202"]["inputs"]["strength_model"] = 0.6
        workflow["202"]["inputs"]["strength_clip"] = 0.6

    # last.safetensors の強度を筋肉レベルに応じて変更
    muscle_strength = MUSCLE_STRENGTH.get(stage, 1.0)
    if "237" in workflow:
        workflow["237"]["inputs"]["strength_model"] = muscle_strength
        workflow["237"]["inputs"]["strength_clip"] = muscle_strength

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
    pattern = os.path.join(OUTPUT_DIR, f"{char_filename}_normal_*.png")
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
    print("キャラクター画像生成 V2 - ControlNet OpenPose同一性維持版")
    print("=" * 70)
    print()

    # ========== Stage 1: 通常版を生成 ==========
    print("【Stage 1】通常版を生成中...")
    print("-" * 70)

    normal_images = {}  # キャラID -> 通常版画像ファイル名

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
                normal_images[char_id] = latest_file
        except Exception as e:
            print(f"エラー: {e}")

        time.sleep(2)

    print()
    print(f"通常版生成完了: {len(normal_images)}/{len(CHARACTERS)} キャラクター")
    print()

    # ========== Stage 2: 筋肉バリエーションを生成 ==========
    print("【Stage 2】筋肉バリエーションを生成中...")
    print("-" * 70)

    for char_id, char_data in CHARACTERS.items():
        # 通常版のみのキャラクターはスキップ
        if char_data['stages'] == ["normal"]:
            continue

        # 参照画像を取得
        if char_id not in normal_images:
            print(f"  {char_data['name']}: 通常版がないためスキップ")
            continue

        # 参照画像をComfyUIのinputフォルダにコピー
        reference_path = normal_images[char_id]
        reference_filename = copy_to_comfyui_input(reference_path)
        print(f"  {char_data['name']} (参照: {reference_filename})")

        for stage in char_data['stages']:
            if stage == "normal":
                continue  # 通常版は既に生成済み

            print(f"    {stage}...", end=" ")

            workflow, seed = create_muscle_variation_workflow(
                char_data, stage, reference_filename
            )
            prompt_id = queue_prompt(workflow)

            try:
                wait_for_completion(prompt_id)
                print(f"完了 (last={MUSCLE_STRENGTH[stage]})")
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
