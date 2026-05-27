#!/usr/bin/env python3
"""正常に動いているワークフローの形式を詳細分析"""

import requests
import json

def main():
    print("=" * 50)
    print("正常動作ワークフローの分析")
    print("=" * 50)
    
    # 実行履歴を確認
    history = requests.get("http://127.0.0.1:8188/history").json()
    
    if not history:
        print("実行履歴がありません")
        return
    
    # 最新の成功例を取得
    for key in sorted(history.keys(), reverse=True)[:1]:
        entry = history[key]
        
        print(f"\nプロンプトID: {key}")
        
        if entry.get('error'):
            print(f"エラーがあるためスキップ")
            continue
        
        if not entry.get('outputs'):
            print(f"出力がないためスキップ")
            continue
        
        prompt = entry.get('prompt')
        print(f"\nワークフローの型: {type(prompt)}")
        
        if isinstance(prompt, list):
            print(f"リストの長さ: {len(prompt)}")
            print(f"\n各要素の型:")
            for i, item in enumerate(prompt):
                print(f"  [{i}] {type(item)}")
                if isinstance(item, (dict, str)):
                    print(f"      内容の概要: {str(item)[:100]}")
            
            # ノード情報（インデックス2）を詳細表示
            if len(prompt) >= 3:
                nodes = prompt[2]
                print(f"\nノード数: {len(nodes)}")
                print(f"\nノード詳細:")
                for node_id, node in list(nodes.items())[:3]:
                    print(f"\n  Node {node_id}:")
                    print(f"    class_type: {node.get('class_type')}")
                    print(f"    inputs: {list(node.get('inputs', {}).keys())}")
        
        # 出力情報を表示
        outputs = entry.get('outputs', {})
        if outputs:
            print(f"\n出力ノード:")
            for node_id, output_data in outputs.items():
                if 'images' in output_data:
                    for img in output_data['images']:
                        print(f"  画像: {img['filename']}")
        
        # このワークフローを保存
        with open('tools/workflows/working_example.json', 'w', encoding='utf-8') as f:
            json.dump(prompt, f, indent=2, ensure_ascii=False)
        print(f"\n正常動作ワークフローを保存: tools/workflows/working_example.json")
        
        break

if __name__ == "__main__":
    main()
