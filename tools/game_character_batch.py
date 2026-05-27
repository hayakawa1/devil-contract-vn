#!/usr/bin/env python3
"""
ゲーム用キャラクター画像生成（バッチ版）
- 全キャラクター・全体型・全表情を一括生成
- テキストプロンプトのみで生成
- LoRAでキャラクターの特徴を再現
- 体型を変化（neutral → stage1 → stage2）
"""

import requests
import json
import time
import random
import os
import sys
import concurrent.futures

# キャラクター定義
CHARACTERS = {
    "gyaru": {
        "name": "ギャル",
        "features": "blonde hair, pink hair, fashionable, tan skin, trendy, cute",
        "eye_color": "pink eyes",
        "hair_style": "long blonde hair, pigtails, twin tails"
    },
    "furyo": {
        "name": "不良",
        "features": "black hair, delinquent, punk, rebel",
        "eye_color": "red eyes",
        "hair_style": "short black hair, messy hair"
    },
    "imouto": {
        "name": "妹",
        "features": "young, small, cute, innocent, petite",
        "eye_color": "blue eyes",
        "hair_style": "short brown hair, cute hair"
    },
    "kakutogi": {
        "name": "格闘家",
        "features": "fighter, martial artist, athletic, strong",
        "eye_color": "green eyes",
        "hair_style": "short silver hair, spiky hair"
    },
    "osananajimi": {
        "name": "幼馴染",
        "features": "childhood friend, familiar, warm, gentle",
        "eye_color": "honey eyes, amber eyes",
        "hair_style": "medium brown hair, ponytail"
    },
    "akuma": {
        "name": "悪魔",
        "features": "demon, supernatural, mysterious, powerful",
        "eye_color": "purple eyes, glowing eyes",
        "hair_style": "long black hair, elegant hair"
    }
}

# 表情定義
EXPRESSIONS = {
    "neutral": {
        "name": "通常",
        "prompt": "neutral expression, calm, serene"
    },
    "smile": {
        "name": "笑顔",
        "prompt": "smiling, happy, cheerful"
    },
    "blush": {
        "name": "照れ",
        "prompt": "blushing, shy, embarrassed"
    },
    "angry": {
        "name": "怒り",
        "prompt": "angry expression, irritated"
    },
    "sad": {
        "name": "悲しみ",
        "prompt": "sad expression, melancholic"
    },
    "crying": {
        "name": "泣き",
        "prompt": "crying, tears, crying expression"
    },
    "surprised": {
        "name": "驚き",
        "prompt": "surprised expression, shocked"
    },
    "flustered": {
        "name": "困惑",
        "prompt": "flustered expression, confused"
    }
}

# 体型定義
STAGES = {
    "neutral": {
        "name": "通常",
        "positive": ", normal body, average physique, feminine figure, (slim:1.1)",
        "negative": ", muscular, biceps, pecs, abs, veiny, vascular, definition, muscular arms"
    },
    "stage1": {
        "name": "ムキムキ",
        "positive": ", (muscular:1.3), (visible muscles:1.2), (toned:1.2), (defined muscles:1.1), (biceps:1.2), (abs:1.2), (athletic:1.1), (muscular arms:1.2)",
        "negative": ", skinny, thin, slim, weak"
    },
    "stage2": {
        "name": "モンスターレベル",
        "positive": ", (extremely muscular:1.5), (hyper muscular:1.4), (freaky muscular:1.3), (huge biceps:1.4), (massive biceps:1.3), (pecs:1.4), (visible abs:1.4), (deep six pack:1.3), (broad shoulders:1.4), (toned arms:1.4), (strong back:1.4), (vascular:1.3), (veiny arms:1.2), (ripped:1.3), (shredded:1.3)",
        "negative": ", skinny, thin, slim, normal, average, weak, feminine"
    }
}

def create_character_workflow(character_key, stage="stage1", expression="neutral"):
    """
    キャラクター画像生成ワークフローを作成
    
    Args:
        character_key: キャラクターキー (gyaru, furyo, imouto, kakutogi, osananajimi, akuma)
        stage: 体型ステージ (neutral, stage1, stage2)
        expression: 表情 (neutral, smile, angry, sad, crying, surprised, flustered, blush)
    """
    seed = random.randint(1, 2**31 - 1)
    seed2 = random.randint(1, 2**31 - 1)
    
    if character_key not in CHARACTERS:
        character_key = "gyaru"  # デフォルト
    
    char = CHARACTERS[character_key]
    stage_data = STAGES.get(stage, STAGES["stage1"])
    expression_data = EXPRESSIONS.get(expression, EXPRESSIONS["neutral"])
    
    # キャラクターの共通プロンプト（全身）
    positive_prompt = f"""score_9, score_8_up,
1girl, solo, anime girl, {char['features']},
{char['hair_style']}, {char['eye_color']},
(full body:1.3), (entire body:1.2), (whole body visible), standing,
beautiful face, detailed skin, anime style, 2d,
{expression_data['prompt']},
(masterpiece:1.2), (best quality:1.2), (high quality:1.1), 8k, ultra detailed, anime coloring, cel shading{stage_data["positive"]}"""
    
    negative_prompt = f"""score_3, score_2, score_1, ugly, deformed, bad anatomy,
multiple girls, watermark, text, 3d, logo, signature,
extra limbs, extra fingers, missing fingers,
bad hands, asymmetrical eyes, distorted face, (worst quality, low quality:1.4),
deformed, distorted, disfigured, bad proportions, (male:1.5), blurry, pixelated, jpeg artifacts,
cropped, close up, portrait, head shot, upper body, waist up{stage_data["negative"]}"""
    
    workflow = {
        "1": {
            "inputs": {
                "ckpt_name": "waiIllustriousSDXL_v150.safetensors"
            },
            "class_type": "CheckpointLoaderSimple"
        },
        # japaneseDollLikeness（美人感維持）
        "2": {
            "inputs": {
                "lora_name": "japaneseDollLikeness_v15.safetensors",
                "strength_model": 0.5,
                "strength_clip": 0.5,
                "model": [
                    "1",
                    0
                ],
                "clip": [
                    "1",
                    1
                ]
            },
            "class_type": "LoraLoader"
        },
        # 体型用LoRA（stageに応じて調整）
        "3": {
            "inputs": {
                "lora_name": "2muscle2.safetensors",
                "strength_model": 0.0 if stage == "neutral" else 0.6 if stage == "stage1" else 1.0,
                "strength_clip": 0.0 if stage == "neutral" else 0.6 if stage == "stage1" else 1.0,
                "model": [
                    "2",
                    0
                ],
                "clip": [
                    "2",
                    1
                ]
            },
            "class_type": "LoraLoader"
        },
        # stage2用LoRA追加
        "4": {
            "inputs": {
                "lora_name": "ExtrememusclePDXL8.0.94tx1-000003.safetensors",
                "strength_model": 0.0 if stage == "neutral" else 0.5 if stage == "stage1" else 0.8,
                "strength_clip": 0.0 if stage == "neutral" else 0.5 if stage == "stage1" else 0.8,
                "model": [
                    "3",
                    0
                ],
                "clip": [
                    "3",
                    1
                ]
            },
            "class_type": "LoraLoader"
        },
        # BigPecsGirl（胸部の筋肉）
        "5": {
            "inputs": {
                "lora_name": "BigPecsGirl_v2_ponyXL.safetensors",
                "strength_model": 0.0 if stage == "neutral" else 0.4,
                "strength_clip": 0.0 if stage == "neutral" else 0.4,
                "model": [
                    "4",
                    0
                ],
                "clip": [
                    "4",
                    1
                ]
            },
            "class_type": "LoraLoader"
        },
        "6": {
            "inputs": {
                "text": positive_prompt,
                "clip": [
                    "5",
                    1
                ]
            },
            "class_type": "CLIPTextEncode"
        },
        "7": {
            "inputs": {
                "text": negative_prompt,
                "clip": [
                    "5",
                    1
                ]
            },
            "class_type": "CLIPTextEncode"
        },
        "8": {
            "inputs": {
                "width": 1024,
                "height": 1536,
                "batch_size": 1
            },
            "class_type": "EmptyLatentImage"
        },
        "9": {
            "inputs": {
                "seed": seed,
                "steps": 30,
                "cfg": 7.0,
                "sampler_name": "euler_ancestral",
                "scheduler": "normal",
                "denoise": 1.0,
                "model": [
                    "5",
                    0
                ],
                "positive": [
                    "6",
                    0
                ],
                "negative": [
                    "7",
                    0
                ],
                "latent_image": [
                    "8",
                    0
                ]
            },
            "class_type": "KSampler"
        },
        "10": {
            "inputs": {
                "samples": [
                    "9",
                    0
                ],
                "vae": [
                    "1",
                    2
                ]
            },
            "class_type": "VAEDecode"
        },
        # FaceDetailer用
        "30": {
            "inputs": {
                "model_name": "bbox/face_yolov8m.pt"
            },
            "class_type": "UltralyticsDetectorProvider"
        },
        "31": {
            "inputs": {
                "model_name": "sam_vit_b_01ec64.pth",
                "device_mode": "AUTO"
            },
            "class_type": "SAMLoader"
        },
        "32": {
            "inputs": {
                "text": f"score_9, beautiful face, {char['eye_color']}, {char['hair_style']}, detailed skin, anime style, blushing, {expression_data['prompt']}",
                "clip": [
                    "5",
                    1
                ]
            },
            "class_type": "CLIPTextEncode"
        },
        "33": {
            "inputs": {
                "text": "ugly, deformed, bad anatomy, asymmetrical eyes, distorted face, different face, ugly face",
                "clip": [
                    "5",
                    1
                ]
            },
            "class_type": "CLIPTextEncode"
        },
        "34": {
            "inputs": {
                "guide_size": 512.0,
                "guide_size_for": True,
                "max_size": 1024.0,
                "seed": seed2,
                "steps": 20,
                "cfg": 8.0,
                "sampler_name": "euler",
                "scheduler": "normal",
                "denoise": 0.5,
                "feather": 5,
                "noise_mask": True,
                "force_inpaint": True,
                "bbox_threshold": 0.5,
                "bbox_dilation": 10,
                "bbox_crop_factor": 3.0,
                "sam_detection_hint": "center-1",
                "sam_dilation": 0,
                "sam_threshold": 0.93,
                "sam_bbox_expansion": 0,
                "sam_mask_hint_threshold": 0.7,
                "sam_mask_hint_use_negative": "False",
                "drop_size": 10,
                "wildcard": "",
                "cycle": 1,
                "inpaint_model": False,
                "noise_mask_feather": 20,
                "tiled_encode": False,
                "tiled_decode": False,
                "image": [
                    "10",
                    0
                ],
                "model": [
                    "5",
                    0
                ],
                "clip": [
                    "5",
                    1
                ],
                "vae": [
                    "1",
                    2
                ],
                "positive": [
                    "32",
                    0
                ],
                "negative": [
                    "33",
                    0
                ],
                "bbox_detector": [
                    "30",
                    0
                ],
                "sam_model_opt": [
                    "31",
                    0
                ]
            },
            "class_type": "FaceDetailer"
        },
        "40": {
            "inputs": {
                "filename_prefix": f"game_{character_key}_{stage}_{expression}",
                "images": [
                    "34",
                    0
                ]
            },
            "class_type": "SaveImage"
        }
    }
    
    return workflow

def generate_single_image(character_key, stage, expression):
    """単一の画像を生成"""
    try:
        workflow = create_character_workflow(character_key, stage, expression)
        
        url = "http://127.0.0.1:8188/prompt"
        payload = {
            "prompt": workflow,
            "client_id": f"batch_{character_key}_{stage}_{expression}"
        }
        
        response = requests.post(url, json=payload)
        
        if response.status_code != 200:
            return None, f"APIエラー: {response.status_code}"
        
        prompt_id = response.json()["prompt_id"]
        
        # 完了待機
        start_time = time.time()
        timeout = 180
        
        while True:
            if time.time() - start_time > timeout:
                return None, "タイムアウト"
            
            history_response = requests.get("http://127.0.0.1:8188/history")
            history = history_response.json()
            
            if prompt_id in history:
                entry = history[prompt_id]
                if entry.get("outputs"):
                    if "outputs" in entry:
                        for node_id, output_data in entry["outputs"].items():
                            if "images" in output_data:
                                for img in output_data["images"]:
                                    return img['filename'], None
                    break
            
            time.sleep(1)
        
        return None, "不明なエラー"
    
    except Exception as e:
        return None, str(e)

def main():
    print("=" * 60)
    print("ゲーム用キャラクター画像生成（バッチ版）")
    print("=" * 60)
    
    # 生成タスクのリストを作成
    tasks = []
    for char_key in CHARACTERS.keys():
        for stage_key in STAGES.keys():
            for expr_key in EXPRESSIONS.keys():
                tasks.append((char_key, stage_key, expr_key))
    
    total_tasks = len(tasks)
    print(f"\n総タスク数: {total_tasks}")
    print(f"  キャラクター: {len(CHARACTERS)}")
    print(f"  体型: {len(STAGES)}")
    print(f"  表情: {len(EXPRESSIONS)}")
    print(f"  合計: {len(CHARACTERS)} × {len(STAGES)} × {len(EXPRESSIONS)} = {total_tasks}")
    
    print("\n=== 生成対象 ===")
    print("\nキャラクター:")
    for key, char in CHARACTERS.items():
        print(f"  {key:10s} - {char['name']}")
    
    print("\n体型:")
    for key, stage in STAGES.items():
        print(f"  {key:10s} - {stage['name']}")
    
    print("\n表情:")
    for key, expr in EXPRESSIONS.items():
        print(f"  {key:10s} - {expr['name']}")
    
    print("\n生成を開始します...\n")
    
    # 結果の追跡
    completed = 0
    failed = 0
    results = []
    start_time = time.time()
    
    for i, (char_key, stage_key, expr_key) in enumerate(tasks, 1):
        print(f"[{i}/{total_tasks}] {CHARACTERS[char_key]['name']} / {STAGES[stage_key]['name']} / {EXPRESSIONS[expr_key]['name']}...", end=" ")
        
        filename, error = generate_single_image(char_key, stage_key, expr_key)
        
        if filename:
            print(f"OK ({filename})")
            completed += 1
            results.append((char_key, stage_key, expr_key, filename, None))
        else:
            print(f"NG ({error})")
            failed += 1
            results.append((char_key, stage_key, expr_key, None, error))
        
        # 進捗表示
        if i % 10 == 0 or i == total_tasks:
            elapsed = time.time() - start_time
            avg_time = elapsed / i
            remaining = (total_tasks - i) * avg_time
            print(f"\n  進捗: {i}/{total_tasks} ({i*100//total_tasks}%) | 成功: {completed} | 失敗: {failed} | 残り時間: {remaining/60:.1f}分\n")
    
    # サマリー
    elapsed = time.time() - start_time
    print("\n" + "=" * 60)
    print("完了!")
    print("=" * 60)
    print(f"\n総時間: {elapsed/60:.1f}分")
    print(f"成功: {completed}/{total_tasks}")
    print(f"失敗: {failed}/{total_tasks}")
    
    if failed > 0:
        print("\n失敗したタスク:")
        for char_key, stage_key, expr_key, filename, error in results:
            if error:
                print(f"  {CHARACTERS[char_key]['name']} / {STAGES[stage_key]['name']} / {EXPRESSIONS[expr_key]['name']}: {error}")
    
    print("\n生成された画像は C:\\ComfyUI1\\output\\ に保存されています")

if __name__ == "__main__":
    main()
