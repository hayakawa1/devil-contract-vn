#!/usr/bin/env python3
"""ComfyUIから現在のワークフローを取得"""

import requests
import json

def main():
    print("=" * 50)
    print("現在のワークフローを取得")
    print("=" * 50)
    
    # object_infoを取得して使用可能なノードを確認
    try:
        print("\n使用可能なノードを確認中...")
        response = requests.get("http://127.0.0.1:8188/object_info")
        obj_info = response.json()
        
        # LoraLoaderなどのノードがあるか確認
        lora_found = False
        controlnet_found = False
        
        for node_name, node_info in obj_info.items():
            if "LoraLoader" in node_name:
                print(f"  LoraLoaderノードが見つかりました: {node_name}")
                lora_found = True
            if "ControlNet" in node_name:
                print(f"  ControlNetノードが見つかりました: {node_name}")
                controlnet_found = True
        
        if lora_found:
            # LoraLoaderの詳細を表示
            for node_name, node_info in obj_info.items():
                if "LoraLoader" in node_name:
                    print(f"\n{node_name}の入力:")
                    print(json.dumps(node_info.get('input', {}), indent=2, ensure_ascii=False))
        
        # 現在のワークフローを保存
        print("\n現在のワークフローを保存中...")
        response = requests.get("http://127.0.0.1:8188/prompt")
        print(f"  GET /prompt レスポンス: {response.status_code}")
        
        # ローカルのComfyUIからワークフローファイルを探す
        import os
        possible_paths = [
            "ComfyUI/prompt_api.json",
            "ComfyUI/last_prompt.json",
            "C:/Users/hayak/ComfyUI/prompt_api.json",
            "C:/Users/hayak/ComfyUI/last_prompt.json",
        ]
        
        for path in possible_paths:
            if os.path.exists(path):
                print(f"\n  見つかりました: {path}")
                with open(path, 'r', encoding='utf-8') as f:
                    data = json.load(f)
                print(f"  データタイプ: {type(data)}")
                if isinstance(data, list):
                    print(f"  長さ: {len(data)}")
                    if len(data) > 2:
                        print(f"  ノード数: {len(data[2])}")
                
    except Exception as e:
        print(f"エラー: {e}")
        import traceback
        traceback.print_exc()
    
    print("\n" + "=" * 50)

if __name__ == "__main__":
    main()
