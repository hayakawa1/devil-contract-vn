#!/usr/bin/env python3
"""
Text to Image 画像生成スクリプト
ComfyUI APIを使ってテキストから画像を生成
"""

import requests
import json
import time
import os
import random
from typing import Optional


def create_text_to_image_workflow(
    positive_prompt: str,
    negative_prompt: str,
    width: int = 1024,
    height: int = 1024,
    steps: int = 20,
    cfg: float = 7.0,
    seed: Optional[int] = None,
    model_name: str = "waiIllustriousSDXL_v150.safetensors"
):
    """Text to Image ワークフローを作成"""
    
    if seed is None:
        seed = random.randint(1, 2**31 - 1)
    
    workflow = [
        seed,
        "",  # id
        {
            "3": {
                "inputs": {
                    "ckpt_name": model_name
                },
                "class_type": "CheckpointLoaderSimple"
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
                    "seed": seed,
                    "steps": steps,
                    "cfg": cfg,
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
                        "7",
                        0
                    ]
                },
                "class_type": "KSampler"
            },
            "7": {
                "inputs": {
                    "width": width,
                    "height": height,
                    "batch_size": 1
                },
                "class_type": "EmptyLatentImage"
            },
            "8": {
                "inputs": {
                    "samples": [
                        "6",
                        0
                    ],
                    "vae": [
                        "3",
                        2
                    ]
                },
                "class_type": "VAEDecode"
            },
            "9": {
                "inputs": {
                    "filename_prefix": "generated",
                    "images": [
                        "8",
                        0
                    ]
                },
                "class_type": "SaveImage"
            }
        },
        {
            "create_time": 0
        },
        ["9"]
    ]
    
    return workflow


class ComfyUIClient:
    """ComfyUI APIクライアント"""
    
    def __init__(self, server_address: str = "127.0.0.1:8188"):
        self.server_address = server_address
        self.client_id = "comfyui_client"
        self.base_url = f"http://{server_address}"
    
    def get_history(self):
        """実行履歴を取得"""
        response = requests.get(f"{self.base_url}/history")
        response.raise_for_status()
        return response.json()
    
    def execute_workflow(self, workflow) -> str:
        """ワークフローを実行"""
        p = {"prompt": workflow, "client_id": self.client_id}
        response = requests.post(f"{self.base_url}/prompt", json=p)
        response.raise_for_status()
        return response.json()["prompt_id"]
    
    def wait_for_completion(self, prompt_id: str, timeout: int = 300):
        """実行完了を待機"""
        start_time = time.time()
        
        while True:
            if time.time() - start_time > timeout:
                raise TimeoutError(f"Execution timed out after {timeout} seconds")
            
            history = self.get_history()
            if prompt_id in history and history[prompt_id].get("outputs") is not None:
                return history[prompt_id]
            
            time.sleep(1)
    
    def get_output_dir(self):
        """ComfyUIの出力ディレクトリを推測"""
        # Windowsのデフォルトパス
        possible_paths = [
            os.path.expanduser("~/ComfyUI/output"),
            "C:/ComfyUI/output",
            os.path.join(os.path.dirname(__file__), "../../ComfyUI/output"),
        ]
        
        for path in possible_paths:
            if os.path.exists(path):
                return path
        
        return None


def generate_erotic_image():
    """エッチな画像を生成"""
    
    print("=" * 50)
    print("Text to Image 画像生成")
    print("=" * 50)
    
    # クライアント初期化
    client = ComfyUIClient("127.0.0.1:8188")
    
    # エッチなプロンプト
    positive_prompt = """
(masterpiece, best quality, highres:1.2), 
1girl, solo, beautiful anime girl, 
sweating, blushing, bedroom, night, dim lighting,
(large breasts:1.2), soft curves, 
seductive expression, looking at viewer,
partially undressed, see-through fabric,
intimate atmosphere, romantic mood,
detailed skin texture, soft lighting,
anatomy, realistic, 8k, ultra detailed
""".strip()
    
    negative_prompt = """
(worst quality, low quality:1.4), 
deformed, distorted, disfigured, 
bad anatomy, bad proportions, extra limbs, missing limbs,
(male:1.5), (multiple people:1.5),
blurry, pixelated, jpeg artifacts, 
watermark, signature, text,
ugly, old, wrinkles,
""".strip()
    
    # ワークフロー作成
    print("\n1. ワークフローを作成中...")
    workflow = create_text_to_image_workflow(
        positive_prompt=positive_prompt,
        negative_prompt=negative_prompt,
        width=1024,
        height=1024,
        steps=20,
        cfg=7.0,
        seed=random.randint(1, 2**31 - 1),
        model_name="waiIllustriousSDXL_v150.safetensors"
    )
    print("✓ ワークフローを作成しました")
    
    # ワークフローを保存
    output_dir = "tools/workflows"
    os.makedirs(output_dir, exist_ok=True)
    workflow_path = os.path.join(output_dir, "erotic_text2image.json")
    with open(workflow_path, 'w', encoding='utf-8') as f:
        json.dump(workflow, f, indent=2, ensure_ascii=False)
    print(f"✓ ワークフローを保存: {workflow_path}")
    
    # 実行
    print("\n2. 画像生成を開始中...")
    try:
        prompt_id = client.execute_workflow(workflow)
        print(f"✓ 実行を開始しました (prompt_id: {prompt_id})")
        
        print("   完了を待機中...")
        result = client.wait_for_completion(prompt_id)
        print("✓ 完了しました!")
        
        # 出力ファイル情報を表示
        if "outputs" in result:
            for node_id, output_data in result["outputs"].items():
                if "images" in output_data:
                    for img in output_data["images"]:
                        print(f"\n生成画像: {img['filename']}")
                        subfolder = img.get('subfolder', '')
                        if subfolder:
                            filepath = f"ComfyUI/output/{subfolder}/{img['filename']}"
                        else:
                            filepath = f"ComfyUI/output/{img['filename']}"
                        print(f"  保存先: {filepath}")
                        print(f"  タイプ: {img.get('type', 'output')}")
        
        # 出力ディレクトリを確認
        output_path = client.get_output_dir()
        if output_path:
            print(f"\nComfyUI出力ディレクトリ: {output_path}")
        
    except Exception as e:
        print(f"✗ エラーが発生しました: {e}")
        return
    
    print("\n" + "=" * 50)
    print("完了!")
    print("=" * 50)


if __name__ == "__main__":
    generate_erotic_image()
