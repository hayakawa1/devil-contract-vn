"""
ComfyUI API を使用した表情バリエーション生成スクリプト
既存のキャラクター画像をControlNet参照として使用し、表情のみ変更
"""

import json
import urllib.request
import urllib.parse
import time
import os
import random
import shutil
import glob

# ComfyUI API設定
COMFYUI_URL = "http://127.0.0.1:8188"
OUTPUT_DIR = r"C:\ComfyUI1\output\akuma_characters_v2"
COMFYUI_INPUT_DIR = r"C:\ComfyUI1\input"
BASE_WORKFLOW_PATH = r"c:\Users\hayak\Dropbox\悪魔との契約\tools\base_workflow.json"

# 筋肉レベル設定（C:\ComfyUI1の設定準拠）
MUSCLE_CONFIG = {
    "neutral": {
        "musctonk": 0.0,
        "bigpecs": 0.0,
        "last": 0.0,
        "muscle_prompt": "",
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

# 表情定義
EXPRESSIONS = {
    "smile": {
        "name": "笑顔",
        "prompt_add": "happy smile, cheerful expression, bright eyes",
        "face_prompt": "happy smiling face, bright expression"
    },
    "crying": {
        "name": "泣き顔",
        "prompt_add": "crying, tears streaming down face, tearful eyes, sad expression",
        "face_prompt": "crying face, tears, sad eyes"
    },
    "angry": {
        "name": "怒り",
        "prompt_add": "angry expression, furrowed brows, intense eyes, scowling",
        "face_prompt": "angry face, furrowed eyebrows, intense look"
    },
    "blush": {
        "name": "照れ",
        "prompt_add": "blushing, embarrassed expression, shy smile, red cheeks",
        "face_prompt": "blushing face, red cheeks, shy expression"
    },
    "surprised": {
        "name": "驚き",
        "prompt_add": "surprised expression, wide eyes, open mouth, shocked",
        "face_prompt": "surprised face, wide open eyes, shocked expression"
    },
    "sad": {
        "name": "悲しみ",
        "prompt_add": "sad expression, downcast eyes, melancholic, lonely",
        "face_prompt": "sad face, downcast eyes, melancholic expression"
    }
}

# キャラクター定義（表情を付ける対象）- 3段階
CHARACTERS = {
    "protagonist": {
        "name": "主人公",
        "base_prompt": "score_9, score_8, 1boy, male high school student, black gakuran uniform, handsome face, black hair, standing pose, full body, white background, simple background, solo, looking at viewer, BREAK, solid white background, plain backdrop",
        "filename": "protagonist",
        "stages": ["neutral"]
    },
    "heroine1": {
        "name": "幼なじみ",
        "base_prompt": "score_9, score_8, 1girl, long brown hair, school uniform, sailor uniform with red ribbon, warm personality, full body, white background, simple background, solo, standing pose, looking at viewer, BREAK, solid white background, plain backdrop",
        "filename": "heroine1",
        "stages": ["neutral", "stage1", "stage2"]
    },
    "heroine2": {
        "name": "生徒会長",
        "base_prompt": "score_9, score_8, 1girl, long black hair, ponytail, red glasses, student council president, elegant uniform with armband, dignified posture, full body, white background, simple background, solo, standing pose, looking at viewer, BREAK, solid white background, plain backdrop",
        "filename": "heroine2",
        "stages": ["neutral", "stage1", "stage2"]
    },
    "heroine3": {
        "name": "ギャル",
        "base_prompt": "score_9, score_8, 1girl, gyaru, bleached brown hair with highlights, makeup, decorated school uniform, trendy accessories, full body, white background, simple background, solo, posing, looking at viewer, BREAK, solid white background, plain backdrop",
        "filename": "heroine3",
        "stages": ["neutral", "stage1", "stage2"]
    },
    "heroine4": {
        "name": "オタク",
        "base_prompt": "score_9, score_8, 1girl, nerdy girl, short black hair, large round glasses, lab coat over school uniform, holding notebook, intellectual, full body, white background, simple background, solo, standing pose, looking at viewer, BREAK, solid white background, plain backdrop",
        "filename": "heroine4",
        "stages": ["neutral", "stage1", "stage2"]
    },
    "heroine5": {
        "name": "格闘技部",
        "base_prompt": "score_9, score_8, 1girl, female martial artist, short black hair, athletic uniform, gi, confident fighting stance, full body, white background, simple background, solo, martial arts pose, looking at viewer, BREAK, solid white background, plain backdrop",
        "filename": "heroine5",
        "stages": ["neutral", "stage1", "stage2"]
    },
    "heroine6": {
        "name": "不良",
        "base_prompt": "score_9, score_8, 1girl, delinquent girl, black school uniform, sharp eyes, lone wolf aura, edgy beauty, high school student, no weapons, empty hands, school setting, full body, white background, simple background, solo, standing pose, looking at viewer, BREAK, solid white background, plain backdrop",
        "filename": "heroine6",
        "stages": ["neutral", "stage1", "stage2"]
    },
    "heroine7": {
        "name": "友達の妹",
        "base_prompt": "score_9, score_8, 1girl, younger high school girl, twin tails brown hair, cute school uniform, adorable, innocent charm, full body, white background, simple background, solo, standing pose, looking at viewer, BREAK, solid white background, plain backdrop",
        "filename": "heroine7",
        "stages": ["neutral", "stage1", "stage2"]
    },
    "devil": {
        "name": "悪魔",
        "base_prompt": "score_9, score_8, creature, mascot character, black cat with small demon horns, glowing red eyes, devil tail with arrow tip, black fur, small cute but sinister appearance, floating slightly, no human features, dark familiar, full body, white background, simple background, solo, BREAK, solid white background, plain backdrop",
        "filename": "devil",
        "stages": ["neutral"]
    }
}


def load_base_workflow():
    with open(BASE_WORKFLOW_PATH, 'r', encoding='utf-8') as f:
        return json.load(f)


def get_reference_image(char_filename: str, stage: str) -> str:
    """参照画像を取得"""
    pattern = os.path.join(OUTPUT_DIR, f"{char_filename}_{stage}_*.png")
    files = glob.glob(pattern)
    if files:
        return max(files, key=os.path.getctime)
    return None


def file_exists(char_filename: str, stage: str, expression: str) -> bool:
    """指定の表情ファイルが既に存在するか確認"""
    pattern = os.path.join(OUTPUT_DIR, f"{char_filename}_{stage}_{expression}_*.png")
    files = glob.glob(pattern)
    return len(files) > 0


def create_expression_workflow(char_data: dict, stage: str, expression: str,
                                expression_data: dict, reference_image: str, seed: int = None):
    """表情バリエーション用のワークフローを生成（3段階筋肉システム）"""
    if seed is None:
        seed = random.randint(1, 2**62)

    workflow = load_base_workflow()

    # 筋肉設定を取得
    config = MUSCLE_CONFIG.get(stage, MUSCLE_CONFIG["neutral"])

    # プロンプトに表情と筋肉を追加
    base_prompt = char_data["base_prompt"]
    expression_prompt = expression_data["prompt_add"]
    muscle_prompt = config["muscle_prompt"]

    if muscle_prompt:
        full_prompt = f"{base_prompt}, {expression_prompt}, {muscle_prompt}"
    else:
        full_prompt = f"{base_prompt}, {expression_prompt}"

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

    # FaceDetailerの表情プロンプトを変更
    if "267" in workflow:
        workflow["267"]["inputs"]["text"] = expression_data["face_prompt"]

    # ファイル名設定
    if "249" in workflow:
        workflow["249"]["inputs"]["filename"] = f"{char_data['filename']}_{stage}_{expression}_%seed"
        workflow["249"]["inputs"]["path"] = OUTPUT_DIR

    # FaceDetailerのシード
    if "256" in workflow:
        workflow["256"]["inputs"]["seed"] = seed + 1

    # ControlNet OpenPose ノード追加
    workflow['500'] = {
        'class_type': 'LoadImage',
        'inputs': {'image': reference_image}
    }

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

    workflow['502'] = {
        'class_type': 'ControlNetLoader',
        'inputs': {'control_net_name': 'xinsir-controlnet-openpose-sdxl-1.0.safetensors'}
    }

    workflow['503'] = {
        'class_type': 'ControlNetApplyAdvanced',
        'inputs': {
            'strength': 0.75,
            'start_percent': 0.0,
            'end_percent': 1.0,
            'positive': ['229', 0],
            'negative': ['230', 0],
            'control_net': ['502', 0],
            'image': ['501', 0]
        }
    }

    # KSamplerをControlNet経由に
    if "75" in workflow:
        workflow['75']['inputs']['positive'] = ['503', 0]
        workflow['75']['inputs']['negative'] = ['503', 1]

    return {"prompt": workflow}, seed


def queue_prompt(workflow: dict) -> str:
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
    with urllib.request.urlopen(f"{COMFYUI_URL}/history/{prompt_id}") as response:
        return json.loads(response.read())


def wait_for_completion(prompt_id: str, timeout: int = 600) -> dict:
    start_time = time.time()
    while time.time() - start_time < timeout:
        history = get_history(prompt_id)
        if prompt_id in history:
            return history[prompt_id]
        time.sleep(2)
    raise TimeoutError(f"Generation timed out after {timeout} seconds")


def check_comfyui():
    try:
        with urllib.request.urlopen(f"{COMFYUI_URL}/system_stats", timeout=5) as response:
            return True
    except:
        return False


def copy_to_comfyui_input(src_path: str) -> str:
    filename = os.path.basename(src_path)
    dst_path = os.path.join(COMFYUI_INPUT_DIR, filename)
    shutil.copy2(src_path, dst_path)
    return filename


def main():
    print("Checking ComfyUI...")
    if not check_comfyui():
        print("ERROR: ComfyUI is not running!")
        return

    print("ComfyUI is running!")
    os.makedirs(OUTPUT_DIR, exist_ok=True)

    print("=" * 70)
    print("表情バリエーション生成")
    print("=" * 70)
    print()

    generated = 0
    skipped = 0
    errors = 0

    for char_id, char_data in CHARACTERS.items():
        print(f"\n【{char_data['name']}】")
        print("-" * 50)

        for stage in char_data['stages']:
            # 参照画像を取得
            reference_path = get_reference_image(char_data['filename'], stage)
            if not reference_path:
                print(f"  {stage}: 参照画像なし、スキップ")
                continue

            reference_filename = copy_to_comfyui_input(reference_path)
            print(f"  {stage} (参照: {os.path.basename(reference_path)})")

            for expr_id, expr_data in EXPRESSIONS.items():
                # 既存ファイルチェック
                if file_exists(char_data['filename'], stage, expr_id):
                    print(f"    {expr_data['name']}... スキップ (既存)")
                    skipped += 1
                    continue

                print(f"    {expr_data['name']}...", end=" ", flush=True)

                try:
                    workflow, seed = create_expression_workflow(
                        char_data, stage, expr_id, expr_data, reference_filename
                    )
                    prompt_id = queue_prompt(workflow)
                    wait_for_completion(prompt_id)
                    print("完了")
                    generated += 1
                except Exception as e:
                    print(f"エラー: {e}")
                    errors += 1

                time.sleep(2)

    print()
    print("=" * 70)
    print(f"生成完了! 新規: {generated} / スキップ: {skipped} / エラー: {errors}")
    print(f"出力先: {OUTPUT_DIR}")
    print("=" * 70)


if __name__ == "__main__":
    main()
