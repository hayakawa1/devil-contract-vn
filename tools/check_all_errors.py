#!/usr/bin/env python3
"""全実行履歴のエラー確認"""

import requests

def main():
    print("=" * 50)
    print("全実行履歴のエラー確認")
    print("=" * 50)
    
    # 実行履歴を確認
    history = requests.get("http://127.0.0.1:8188/history").json()
    
    if not history:
        print("実行履歴がありません")
        return
    
    print(f"\n実行履歴数: {len(history)}")
    
    # エラーがある実行を探す
    error_count = 0
    for key, value in sorted(history.items(), reverse=True)[:10]:  # 最新10件
        print(f"\nプロンプトID: {key}")
        print(f"  Outputs: {'Yes' if value.get('outputs') else 'No'}")
        print(f"  Error: {value.get('error', 'None')}")
        
        if value.get('error'):
            error_count += 1
            print(f"  エラー詳細: {value['error']}")
        
        # ワークフローのノード数
        prompt = value.get('prompt')
        if isinstance(prompt, dict):
            print(f"  ノード数: {len(prompt)}")
        elif isinstance(prompt, list) and len(prompt) >= 3:
            print(f"  ノード数: {len(prompt[2])}")
    
    print(f"\n\nエラーのある実行数（最新10件中）: {error_count}")

if __name__ == "__main__":
    main()
