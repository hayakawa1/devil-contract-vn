# ファイル整理ガイド

Windows のプロセスがファイルをロックしているため、以下のファイルを**手動で移動**してください。

---

## 📁 移動が必要なファイル

### 1. 効果音ファイル (.wav) → `assets\se\` へ移動

```
cancel.wav
decide.wav
load.wav
menu_select.wav
page_turn.wav
save.wav
```

**移動先**: `assets\se\`

---

### 2. 背景画像 (.png) → `assets\images\backgrounds\` へ移動

```
childhood_friend_home.png
classroom.png
club_room.png
devil_space.png
devil_space_dark.png
dojo.png
gym.png
hallway.png
karaoke.png
nurse_office.png
park.png
park_night.png
protagonist_home.png
protagonist_room.png
riverbank.png
rooftop.png
science_prep_room.png
station.png
street_evening.png
street_night.png
student_council_room.png
train_interior.png
```

**移動先**: `assets\images\backgrounds\`

---

### 3. Pythonスクリプト (.py) → `tools\` へ移動

```
generate_characters.py
generate_characters_v2.py
generate_characters_v2_resume.py
```

**移動先**: `tools\`

---

## 🔧 ファイルがロックされている場合の対処法

### 方法1: エクスプローラーを再起動
1. タスクマネージャーを開く（Ctrl+Shift+Esc）
2. 「プロセス」タブで「エクスプローラー」を探す
3. 右クリック → 「タスクの終了」
4. 「ファイル」→「新しいタスクの実行」→「explorer.exe」と入力して実行
5. ファイルを移動

### 方法2: セーフモードで移動
1. PCを再起動
2. 起動時にF8キーを押してセーフモードで起動
3. ファイルを移動

### 方法3: コマンドプロンプトで強制移動
```batch
cd "c:\Users\hayak\Dropbox\悪魔との契約"

REM 効果音
move /Y *.wav assets\se\

REM 背景画像
move /Y *.png assets\images\backgrounds\

REM スクリプト
move /Y generate_characters*.py tools\
```

---

## ✅ 移動完了後の確認

整理が完了すると、プロジェクトは以下の構造になります：

```
悪魔との契約/
├── README.md                           # プロジェクト説明
├── FILE_ORGANIZATION.md                # このファイル（削除可）
├── organize_files.bat                  # 整理スクリプト（削除可）
├── organize_files.ps1                  # 整理スクリプト（削除可）
│
├── docs/                               # ドキュメント
│   ├── design/                        # 設計資料
│   ├── prompts/                       # AI生成プロンプト
│   └── scenario/                      # シナリオファイル
│
├── assets/                            # ゲームアセット
│   ├── bgm/                          # BGMファイル
│   ├── se/                           # 効果音ファイル
│   └── images/
│       └── backgrounds/              # 背景画像
│
├── tools/                             # 開発ツール
│   ├── convert_scenario.py
│   ├── generate_characters.py
│   ├── generate_characters_v2.py
│   └── base_workflow.json
│
├── game/                              # ゲーム本体
├── ルート/                            # 個別ルート
└── 共通/                              # 共通ファイル
```

---

## 🗑️ 整理完了後に削除してよいファイル

以下のファイルは整理作業用のため、完了後は削除できます：

- `FILE_ORGANIZATION.md` （このファイル）
- `organize_files.bat`
- `organize_files.ps1`

---

## 📝 移動チェックリスト

- [ ] 効果音ファイル 6個を `assets\se\` に移動
- [ ] 背景画像 22個を `assets\images\backgrounds\` に移動
- [ ] Pythonスクリプト 3個を `tools\` に移動
- [ ] ルートディレクトリに README.md 以外のファイルがないことを確認
- [ ] 整理用スクリプトを削除
