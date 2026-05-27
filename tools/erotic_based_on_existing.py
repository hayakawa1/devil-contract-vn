#!/usr/bin/env python3
"""既存のワークフローのプロンプトを参考にエッチな画像を生成"""

import requests
import json
import time
import random

def create_erotic_workflow():
    """既存ワークフローのプロンプトをベースにエッチな画像生成ワークフローを作成"""
    
    seed = random.randint(1, 2**31 - 1)
    
    # 既存のプロンプトをベースにエッチな要素を追加
    positive_prompt = """score_9, score_8_up, masterpiece, best quality, 
cute smile, happy smile, smiling, bright eyes, joyful, adorable expression, pretty face, beautiful cool face, sharp beautiful eyes, purple eyes, black hair, blunt bangs, elegant features, small nose, pretty lips,
sweating, blushing, bedroom, night, dim lighting, (large breasts:1.2), soft curves, seductive expression, looking at viewer, partially undressed, see-through fabric, intimate atmosphere, romantic mood, detailed skin texture, soft lighting, 8k, ultra detailed"""
    
    negative_prompt = """ugly, deformed, bad anatomy, bad face, distorted face, sad, angry, extra eyes, bad eyes, (worst quality, low quality:1.4), deformed, distorted, disfigured, bad proportions, extra limbs, missing limbs, (male:1.5), (multiple people:1.5), blurry, pixelated, jpeg artifacts, watermark, signature, text"""
    
    workflow = {
        "1": {
            "inputs": {
                "ckpt_name": "waiIllustriousSDXL_v150.safetensors"
            },
            "class_type": "CheckpointLoaderSimple"
        },
        "2": {
            "inputs": {
                "text": positive_prompt,
                "clip": [
                    "1",
                    1
                ]
            },
            "class_type": "CLIPTextEncode"
        },
        "3": {
            "inputs": {
                "text": negative_prompt,
                "clip": [
                    "1",
                    1
                ]
            },
            "class_type": "CLIPTextEncode"
        },
        "4": {
            "inputs": {
                "seed": seed,
                "steps": 20,
                "cfg": 7.0,
                "sampler_name": "euler_ancestral",
                "scheduler": "normal",
                "denoise": 1.0,
                "model": [
                    "1",
                    0
                ],
                "positive": [
                    "2",
                    0
                ],
                "negative": [
                    "3",
                    0
                ],
                "latent_image": [
                    "5",
                    0
                ]
            },
            "class_type": "KSampler"
        },
        "5": {
            "inputs": {
                "width": 1024,
                "height": 1024,
                "batch_size": 1
            },
            "class_type": "EmptyLatentImage"
        },
        "6": {
            "inputs": {
                "samples": [
                    "4",
                    0
                ],
                "vae": [
                    "1",
                    2
                ]
            },
            "class_type": "VAEDecode"
        },
        "7": {
            "inputs": {
                "filename_prefix": "erotic_based_on_existing",
                "images": [
                    "6",
                    0
                ]
            },
            "class_type": "SaveImage"
        }
    }
    
    return workflow

def main():
    print("=" * 50)
    print("既存プロンプトベース エッチ画像生成")
    print("=" * 50)
    
    # ワークフロー作成
    workflow = create_erotic_workflow()
    print(f"\nワークフローを作成しました (ノード数: {len(workflow)})")
    
    # 使用したプロンプトを表示
    print("\n使用プロンプト:")
    print(f"ポジティブ: {workflow['2']['inputs']['text'][:100]}...")
    print(f"ネガティブ: {workflow['3']['inputs']['text'][:100]}...")
    
    # APIで実行
    print("\n1. 実行を開始中...")
    try:
        url = "http://127.0.0.1:8188/prompt"
        payload = {
            "prompt": workflow,
            "client_id": "erotic_based_existing"
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
