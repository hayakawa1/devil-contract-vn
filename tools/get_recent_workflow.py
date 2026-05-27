#!/usr/bin/env python3
"""APIから直近に実行したワークフローを取得"""

import requests
import json

def main():
    print("=" * 50)
    print("直近のワークフローを取得")
    print("=" * 50)
    
    try:
        # historyから直近の実行を取得
        print("\n履歴を取得中...")
        response = requests.get("http://127.0.0.1:8188/history")
        history = response.json()
        
        print(f"履歴数: {len(history)}")
        
        if not history:
            print("  履歴が見つかりません")
            return
        
        # 直近のエントリを取得
        latest_id = list(history.keys())[0]
        latest_entry = history[latest_id]
        
        print(f"\n直近の実行ID: {latest_id}")
        print(f"  ステータス: {latest_entry.get('status', {})}")
        
        # ワークフローを取得
        if 'prompt' in latest_entry:
            workflow = latest_entry['prompt']
            print(f"  ワークフロー型: {type(workflow)}")
            
            if isinstance(workflow, list):
                print(f"  ワークフローリスト長: {len(workflow)}")
                if len(workflow) > 2:
                    nodes = workflow[2]
                    print(f"  ノード数: {len(nodes)}")
                    
                    # ノードの種類を表示
                    print("\nノード:")
                    for node_id, node_data in nodes.items():
                        class_type = node_data.get('class_type', 'Unknown')
                        print(f"  [{node_id}] {class_type}")
                    
                    # LoRAノードを探す
                    print("\nLoRAノード:")
                    for node_id, node_data in nodes.items():
                        class_type = node_data.get('class_type', '')
                        if 'LoraLoader' in class_type:
                            inputs = node_data.get('inputs', {})
                            lora_name = inputs.get('lora_name', 'N/A')
                            strength_model = inputs.get('strength_model', 'N/A')
                            strength_clip = inputs.get('strength_clip', 'N/A')
                            print(f"  [{node_id}] {lora_name}")
                            print(f"       strength_model: {strength_model}")
                            print(f"       strength_clip: {strength_clip}")
                    
                    # ControlNetノードを探す
                    print("\nControlNetノード:")
                    for node_id, node_data in nodes.items():
                        class_type = node_data.get('class_type', '')
                        if 'ControlNet' in class_type:
                            inputs = node_data.get('inputs', {})
                            print(f"  [{node_id}] {class_type}")
                    
                    # プロンプトを表示
                    print("\nプロンプト:")
                    for node_id, node_data in nodes.items():
                        class_type = node_data.get('class_type', '')
                        if 'CLIPTextEncode' in class_type:
                            inputs = node_data.get('inputs', {})
                            text = inputs.get('text', '')
                            is_negative = 'negative' in str(node_id).lower() or len(text) > 100 and 'worst' in text.lower()
                            label = "ネガティブ" if is_negative else "ポジティブ"
                            print(f"  {label} [{node_id}]: {text[:150]}...")
            
            # ワークフローを保存
            output_file = "tools/tools/workflows/latest_api_workflow.json"
            with open(output_file, 'w', encoding='utf-8') as f:
                json.dump(workflow, f, indent=2, ensure_ascii=False)
            print(f"\nワークフローを保存: {output_file}")
    
    except Exception as e:
        print(f"エラー: {e}")
        import traceback
        traceback.print_exc()
    
    print("\n" + "=" * 50)

if __name__ == "__main__":
    main()
