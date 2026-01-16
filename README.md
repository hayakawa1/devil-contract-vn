# 悪魔との契約 - プロジェクト構成

現代学園筋肉変化ADVゲーム「悪魔との契約」の開発プロジェクト。

---

## 📁 ディレクトリ構成

```
悪魔との契約/
├── docs/                   # ドキュメント類
│   ├── design/            # 設計資料
│   │   ├── system_4stages.md       # 4段階変化システム仕様
│   │   ├── bad_endings.md          # 全ルートBAD END集
│   │   ├── special_events.md       # 特殊イベント集（コメディ）
│   │   ├── シナリオ構造設計.md     # シナリオ全体構造
│   │   └── ルート分岐設計.md       # 分岐・エンディング設計
│   ├── prompts/           # AI生成用プロンプト
│   │   ├── prompts_characters.md   # キャラクター画像生成用
│   │   ├── prompts_backgrounds.md  # 背景画像生成用
│   │   ├── prompts_music.md        # BGM生成用（Suno）
│   │   └── prompts_se.md           # 効果音生成用（ElevenLabs）
│   └── scenario/          # シナリオファイル
│       ├── シナリオ.txt            # メインシナリオ（全ルート）
│       ├── シナリオ.json           # JSON形式
│       ├── シナリオ_plain.txt      # プレーンテキスト版
│       ├── シナリオ_script.txt     # スクリプト版
│       └── シナリオ_renpy.rpy      # Ren'Py形式
│
├── assets/                 # ゲームアセット
│   ├── bgm/               # BGMファイル（.mp3）
│   ├── se/                # 効果音ファイル（.wav）
│   └── images/            # 画像ファイル（.png）
│       └── backgrounds/   # 背景画像
│
├── tools/                 # 開発用ツール
│   ├── convert_scenario.py           # シナリオ形式変換
│   ├── generate_characters.py        # キャラクター画像生成
│   ├── generate_characters_v2.py     # キャラクター画像生成 v2
│   └── base_workflow.json            # ComfyUIワークフロー
│
├── game/                  # ゲーム本体（実装中）
│   └── public/           # 公開アセット
│
├── ルート/                # 個別ルートファイル（開発中）
│   ├── 幼なじみ/
│   ├── 生徒会/
│   ├── ギャル/
│   ├── オタク/
│   ├── 格闘技部/
│   ├── 不良/
│   ├── 友達の妹/
│   └── ハーレム/
│
└── 共通/                  # 共通ファイル（開発中）
```

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

## 📋 主要ドキュメント

### プロジェクト管理
- [SCENARIO_INTEGRATION_REPORT.md](SCENARIO_INTEGRATION_REPORT.md) - シナリオ整合性レポート（重要）

### 設計資料
- [system_4stages.md](docs/design/system_4stages.md) - 変化システムの詳細仕様
- [ルート分岐設計.md](docs/design/ルート分岐設計.md) - 全ルートの分岐・エンディング設計
- [bad_endings.md](docs/design/bad_endings.md) - 各ルートのBAD END詳細
- [special_events.md](docs/design/special_events.md) - コメディイベント集

### シナリオ

プロジェクトには**2種類のシナリオ形式**が存在します：

#### 1. 小説形式（ストーリー参照用）
**場所**: [docs/scenario/](docs/scenario/)
- **用途**: ストーリー全体の把握、読み物として楽しむ
- **特徴**: 心理描写が詳細、Episode構造（1-6）
- **ファイル**:
  - [シナリオ.txt](docs/scenario/シナリオ.txt) - 全7ルート + ハーレム完全版
  - シナリオ.json, シナリオ_renpy.rpy など（変換版）

#### 2. スクリプト形式（ゲーム実装用）
**場所**: [共通/](共通/) および [ルート/](ルート/)
- **用途**: ゲームエンジンへの実装、演出の確認
- **特徴**: BGM/SE/背景指定あり、Scene単位で詳細分割
- **ファイル**:
  - [共通/00_プロローグ.txt](共通/00_プロローグ.txt) - Day 1-3の共通ルート
  - [共通/悪魔台詞集.txt](共通/悪魔台詞集.txt) - 全ルート共通テンプレート
  - [ルート/幼なじみ/](ルート/幼なじみ/) など - 各ヒロインの個別ルート

**使い分け**:
- ストーリー執筆 → 小説形式（docs/scenario/）
- ゲーム実装 → スクリプト形式（共通/ + ルート/）
- 両方を手動で同期管理

### AI生成プロンプト
- [prompts_characters.md](docs/prompts/prompts_characters.md) - 9キャラ × 5段階
- [prompts_backgrounds.md](docs/prompts/prompts_backgrounds.md) - 23背景（gym_corner追加）
- [prompts_music.md](docs/prompts/prompts_music.md) - 13 BGM（bgm_training追加）
- [prompts_se.md](docs/prompts/prompts_se.md) - 39効果音（同好会活動音3種追加）

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

### ✅ 完成
- 全7ルート + ハーレムルートのシナリオ
- 4段階変化システム設計
- BAD ENDシナリオ
- コメディイベント集
- AI生成用プロンプト一式

### 🔄 進行中
- ゲーム実装
- アセット生成

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
- **ゲームエンジン**: （検討中: Ren'Py / Unity）

---

## 📄 ライセンス

個人開発プロジェクト
