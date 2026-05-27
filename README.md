# 悪魔との契約 - プロジェクト構成

現代学園筋肉変化ADVゲーム「悪魔との契約」の開発プロジェクト。

---

## 📁 ディレクトリ構成

悪魔との契約/
├── game/                  # ゲーム本体
│   ├── index.html         # エントリーポイント
│   ├── main.js            # ゲームエンジン（独自実装）
│   ├── style.css          # スタイルシート
│   └── public/            # 公開アセット
│       ├── assets/        # 画像・音声データ
│       └── scenarios/     # シナリオデータ（.ks / .json）
│           ├── prologue.ks           # プロローグ
│           ├── episode*.ks           # 共通エピソード
│           ├── route_*.ks            # 個別ルート
│           └── full_game_scenario.json # シナリオ統合データ
│
├── tools/                 # 開発・分析ツール
│   ├── analyze_working_workflow.py
│   └── ...
│
├── CLAUDE.md              # AIアシスタント用ガイド
└── README.md              # 本ファイル

---

## 🎮 ゲーム概要

**ジャンル**：現代学園筋肉変化ADV
**テーマ**：超正常刺激への依存・資源化・選択の重み

### コアコンセプト
- 悪魔との契約で7人のヒロインが筋肉化
- 4段階の変化システム（Stage 0 → 4）
- 解毒剤は1人分のみ → 選択の重み
- 「資源化」：ヒロインが主人公を恋愛対象ではなく資源として認識
- 全15〜21種類のマルチエンディング

---

## 📁 シナリオ管理

現在、シナリオは **`game/public/scenarios/`** に集約されています。

- **形式**: TyranoScript (`.ks`) および JSON (`.json`)
- **構成**:
  - `prologue.ks`: プロローグ（全ルート共通）
  - `episode*.ks`: 共通ルートのエピソード
  - `route_*.ks`: 各ヒロインの個別ルート + ハーレムルート
  - `full_game_scenario.json`: 全シナリオを含む統合データ

> [!NOTE]
> 以前の `docs/scenario/` や `ルート/` ディレクトリ構造は廃止され、ゲームエンジンが直接読み込める形式に移行しました。

### シナリオ部分反映スクリプト

不良ルートの冒頭修正を公開シナリオへ反映する場合:

```bash
node tools/merge_scenario.js
```

変更内容だけ確認したい場合:

```bash
node tools/merge_scenario.js --dry-run
```

別ファイルに使う場合:

```bash
node tools/merge_scenario.js path/to/source.ks game/public/scenarios/target.ks 501
```

---

## 🎯 7人のヒロイン

1. **幼なじみ** - 家族との関係・居場所
2. **生徒会長** - 完璧主義・社会的立場
3. **ギャル** - SNS・承認欲求
4. **オタク** - 科学的好奇心・自己実験
5. **格闘技部** - 勝利への執着・女性性
6. **不良** - 孤独・過去のトラウマ
7. **友達の妹** - 憧れ・兄との関係

---

## 🚀 開発状況

### ✅ 実装済み
- **ゲームエンジン**: Vanilla JSによる独自ノベルエンジン（TyranoScript互換パーサー搭載）
- **シナリオ**:
    - プロローグ (`prologue.ks`)
    - 共通エピソード (`episode01-03.ks`)
    - 全個別ルート (`route_*.ks`)
    - ハーレムルート (`route_harem.ks`)
- **システム**:
    - 立ち絵・背景・BGM・SE再生
    - 選択肢・分岐・フラグ管理
    - バックログ・設定画面

### 🔄 今後の課題
- 演出の強化（エフェクト、アニメーション）
- UIのブラッシュアップ
- セーブ/ロード機能の本格実装

---

## ⚠️ 注意事項（音楽ファイル）

以下のBGMファイルは現在使用中のためassets/bgm/に移動できませんでした：
- bgm_daily.mp3（重複: bgm_daily (1).mp3）
- bgm_despair.mp3（重複: bgm_despair (1).mp3）
- bgm_devil.mp3（重複: bgm_devil (1).mp3）
- bgm_ending.mp3（重複: bgm_ending (1).mp3）
- bgm_fight.mp3（重複: bgm_fight (1).mp3）
- bgm_isolation.mp3（重複: bgm_isolation (1).mp3）
- bgm_romance.mp3（重複: bgm_romance (1).mp3）
- bgm_tension.mp3（重複: bgm_tension (1).mp3）
- bgm_truth.mp3（重複: bgm_truth (1).mp3）
- gm_sadness.mp3（重複: gm_sadness (1).mp3）

**対処方法**：
1. 使用中のアプリケーション（音楽プレーヤーなど）を終了
2. 手動でassets/bgm/に移動
3. 重複ファイル（(1)付き）は削除推奨

---

## 📝 更新履歴

- 2026-01-16: **シナリオ整合性チェック完了**
  - 既存シナリオ（共通/ + ルート/）と新規シナリオ（docs/scenario/）の整合性確認
  - 不足していたBGM/SE/背景プロンプトを追加
  - シナリオ整合性レポート作成
- 2026-01-16: プロジェクトファイル整理
- 2026-01-16: 特殊イベント集完成
- 2026-01-16: 全ルートBAD END完成
- 2026-01-16: ハーレムルート2エンディング完成
- 2026-01-16: 幼なじみルート Episode 2-6 完成

---

## 🔧 使用ツール

- **画像生成**: DALL-E 3 / ComfyUI
- **BGM生成**: Suno
- **効果音生成**: ElevenLabs Sound Effects
- **ゲームエンジン**: Custom Web Engine (Vanilla JS + TyranoScript Parser)

---

## 📄 ライセンス

個人開発プロジェクト
