#!/usr/bin/env python3
"""
ゲーム用キャラクター画像生成（シンプル版）
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

def create_character_workflow(character_key, stage="stage1"):
    """
    キャラクター画像生成ワークフローを作成
    
    Args:
        character_key: キャラクターキー (gyaru, furyo, imouto, kakutogi, osananajimi, akuma)
        stage: 体型ステージ (neutral, stage1, stage2)
    """
    seed = random.randint(1, 2**31 - 1)
    seed2 = random.randint(1, 2**31 - 1)
    
    if character_key not in CHARACTERS:
        character_key = "gyaru"  # デフォルト
    
    char = CHARACTERS[character_key]
    
    # 体型に応じたプロンプト設定
    muscle_prompts = {
        "neutral": {
            "positive": ", normal body, average physique, feminine figure, (slim:1.1)",
            "negative": ", muscular, biceps, pecs, abs, veiny, vascular, definition, muscular arms"
        },
        "stage1": {
            "positive": ", (muscular:1.3), (visible muscles:1.2), (toned:1.2), (defined muscles:1.1), (biceps:1.2), (abs:1.2), (athletic:1.1), (muscular arms:1.2)",
            "negative": ", skinny, thin, slim, weak"
        },
        "stage2": {
            "positive": ", (extremely muscular:1.5), (hyper muscular:1.4), (freaky muscular:1.3), (huge biceps:1.4), (massive biceps:1.3), (pecs:1.4), (visible abs:1.4), (deep six pack:1.3), (broad shoulders:1.4), (toned arms:1.4), (strong back:1.4), (vascular:1.3), (veiny arms:1.2), (ripped:1.3), (shredded:1.3)",
            "negative": ", skinny, thin, slim, normal, average, weak, feminine"
        }
    }
    
    muscle_addition = muscle_prompts.get(stage, muscle_prompts["stage1"])
    
    # キャラクターの共通プロンプト
    positive_prompt = f"""score_9, score_8_up,
1girl, solo, anime girl, {char['features']},
{char['hair_style']}, {char['eye_color']},
beautiful face, detailed skin, anime style, 2d,
(blush:0.5), bedroom eyes, seductive expression, looking at viewer, parted lips,
(masterpiece:1.2), (best quality:1.2), (high quality:1.1), 8k, ultra detailed, anime coloring, cel shading{muscle_addition["positive"]}"""
    
    negative_prompt = f"""score_3, score_2, score_1, ugly, deformed, bad anatomy,
multiple girls, watermark, text, 3d, logo, signature,
extra limbs, extra fingers, missing fingers,
bad hands, asymmetrical eyes, distorted face, (worst quality, low quality:1.4),
deformed, distorted, disfigured, bad proportions, (male:1.5), blurry, pixelated, jpeg artifacts{muscle_addition["negative"]}"""
    
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
                "text": f"score_9, beautiful face, {char['eye_color']}, {char['hair_style']}, detailed skin, anime style, blushing",
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
                "filename_prefix": f"game_{character_key}_{stage}",
                "images": [
                    "34",
                    0
                ]
            },
            "class_type": "SaveImage"
        }
    }
    
    return workflow

def main():
    print("=" * 50)
    print("ゲーム用キャラクター画像生成（シンプル版）")
    print("=" * 50)
    
    # コマンドライン引数の確認
    if len(sys.argv) < 2:
        print("\n使用方法: python game_character_simple.py <character> [stage]")
        print("\nキャラクター:")
        for key, char in CHARACTERS.items():
            print(f"  {key:10s} - {char['name']}")
        print("\nステージオプション:")
        print("  neutral  - 通常状態（筋肉なし）")
        print("  stage1   - かなりのムキムキ")
        print("  stage2   - モンスターレベル")
        print("\n例: python game_character_simple.py gyaru stage1")
        return
    
    character_key = sys.argv[1]
    stage = sys.argv[2] if len(sys.argv) > 2 else "stage1"
    
    # ステージのバリデーション
    if stage not in ["neutral", "stage1", "stage2"]:
        print(f"✗ 無効なステージ: {stage}")
        print("   使用可能なステージ: neutral, stage1, stage2")
        return
    
    if character_key not in CHARACTERS:
        print(f"✗ 無効なキャラクター: {character_key}")
        print("   使用可能なキャラクター: {', '.join(CHARACTERS.keys())}")
        return
    
    char = CHARACTERS[character_key]
    print(f"\nキャラクター: {char['name']} ({character_key})")
    print(f"  特徴: {char['features']}")
    print(f"  髪: {char['hair_style']}")
    print(f"  目: {char['eye_color']}")
    print(f"ステージ: {stage}")
    print(f"  neutral  - 通常状態（筋肉なし）")
    print(f"  stage1   - かなりのムキムキ")
    print(f"  stage2   - モンスターレベル")
    
    # ワークフロー作成
    workflow = create_character_workflow(character_key, stage)
    print(f"\nワークフローを作成しました (ノード数: {len(workflow)})")
    print("\n使用機能:")
    print("  - LoRA: japaneseDollLikeness, 2muscle2, ExtrememusclePDXL, BigPecsGirl")
    print("  - FaceDetailer: 顔のディテールアップ")
    print("  - ステージに応じて筋肉の程度を調整")
    
    # APIで実行
    print("\n1. 実行を開始中...")
    try:
        url = "http://127.0.0.1:8188/prompt"
        payload = {
            "prompt": workflow,
            "client_id": f"game_{character_key}_{stage}"
        }
        
        response = requests.post(url, json=payload)
        print(f"  ステータスコード: {response.status_code}")
        
        if response.status_code != 200:
            print(f"  エラー: {response.text}")
            return
        
        prompt_id = response.json()["prompt_id"]
        print(f"✓ 実行を開始しました (prompt_id: {prompt_id})")
        
        # 完了待機
        print("\n2. 完了を待機中...")
        start_time = time.time()
        timeout = 180
        
        while True:
            if time.time() - start_time > timeout:
                print(f"✗ タイムアウト ({timeout}秒)")
                return
            
            history_response = requests.get("http://127.0.0.1:8188/history")
            history = history_response.json()
            
            if prompt_id in history:
                entry = history[prompt_id]
                if entry.get("outputs"):
                    print("✓ 完了しました!")
                    
                    # 出力ファイル情報を表示
                    if "outputs" in entry:
                        for node_id, output_data in entry["outputs"].items():
                            if "images" in output_data:
                                for img in output_data["images"]:
                                    print(f"\n生成画像: {img['filename']}")
                                    subfolder = img.get('subfolder', '')
                                    if subfolder:
                                        filepath = f"ComfyUI/output/{subfolder}/{img['filename']}"
                                    else:
                                        filepath = f"ComfyUI/output/{img['filename']}"
                                    print(f"  保存先: {filepath}")
                    
                    break
            
            time.sleep(1)
    
    except Exception as e:
        print(f"✗ エラーが発生しました: {e}")
        import traceback
        traceback.print_exc()
        return
    
    print("\n" + "=" * 50)
    print("完了!")
    print("=" * 50)

if __name__ == "__main__":
    main()
