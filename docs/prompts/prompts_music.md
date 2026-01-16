# 音楽プロンプト（Suno用）

ゲーム「悪魔との契約」用のBGM。現代学園、ダークファンタジー、筋肉契約ADV。

---

## 1. bgm_title（タイトル画面BGM）
**Style:** Dark Fantasy, Mysterious
```
[Style: Dark orchestral, mysterious]
[Tempo: Slow, 70 BPM]
[Mood: Ominous, alluring, fateful]
[Instruments: Strings, piano, choir whispers, subtle bells]

Mysterious title theme, devil contract atmosphere, ominous but beautiful, fateful encounters, dark visual novel opening, loop-friendly, instrumental only
```

---

## 2. bgm_daily（日常BGM）
**Style:** School Life, Peaceful
```
[Style: Light acoustic, school life]
[Tempo: Medium, 100 BPM]
[Mood: Peaceful, everyday, slightly melancholic]
[Instruments: Acoustic guitar, piano, light strings, soft percussion]

High school daily life theme, peaceful school atmosphere, everyday moments, calm and comfortable, slice of life feeling, loop-friendly, instrumental only
```

---

## 3. bgm_muscle_club（筋肉同好会BGM）
**Style:** Comedy with Unease
```
[Style: Quirky comedy, slightly unsettling]
[Tempo: Medium, 110 BPM]
[Mood: Awkward, comedic, uncomfortable]
[Instruments: Playful xylophone, strings with tension, comedic brass]

Awkward club activity theme, forced cheerfulness hiding discomfort, comedy that feels wrong, visual novel comedy with dark undertones, loop-friendly, instrumental only
```

---

## 4. bgm_devil（悪魔登場BGM）
**Style:** Eerie, Unsettling
```
[Style: Eerie minimalist, psychological horror]
[Tempo: Slow, 60 BPM]
[Mood: Cold, detached, menacing]
[Instruments: Ambient synth, music box, reversed strings, minimal piano]

Devil appearance theme, emotionless menace, cold and calculated, Kyubey-like atmosphere, beautiful but wrong, loop-friendly, instrumental only
```

---

## 5. bgm_tension（緊張BGM）
**Style:** Suspense, Conflict
```
[Style: Tense orchestral, drama]
[Tempo: Medium-fast, 120 BPM]
[Mood: Tense, confrontational, urgent]
[Instruments: Strings, percussion, tense piano, brass accents]

Conflict and crisis theme, arguments and revelations, rising tension, dramatic confrontation, visual novel tension scene, loop-friendly, instrumental only
```

---

## 6. bgm_sadness（悲しみBGM）
**Style:** Melancholic, Emotional
```
[Style: Melancholic piano, emotional]
[Tempo: Slow, 65 BPM]
[Mood: Sad, regretful, painful]
[Instruments: Solo piano, gentle strings, soft cello]

Heroine suffering theme, painful emotions, regret and sorrow, cannot return to normal, melancholic visual novel scene, loop-friendly, instrumental only
```

---

## 7. bgm_romance（恋愛BGM）
**Style:** Sweet Romance, Bittersweet
```
[Style: Romantic orchestral, bittersweet]
[Tempo: Medium-slow, 80 BPM]
[Mood: Sweet, loving, tinged with sadness]
[Instruments: Strings, piano, harp, gentle woodwinds]

Romance theme with hidden pain, love despite everything, sweet but tragic, visual novel romance scene, warm but melancholic, loop-friendly, instrumental only
```

---

## 8. bgm_despair（絶望BGM）
**Style:** Dark, Despair
```
[Style: Dark ambient, despair]
[Tempo: Very slow, 50 BPM]
[Mood: Hopeless, crushing, defeated]
[Instruments: Low strings, deep bass, dissonant piano, ambient drones]

Despair and destruction theme, bad ending atmosphere, hopeless situation, crushing defeat, dark visual novel climax, loop-friendly, instrumental only
```

---

## 9. bgm_truth（真相BGM）
**Style:** Mystery Revelation
```
[Style: Mysterious orchestral, revelation]
[Tempo: Medium, 90 BPM]
[Mood: Mysterious, enlightening, unsettling truth]
[Instruments: Piano, strings, choir, subtle electronic elements]

Truth revelation theme, mystery unraveling, hidden world exposed, researcher's discovery, visual novel truth route, loop-friendly, instrumental only
```

---

## 10. bgm_ending（エンディングBGM）
**Style:** Bittersweet Resolution
```
[Style: Emotional orchestral, resolution]
[Tempo: Slow-medium, 75 BPM]
[Mood: Bittersweet, acceptance, hope and resignation]
[Instruments: Full orchestra, piano lead, warm strings, gentle choir]

Ending theme, acceptance of fate, bittersweet resolution, hope mixed with resignation, visual novel ending credits, emotional closure, loop-friendly or fadeout-friendly, instrumental only
```

---

## 11. bgm_fight（戦闘・対決BGM）
**Style:** Intense Action
```
[Style: Intense orchestral, action]
[Tempo: Fast, 140 BPM]
[Mood: Powerful, intense, overwhelming strength]
[Instruments: Heavy percussion, brass, aggressive strings, drums]

Physical confrontation theme, overwhelming power, martial arts battle, unstoppable force, intense action scene, loop-friendly, instrumental only
```

---

## 12. bgm_isolation（孤立BGM）
**Style:** Lonely, Atmospheric
```
[Style: Atmospheric ambient, lonely]
[Tempo: Slow, 55 BPM]
[Mood: Isolated, distant, alone despite power]
[Instruments: Ambient pads, distant piano, echoing strings, emptiness]

Isolation despite strength theme, powerful but alone, nobody approaches, quiet loneliness, visual novel emotional scene, loop-friendly, instrumental only
```

---

## 13. bgm_training（トレーニングBGM）
**Style:** Energetic, Motivational
```
[Style: Upbeat rock, motivational]
[Tempo: Fast, 130 BPM]
[Mood: Energetic, determined, pushing limits]
[Instruments: Electric guitar, driving drums, bass, energetic synth]

Workout and training theme, gym atmosphere, physical effort, determination and sweat, pushing beyond limits, energetic sports montage, loop-friendly, instrumental only
```

---

## 使用方法
1. Sunoで新規作成
2. Custom Modeを選択
3. Style/Lyricsに上記プロンプトを入力
4. Instrumentalを選択（歌詞なし）
5. 生成された曲を `game/public/assets/bgm/` に保存
6. ファイル名: `bgm_title.mp3`, `bgm_daily.mp3` など

## 注意事項
- ループ可能な曲になるよう「loop-friendly」を指定
- 1〜2分程度の長さで生成
- 必要に応じて複数生成してベストを選択
- エンディングBGMはループとフェードアウト両対応
