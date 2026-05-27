#!/usr/bin/env python3
"""保存されたText to Imageワークフローを実行"""

import requests
import json
import time
import os

def main():
    print("=" * 50)
    print("Text to Image ワークフロー実行")
    print("=" * 50)
    
    # ワークフローを読み込み
    workflow_path = "tools/tools/workflows/erotic_text2image.json"
    
    if not os.path.exists(workflow_path):
        print(f"エラー: ワークフローファイルが見つかりません: {workflow_path}")
        return
    
    with open(workflow_path, 'r', encoding='utf-8') as f:
        workflow = json.load(f)
    
    print(f"\nワークフローを読み込み: {workflow_path}")
    print(f"ノード数: {len(workflow[2])}")
    
    # 実行
    print("\n1. 実行を開始中...")
    try:
        url = "http://127.0.0.1:8188/prompt"
        payload = {
            "prompt": workflow,
            "client_id": "erotic_workflow_client"
        }
        
        print(f"  URL: {url}")
        print(f"  ペイロードサイズ: {len(json.dumps(payload))} bytes")
        
        response = requests.post(url, json=payload)
        print(f"  ステータスコード: {response.status_code}")
        
        if response.status_code != 200:
            print(f"\nエラー: {response.status_code}")
            print(f"レスポンス: {response.text}")
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
