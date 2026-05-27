#!/usr/bin/env python3
"""
ゲーム用キャラクター画像生成
- 顔と服を固定（IPAdapterFaceIDで顔固定）
- 体型だけを変化（neutral → stage1 → stage2）
- FaceDetailerで顔を整える
"""

import requests
import json
import time
import random
import os
import sys

def get_absolute_path(relative_path):
    """相対パスを絶対パスに変換"""
    return os.path.abspath(os.path.join(os.path.dirname(__file__), '..', relative_path))

def create_body_change_workflow(image_filename, stage="stage1"):
    """
    体型変更用ワークフローを作成
    
    Args:
        image_filename: ComfyUIのinputフォルダ内の画像ファイル名
        stage: 体型ステージ (neutral, stage1, stage2)
    """
    seed = random.randint(1, 2**31 - 1)
    seed2 = random.randint(1, 2**31 - 1)
    
    # 体型に応じたプロンプト設定
    muscle_prompts = {
        "neutral": {
            "positive": ", normal body, average physique, feminine figure",
            "negative": ", muscular, biceps, pecs, abs, veiny, vascular, definition"
        },
        "stage1": {
            "positive": ", (muscular:1.3), (visible muscles:1.2), (toned:1.2), (defined muscles:1.1), (biceps:1.2), (abs:1.2), (athletic:1.1)",
            "negative": ", skinny, thin, slim"
        },
        "stage2": {
            "positive": ", (extremely muscular:1.5), (hyper muscular:1.4), (freaky muscular:1.3), (huge biceps:1.4), (massive biceps:1.3), (pecs:1.4), (visible abs:1.4), (deep six pack:1.3), (broad shoulders:1.4), (toned arms:1.4), (strong back:1.4), (vascular:1.3), (veiny arms:1.2)",
            "negative": ", skinny, thin, slim, normal, average"
        }
    }
    
    muscle_addition = muscle_prompts.get(stage, muscle_prompts["stage1"])
    
    # キャラクターの共通プロンプト
    positive_prompt = f"""score_9, score_8_up,
1girl, solo, anime girl,
beautiful face, detailed skin, anime style, 2d,
(blush:0.5), bedroom eyes, seductive expression, looking at viewer, parted lips,
same face, same hair, same hair color, same eye color,
same outfit, same clothes, same style, same pose, same composition,
{muscle_addition["positive"]},
(masterpiece:1.2), (best quality:1.2), (high quality:1.1), 8k, ultra detailed, anime coloring, cel shading"""
    
    negative_prompt = f"""score_3, score_2, score_1, ugly, deformed, bad anatomy,
multiple girls, watermark, text, 3d, logo, signature,
extra limbs, extra fingers, missing fingers,
bad hands, asymmetrical eyes, distorted face,
(worst quality, low quality:1.4), deformed, distorted, disfigured,
bad proportions, (male:1.5), blurry, pixelated, jpeg artifacts{muscle_addition["negative"]}"""
    
    workflow = {
        "1": {
            "inputs": {
                "ckpt_name": "waiIllustriousSDXL_v150.safetensors"
            },
            "class_type": "CheckpointLoaderSimple"
        },
        "2": {
            "inputs": {
                "stop_at_clip_layer": -2,
                "clip": [
                    "1",
                    1
                ]
            },
            "class_type": "CLIPSetLastLayer"
        },
        # IPAdapterFaceID用ローダー
        "5": {
            "inputs": {
                "model": [
                    "1",
                    0
                ],
                "preset": "FACEID",
                "lora_strength": 0.6,
                "provider": "CUDA"
            },
            "class_type": "IPAdapterUnifiedLoaderFaceID"
        },
        # InsightFaceローダー
        "6": {
            "inputs": {
                "provider": "CUDA",
                "model_name": "buffalo_l"
            },
            "class_type": "IPAdapterInsightFaceLoader"
        },
        # ベース画像ロード
        "7": {
            "inputs": {
                "image": image_filename
            },
            "class_type": "LoadImage"
        },
        # IPAdapterFaceIDで顔を固定
        "8": {
            "inputs": {
                "model": [
                    "5",
                    0
                ],
                "ipadapter": [
                    "5",
                    1
                ],
                "image": [
                    "7",
                    0
                ],
                "weight": 0.85,
                "weight_faceidv2": 1.0,
                "weight_type": "linear",
                "combine_embeds": "concat",
                "start_at": 0.0,
                "end_at": 1.0,
                "embeds_scaling": "V only",
                "insightface": [
                    "6",
                    0
                ]
            },
            "class_type": "IPAdapterFaceID"
        },
        # LoRA: japaneseDollLikeness（美人感維持）
        "9": {
            "inputs": {
                "lora_name": "japaneseDollLikeness_v15.safetensors",
                "strength_model": 0.4,
                "strength_clip": 0.4,
                "model": [
                    "8",
                    0
                ],
                "clip": [
                    "2",
                    0
                ]
            },
            "class_type": "LoraLoader"
        },
        # 体型用LoRA（stageに応じて調整）
        "10": {
            "inputs": {
                "lora_name": "2muscle2.safetensors",
                "strength_model": 0.6 if stage == "stage1" else 1.0,
                "strength_clip": 0.6 if stage == "stage1" else 1.0,
                "model": [
                    "9",
                    0
                ],
                "clip": [
                    "9",
                    1
                ]
            },
            "class_type": "LoraLoader"
        },
        # stage2用LoRA追加
        "11": {
            "inputs": {
                "lora_name": "ExtrememusclePDXL8.0.94tx1-000003.safetensors",
                "strength_model": 0.0 if stage == "neutral" else 0.5 if stage == "stage1" else 0.8,
                "strength_clip": 0.0 if stage == "neutral" else 0.5 if stage == "stage1" else 0.8,
                "model": [
                    "10",
                    0
                ],
                "clip": [
                    "10",
                    1
                ]
            },
            "class_type": "LoraLoader"
        },
        # BigPecsGirl（胸部の筋肉）
        "12": {
            "inputs": {
                "lora_name": "BigPecsGirl_v2_ponyXL.safetensors",
                "strength_model": 0.0 if stage == "neutral" else 0.4,
                "strength_clip": 0.0 if stage == "neutral" else 0.4,
                "model": [
                    "11",
                    0
                ],
                "clip": [
                    "11",
                    1
                ]
            },
            "class_type": "LoraLoader"
        },
        "20": {
            "inputs": {
                "text": positive_prompt,
                "clip": [
                    "12",
                    1
                ]
            },
            "class_type": "CLIPTextEncode"
        },
        "21": {
            "inputs": {
                "text": negative_prompt,
                "clip": [
                    "12",
                    1
                ]
            },
            "class_type": "CLIPTextEncode"
        },
        "22": {
            "inputs": {
                "width": 1024,
                "height": 1024,
                "batch_size": 1
            },
            "class_type": "EmptyLatentImage"
        },
        "23": {
            "inputs": {
                "seed": seed,
                "steps": 30,
                "cfg": 7.0,
                "sampler_name": "euler_ancestral",
                "scheduler": "normal",
                "denoise": 1.0,
                "model": [
                    "12",
                    0
                ],
                "positive": [
                    "20",
                    0
                ],
                "negative": [
                    "21",
                    0
                ],
                "latent_image": [
                    "22",
                    0
                ]
            },
            "class_type": "KSampler"
        },
        "24": {
            "inputs": {
                "samples": [
                    "23",
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
                "text": "score_9, beautiful face, same face, same eye color, same hair, detailed skin, anime style, blushing",
                "clip": [
                    "12",
                    1
                ]
            },
            "class_type": "CLIPTextEncode"
        },
        "33": {
            "inputs": {
                "text": "ugly, deformed, bad anatomy, asymmetrical eyes, distorted face, different face, ugly face",
                "clip": [
                    "12",
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
                    "24",
                    0
                ],
                "model": [
                    "12",
                    0
                ],
                "clip": [
                    "12",
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
                "filename_prefix": f"game_character_{stage}",
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
    print("ゲーム用キャラクター画像生成")
    print("=" * 50)
    
    # コマンドライン引数の確認
    if len(sys.argv) < 3:
        print("\n使用方法: python game_character_body_change.py <base_image_path> <comfyui_input_dir> [stage]")
        print("\nステージオプション:")
        print("  neutral  - 通常状態（筋肉なし）")
        print("  stage1   - かなりのムキムキ")
        print("  stage2   - モンスターレベル")
        print("\n例: python game_character_body_change.py game/public/assets/characters/gyaru_neutral.png C:/ComfyUI/input stage1")
        return
    
    base_image_path = sys.argv[1]
    comfyui_input_dir = sys.argv[2]
    stage = sys.argv[3] if len(sys.argv) > 3 else "stage1"
    
    # ComfyUIのinputフォルダの存在確認
    if not os.path.exists(comfyui_input_dir):
        print(f"✗ ComfyUIのinputフォルダが見つかりません: {comfyui_input_dir}")
        return
    
    # ステージのバリデーション
    if stage not in ["neutral", "stage1", "stage2"]:
        print(f"✗ 無効なステージ: {stage}")
        print("   使用可能なステージ: neutral, stage1, stage2")
        return
    
    # 画像ファイルの存在確認
    if not os.path.exists(base_image_path):
        print(f"✗ 画像ファイルが見つかりません: {base_image_path}")
        return
    
    print(f"\nベース画像: {base_image_path}")
    print(f"ComfyUI inputフォルダ: {comfyui_input_dir}")
    
    # 画像をComfyUIのinputフォルダにコピー
    import shutil
    base_filename = os.path.basename(base_image_path)
    comfyui_image_path = os.path.join(comfyui_input_dir, base_filename)
    
    # 同じパスの場合はコピー不要
    if os.path.abspath(base_image_path) == os.path.abspath(comfyui_image_path):
        print("✓ 画像は既にComfyUIのinputフォルダにあります")
    else:
        shutil.copy2(base_image_path, comfyui_image_path)
        print(f"✓ 画像をComfyUIのinputフォルダにコピーしました: {base_filename}")
    print(f"ステージ: {stage}")
    print(f"  neutral  - 通常状態（筋肉なし）")
    print(f"  stage1   - かなりのムキムキ")
    print(f"  stage2   - モンスターレベル")
    
    # ワークフロー作成（ファイル名のみを渡す）
    workflow = create_body_change_workflow(base_filename, stage)
    print(f"\nワークフローを作成しました (ノード数: {len(workflow)})")
    print("\n使用機能:")
    print("  - IPAdapterFaceID (顔固定)")
    print("  - IPAdapterInsightFace (顔認識)")
    print("  - FaceDetailer (顔ディテールアップ)")
    print("  - LoRA: 2muscle2, ExtrememusclePDXL, BigPecsGirl, japaneseDollLikeness")
    
    # APIで実行
    print("\n1. 実行を開始中...")
    try:
        url = "http://127.0.0.1:8188/prompt"
        payload = {
            "prompt": workflow,
            "client_id": f"game_character_{stage}"
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
        print("  (IPAdapter + FaceDetailer処理のため少し時間がかかります)")
        start_time = time.time()
        timeout = 300
        
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
            
            time.sleep(2)
    
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
