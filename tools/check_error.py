#!/usr/bin/env python3
"""エラー詳細確認スクリプト"""

import requests
import json

def main():
    print("=" * 50)
    print("最新実行のエラー確認")
    print("=" * 50)
    
    # 実行履歴を確認
    history = requests.get("http://127.0.0.1:8188/history").json()
    
    if not history:
        print("実行履歴がありません")
        return
    
    latest_key = max(history.keys())
    latest = history[latest_key]
    
    print(f"\nプロンプトID: {latest_key}")
    print(f"\nステータス:")
    print(f"  Outputs: {'Yes' if latest.get('outputs') else 'No'}")
    print(f"  Error: {latest.get('error', 'None')}")
    
    if latest.get('error'):
        print(f"\nエラー詳細:")
        print(f"  {latest['error']}")
    
    # ワークフローを確認
    prompt = latest.get('prompt', {})
    print(f"\nワークフローノード数: {len(prompt)}")
    
    # 最初のノードを表示
    for node_id, node in prompt.items():
        print(f"\nNode {node_id}: {node.get('class_type')}")
        if node.get('inputs'):
            for key, value in node['inputs'].items():
                print(f"  {key}: {str(value)[:50]}")
        break
    
    print("\n" + "=" * 50)

if __name__ == "__main__":
    main()
