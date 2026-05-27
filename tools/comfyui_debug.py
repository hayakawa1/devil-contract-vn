#!/usr/bin/env python3
"""ComfyUIデバッグ用スクリプト"""

import requests
import json

def get_objects():
    """ComfyUIで使用可能なオブジェクト（モデルなど）を取得"""
    response = requests.get("http://127.0.0.1:8188/object_info")
    response.raise_for_status()
    return response.json()

def get_history():
    """実行履歴を取得"""
    response = requests.get("http://127.0.0.1:8188/history")
    response.raise_for_status()
    return response.json()

def main():
    print("=" * 50)
    print("ComfyUI デバッグ情報")
    print("=" * 50)
    
    # オブジェクト情報を取得
    print("\n1. モデル情報を取得中...")
    try:
        objects = get_objects()
        
        # CheckpointLoaderSimpleのモデルを確認
        if "CheckpointLoaderSimple" in objects:
            input_info = objects["CheckpointLoaderSimple"]["input"]["required"]
            if "ckpt_name" in input_info:
                ckpt_list = input_info["ckpt_name"][0]
                print("\n使用可能なチェックポイントモデル:")
                for ckpt in ckpt_list[:20]:  # 最初の20件のみ表示
                    print(f"  - {ckpt}")
                if len(ckpt_list) > 20:
                    print(f"  ... 他 {len(ckpt_list) - 20} 件")
        else:
            print("CheckpointLoaderSimpleが見つかりません")
            
    except Exception as e:
        print(f"エラー: {e}")
    
    # 実行履歴を確認
    print("\n2. 実行履歴を確認中...")
    try:
        history = get_history()
        print(f"実行履歴数: {len(history)}")
        
        if history:
            latest_key = max(history.keys())
            latest = history[latest_key]
            print(f"\n最新の実行:")
            print(f"  プロンプトID: {latest_key}")
            print(f"  ノード数: {len(latest.get('prompt', {}))}")
            
            # エラーがあれば表示
            if "error" in latest:
                print(f"  エラー: {latest['error']}")
    except Exception as e:
        print(f"エラー: {e}")

if __name__ == "__main__":
    main()
