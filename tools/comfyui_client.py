#!/usr/bin/env python3
"""
ComfyUI API クライアント
直近のワークフローを取得・実行・改良するためのユーティリティ
"""

import requests
import json
import time
import os
from typing import Dict, Optional, Any, List


class ComfyUIClient:
    """ComfyUI APIクライアント"""
    
    def __init__(self, server_address: str = "127.0.0.1:8188"):
        self.server_address = server_address
        self.client_id = "comfyui_client"
        self.base_url = f"http://{server_address}"
    
    def get_history(self) -> Dict:
        """実行履歴を取得"""
        response = requests.get(f"{self.base_url}/history")
        response.raise_for_status()
        return response.json()
    
    def get_latest_workflow(self) -> Optional[Dict]:
        """直近のワークフローを取得"""
        history = self.get_history()
        if not history:
            return None
        
        # 最新の実行履歴を取得
        latest_key = max(history.keys())
        latest_data = history[latest_key]
        
        # ワークフロー情報を抽出
        workflow = None
        if "prompt" in latest_data:
            workflow = latest_data["prompt"]
        
        return workflow
    
    def get_queue_info(self) -> Dict:
        """キュー情報を取得"""
        response = requests.get(f"{self.base_url}/queue")
        response.raise_for_status()
        return response.json()
    
    def execute_workflow(self, workflow: Dict) -> str:
        """ワークフローを実行"""
        p = {"prompt": workflow, "client_id": self.client_id}
        response = requests.post(f"{self.base_url}/prompt", json=p)
        response.raise_for_status()
        return response.json()["prompt_id"]
    
    def wait_for_completion(self, prompt_id: str, timeout: int = 300) -> Dict:
        """実行完了を待機"""
        start_time = time.time()
        
        while True:
            if time.time() - start_time > timeout:
                raise TimeoutError(f"Execution timed out after {timeout} seconds")
            
            history = self.get_history()
            if prompt_id in history and history[prompt_id].get("outputs") is not None:
                return history[prompt_id]
            
            time.sleep(1)
    
    def save_workflow(self, workflow: Dict, filename: str) -> None:
        """ワークフローをJSONファイルに保存"""
        with open(filename, 'w', encoding='utf-8') as f:
            json.dump(workflow, f, indent=2, ensure_ascii=False)
    
    def load_workflow(self, filename: str) -> Dict:
        """ワークフローをJSONファイルから読み込み"""
        with open(filename, 'r', encoding='utf-8') as f:
            return json.load(f)
    
    def modify_prompt_in_workflow(self, workflow: Dict, new_prompt: str, seed: int = None) -> Dict:
        """ワークフロー内のプロンプトを変更
        
        KSamplerノードを見つけてシードとプロンプトを更新
        """
        import copy
        new_workflow = copy.deepcopy(workflow)
        
        for node_id, node in new_workflow.items():
            if node.get("class_type") == "KSampler":
                if seed is not None and "seed" in node["inputs"]:
                    node["inputs"]["seed"] = seed
                print(f"Found KSampler node {node_id}")
        
        # TextEncodeノードを探してプロンプトを更新
        for node_id, node in new_workflow.items():
            if node.get("class_type") == "CLIPTextEncode":
                node["inputs"]["text"] = new_prompt
                print(f"Updated CLIPTextEncode node {node_id}")
                break
        
        return new_workflow


def create_erotic_workflow(original_workflow, prompt: str, negative_prompt: str = None):
    """エッチな画像生成用にワークフローを改良
    
    Args:
        original_workflow: 元のワークフロー（リスト形式または辞書形式）
        prompt: 新しいポジティブプロンプト（エッチな内容を含む）
        negative_prompt: 新しいネガティブプロンプト（任意）
    
    Returns:
        改良されたワークフロー
    """
    import copy
    import random
    
    new_workflow = copy.deepcopy(original_workflow)
    
    # リスト形式か辞書形式か判定
    if isinstance(new_workflow, list) and len(new_workflow) >= 3:
        # リスト形式: [seed, id, nodes_dict, metadata, output_nodes]
        nodes = new_workflow[2]
        is_list_format = True
    else:
        # 辞書形式: {node_id: node_info}
        nodes = new_workflow
        is_list_format = False
    
    # ランダムなシードを生成
    new_seed = random.randint(1, 2**31 - 1)
    
    # KSamplerまたはFaceDetailerノードのシードを更新
    for node_id, node in nodes.items():
        if node.get("class_type") in ["KSampler", "FaceDetailer"]:
            if "seed" in node["inputs"]:
                node["inputs"]["seed"] = new_seed
                print(f"Updated {node['class_type']} node {node_id} with seed: {new_seed}")
    
    # CLIPTextEncodeノード（ポジティブプロンプト）を更新
    for node_id, node in nodes.items():
        if node.get("class_type") == "CLIPTextEncode":
            node["inputs"]["text"] = prompt
            print(f"Updated positive prompt in CLIPTextEncode node {node_id}")
            break
    
    # ネガティブプロンプト用のCLIPTextEncodeノードを更新（指定されている場合）
    if negative_prompt:
        found_positive = False
        for node_id, node in nodes.items():
            if node.get("class_type") == "CLIPTextEncode":
                if not found_positive:
                    found_positive = True
                else:
                    node["inputs"]["text"] = negative_prompt
                    print(f"Updated negative prompt in CLIPTextEncode node {node_id}")
                    break
    
    return new_workflow


def main():
    """メイン関数"""
    
    # クライアント初期化
    client = ComfyUIClient("127.0.0.1:8188")
    
    print("=" * 50)
    print("ComfyUI API クライアント")
    print("=" * 50)
    
    # 直近のワークフローを取得
    print("\n1. 直近のワークフローを取得中...")
    latest_workflow = client.get_latest_workflow()
    
    if not latest_workflow:
        print("エラー: 実行履歴が見つかりません。まずComfyUIでワークフローを実行してください。")
        return
    
    print(f"✓ ワークフローを取得しました（{len(latest_workflow)}ノード）")
    
    # ワークフローを保存
    output_dir = "tools/workflows"
    os.makedirs(output_dir, exist_ok=True)
    
    original_path = os.path.join(output_dir, "latest_original.json")
    client.save_workflow(latest_workflow, original_path)
    print(f"✓ 元のワークフローを保存: {original_path}")
    
    # エッチな画像生成用プロンプト
    erotic_positive = """
(masterpiece, best quality, highres:1.2), 
1girl, solo, beautiful woman, 
sweating, blushing, bedroom, night, dim lighting,
(large breasts:1.2), soft curves, 
seductive expression, looking at viewer,
(partially undressed:1.1), see-through fabric,
intimate atmosphere, romantic mood,
detailed skin texture, soft lighting,
anatomy, realistic, 8k, ultra detailed
""".strip()
    
    erotic_negative = """
(worst quality, low quality:1.4), 
deformed, distorted, disfigured, 
bad anatomy, bad proportions, extra limbs, missing limbs,
(male:1.5), (multiple people:1.5),
blurry, pixelated, jpeg artifacts, 
watermark, signature, text,
ugly, old, wrinkles,
"""
    
    # ワークフローを改良
    print("\n2. エッチな画像生成用にワークフローを改良中...")
    erotic_workflow = create_erotic_workflow(
        latest_workflow, 
        erotic_positive, 
        erotic_negative
    )
    
    # 改良したワークフローを保存
    erotic_path = os.path.join(output_dir, "erotic_workflow.json")
    client.save_workflow(erotic_workflow, erotic_path)
    print(f"✓ 改良したワークフローを保存: {erotic_path}")
    
    # 実行
    print("\n3. 改良したワークフローを実行中...")
    try:
        prompt_id = client.execute_workflow(erotic_workflow)
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
                        print(f"  フォルダ: {img.get('subfolder', 'output')}")
                        print(f"  タイプ: {img.get('type', 'output')}")
        
    except Exception as e:
        print(f"✗ エラーが発生しました: {e}")
        return
    
    print("\n" + "=" * 50)
    print("完了!")
    print("=" * 50)


if __name__ == "__main__":
    main()
