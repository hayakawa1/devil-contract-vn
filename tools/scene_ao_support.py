#!/usr/bin/env python3
"""
蒼が主人公に寄り添うシーン
- 蒼の腕が主人公の肩に乗っている
- 筋肉の重みが圧し掛かっている
- 汗で湿った皮膚が触れる
- タンクトップから覗く三角筋
- 依存と支配の混じった関係
"""

import requests
import json
import time
import random

def create_scene_workflow():
    """
    蒼が主人公に寄り添うシーンのワークフローを作成
    """
    seed = random.randint(1, 2**31 - 1)
    seed2 = random.randint(1, 2**31 - 1)
    
    # 蒼の特徴
    ao_features = "rough, masculine, muscular, stubble, intense, dependent, controlling"
    
    # 主人公の特徴
    protagonist_features = "male, submissive, overwhelmed, small, supporting"
    
    # シーンのプロンプト
    positive_prompt = f"""score_9, score_8_up,
2people, 1male, 1male, anime style, 2d,
muscular man's arm on smaller man's shoulder, (arm resting on shoulder:1.3),
(heavy muscular arm:1.4), (weight pressing down:1.3),
(sweaty skin:1.2), (wet skin:1.1), body heat, warm skin,
(tank top:1.2), (delts showing through tank top:1.3), (shoulder muscles:1.3), (deltoids:1.2),
muscles expanding with breathing, (broad shoulders:1.3), (thick arms:1.3),
muscle mound pressing down, crushing weight, oppressive presence,
(face close to ear:1.2), (whispering in ear:1.2), (warm breath on neck:1.2),
(stubble on neck:1.1), rough beard sensation,
(dependent relationship:1.2), (controlling yet needy:1.1), (commanding affection:1.2),
{(muscular body:1.4), (defined muscles:1.3), (biceps:1.3), (abs:1.3), (thick thighs:1.2)},
(masterpiece:1.2), (best quality:1.2), (high quality:1.1), 8k, ultra detailed, anime coloring, cel shading"""
    
    negative_prompt = f"""score_3, score_2, score_1, ugly, deformed, bad anatomy,
multiple people more than 2, watermark, text, 3d, logo, signature,
extra limbs, extra fingers, missing fingers,
bad hands, asymmetrical eyes, distorted face, (worst quality, low quality:1.4),
deformed, distorted, disfigured, bad proportions, blurry, pixelated, jpeg artifacts,
female, woman, girl, romantic, gentle, soft"""
    
    workflow = {
        "1": {
            "inputs": {
                "ckpt_name": "waiIllustriousSDXL_v150.safetensors"
            },
            "class_type": "CheckpointLoaderSimple"
        },
        # 2muscle2（筋肉用）
        "2": {
            "inputs": {
                "lora_name": "2muscle2.safetensors",
                "strength_model": 0.9,
                "strength_clip": 0.9,
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
        # ExtrememusclePDXL（モンスターレベル）
        "3": {
            "inputs": {
                "lora_name": "ExtrememusclePDXL8.0.94tx1-000003.safetensors",
                "strength_model": 0.7,
                "strength_clip": 0.7,
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
        "4": {
            "inputs": {
                "text": positive_prompt,
                "clip": [
                    "3",
                    1
                ]
            },
            "class_type": "CLIPTextEncode"
        },
        "5": {
            "inputs": {
                "text": negative_prompt,
                "clip": [
                    "3",
                    1
                ]
            },
            "class_type": "CLIPTextEncode"
        },
        "6": {
            "inputs": {
                "width": 1024,
                "height": 1536,
                "batch_size": 1
            },
            "class_type": "EmptyLatentImage"
        },
        "7": {
            "inputs": {
                "seed": seed,
                "steps": 30,
                "cfg": 7.0,
                "sampler_name": "euler_ancestral",
                "scheduler": "normal",
                "denoise": 1.0,
                "model": [
                    "3",
                    0
                ],
                "positive": [
                    "4",
                    0
                ],
                "negative": [
                    "5",
                    0
                ],
                "latent_image": [
                    "6",
                    0
                ]
            },
            "class_type": "KSampler"
        },
        "8": {
            "inputs": {
                "samples": [
                    "7",
                    0
                ],
                "vae": [
                    "1",
                    2
                ]
            },
            "class_type": "VAEDecode"
        },
        # FaceDetailer用（顔のディテール）
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
                "text": f"score_9, masculine face, stubble, intense eyes, sweaty skin, detailed skin, anime style",
                "clip": [
                    "3",
                    1
                ]
            },
            "class_type": "CLIPTextEncode"
        },
        "33": {
            "inputs": {
                "text": "ugly, deformed, bad anatomy, asymmetrical eyes, distorted face, different face, ugly face",
                "clip": [
                    "3",
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
                "cycle": 2,  # 2つの顔を検出
                "inpaint_model": False,
                "noise_mask_feather": 20,
                "tiled_encode": False,
                "tiled_decode": False,
                "image": [
                    "8",
                    0
                ],
                "model": [
                    "3",
                    0
                ],
                "clip": [
                    "3",
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
                "filename_prefix": "scene_ao_support",
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
    print("=" * 60)
    print("蒼が主人公に寄り添うシーン")
    print("=" * 60)
    
    print("\nシーン説明:")
    print("  蒼の腕が主人公の肩に乗っている")
    print("  重い筋肉が圧し掛かっている")
    print("  汗で湿った皮膚が触れる")
    print("  タンクトップから覗く三角筋")
    print("  依存と支配の混じった関係")
    
    # ワークフロー作成
    workflow = create_scene_workflow()
    print(f"\nワークフローを作成しました (ノード数: {len(workflow)})")
    print("\n使用機能:")
    print("  - LoRA: 2muscle2, ExtrememusclePDXL")
    print("  - FaceDetailer: 2つの顔のディテールアップ（cycle=2）")
    print("  - ポーズ: 腕が肩に乗っている、重圧感")
    
    # APIで実行
    print("\n1. 実行を開始中...")
    try:
        url = "http://127.0.0.1:8188/prompt"
        payload = {
            "prompt": workflow,
            "client_id": "scene_ao_support"
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
    
    print("\n" + "=" * 60)
    print("完了!")
    print("=" * 60)

if __name__ == "__main__":
    main()
