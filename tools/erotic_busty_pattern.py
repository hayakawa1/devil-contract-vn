#!/usr/bin/env python3
"""バストアップ系LoRAを使ったエッチな画像生成"""

import requests
import json
import time
import random

def create_busty_workflow():
    """バストアップ系LoRA（BGM5、BustyFCなど）を使用"""
    
    seed = random.randint(1, 2**31 - 1)
    seed2 = random.randint(1, 2**31 - 1)
    
    # エッチなプロンプト（バストアップ）
    positive_prompt = """score_9, score_8_up,
1girl, solo, beautiful anime girl,
purple eyes, black hair, blunt bangs, elegant features, small nose, pretty lips,
sweating, blushing, bedroom, night, dim lighting,
(large breasts:1.3), (huge breasts:1.2), (cleavage:1.3), (deep cleavage:1.2), (bounce:1.1),
(white lingerie:1.2), (lace:1.1), strapless, corset, tight fitting, showing curves,
soft curves, hourglass figure, navel, soft skin, smooth skin,
(glowing skin:1.2), (shiny skin:1.1), skin texture, detailed skin,
seductive expression, looking at viewer, parted lips, bedroom eyes,
intimate atmosphere, romantic mood, soft lighting,
anatomy, realistic, 8k, ultra detailed, masterpiece"""
    
    negative_prompt = """score_3, score_2, score_1, ugly, deformed, bad anatomy,
multiple girls, watermark, text, 3d, logo, signature,
extra limbs, extra fingers, missing fingers,
bad hands, asymmetrical eyes, distorted face,
(worst quality, low quality:1.4), deformed, distorted, disfigured,
bad proportions, flat chest, small breasts, (male:1.5), blurry, pixelated, jpeg artifacts"""
    
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
        # LoRA 1 - BGM5（バストアップ）
        "10": {
            "inputs": {
                "lora_name": "BGM5.safetensors",
                "strength_model": 0.3,
                "strength_clip": 0.3,
                "model": [
                    "1",
                    0
                ],
                "clip": [
                    "2",
                    0
                ]
            },
            "class_type": "LoraLoader"
        },
        # LoRA 2 - BustyFC（バスト強化）
        "11": {
            "inputs": {
                "lora_name": "BustyFC-pdxl.safetensors",
                "strength_model": 0.5,
                "strength_clip": 0.5,
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
        # LoRA 3 - FishnetBunny（フィッシュネット/セクシー）
        "12": {
            "inputs": {
                "lora_name": "FishnetBunnyV1.safetensors",
                "strength_model": 0.4,
                "strength_clip": 0.4,
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
        # LoRA 4 - Flux_Skin_Texture（肌の質感）
        "13": {
            "inputs": {
                "lora_name": "Flux_Skin_Texture.safetensors",
                "strength_model": 0.3,
                "strength_clip": 0.3,
                "model": [
                    "12",
                    0
                ],
                "clip": [
                    "12",
                    1
                ]
            },
            "class_type": "LoraLoader"
        },
        # LoRA 5 - Hyperreal（リアル感）
        "14": {
            "inputs": {
                "lora_name": "Hyperreal_lora.safetensors",
                "strength_model": 0.2,
                "strength_clip": 0.2,
                "model": [
                    "13",
                    0
                ],
                "clip": [
                    "13",
                    1
                ]
            },
            "class_type": "LoraLoader"
        },
        # LoRA 6 - japaneseDollLikeness（美人感）
        "15": {
            "inputs": {
                "lora_name": "japaneseDollLikeness_v15.safetensors",
                "strength_model": 0.5,
                "strength_clip": 0.5,
                "model": [
                    "14",
                    0
                ],
                "clip": [
                    "14",
                    1
                ]
            },
            "class_type": "LoraLoader"
        },
        "20": {
            "inputs": {
                "text": positive_prompt,
                "clip": [
                    "15",
                    1
                ]
            },
            "class_type": "CLIPTextEncode"
        },
        "21": {
            "inputs": {
                "text": negative_prompt,
                "clip": [
                    "15",
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
                    "15",
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
                "text": "score_9, beautiful face, seductive expression, blushing, bedroom eyes, parted lips, detailed skin, glowing skin",
                "clip": [
                    "15",
                    1
                ]
            },
            "class_type": "CLIPTextEncode"
        },
        "33": {
            "inputs": {
                "text": "ugly, deformed, bad anatomy, asymmetrical eyes, distorted face",
                "clip": [
                    "15",
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
                    "15",
                    0
                ],
                "clip": [
                    "15",
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
                "filename_prefix": "erotic_busty_pattern",
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
    print("バストアップ系LoRA エッチ画像生成")
    print("=" * 50)
    
    # ワークフロー作成
    workflow = create_busty_workflow()
    print(f"\nワークフローを作成しました (ノード数: {len(workflow)})")
    print("\n使用LoRA:")
    print("  1. BGM5 (バストアップ)")
    print("  2. BustyFC-pdxl (バスト強化)")
    print("  3. FishnetBunnyV1 (フィッシュネット/セクシー)")
    print("  4. Flux_Skin_Texture (肌の質感)")
    print("  5. Hyperreal_lora (リアル感)")
    print("  6. japaneseDollLikeness_v15 (美人感)")
    print("\n使用ノード:")
    print("  - FaceDetailer (顔ディテールアップ)")
    print("  - UltralyticsDetectorProvider (顔検出)")
    print("  - SAMLoader (セグメンテーション)")
    
    # APIで実行
    print("\n1. 実行を開始中...")
    try:
        url = "http://127.0.0.1:8188/prompt"
        payload = {
            "prompt": workflow,
            "client_id": "erotic_busty_pattern"
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
        print("  (LoRA6個＋FaceDetailer処理のため少し時間がかかります)")
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
