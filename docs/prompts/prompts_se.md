# 効果音（SE）プロンプト（AI効果音生成用）

ゲーム「悪魔との契約」用の効果音。ElevenLabs Sound Effects等で生成。

---

## システム音（System）

### 1. menu_select
```
Soft UI click sound gentle button press modern interface sound effect short crisp
```

### 2. decide
```
Clear confirmation chime positive feedback sound effect short bright tone UI accept
```

### 3. cancel
```
Soft negative beep gentle cancel sound effect UI back button subtle rejection tone
```

### 4. page_turn
```
Paper page turning sound effect book flip soft rustle single page
```

### 5. save
```
Short success chime data save complete sound effect positive confirmation tone
```

### 6. load
```
Short loading complete sound effect data retrieve positive feedback tone
```

---

## 日常音（Daily Life）

### 7. door_open
```
Wooden classroom door sliding open Japanese school interior sound effect
```

### 8. door_close
```
Wooden door closing shut sound effect indoor room click latch
```

### 9. footsteps_hallway
```
Footsteps walking on school hallway floor indoor shoes multiple steps echo
```

### 10. footsteps_stairs
```
Footsteps climbing stairs indoor concrete steps ascending sound effect
```

### 11. school_chime
```
Japanese school bell chime Westminster melody class start end signal
```

### 12. train_passing
```
Train passing by railway sound effect Japanese commuter train whoosh
```

### 13. train_door
```
Train automatic door opening closing sound effect Japanese railway announcement
```

### 14. karaoke_mic
```
Microphone turning on feedback pop sound effect karaoke equipment
```

---

## 筋肉関連音（Muscle）

### 15. muscle_growth
```
Flesh expanding growing sound effect biological transformation deep rumble tension
```

### 16. cloth_rip
```
Fabric tearing ripping sound effect clothes bursting seams cloth destruction
```

### 17. heavy_footstep
```
Single heavy footstep massive weight impact floor thud deep bass powerful step
```

### 18. sandbag_destroy
```
Punching bag exploding bursting sound effect sand spilling impact destruction
```

### 19. desk_break
```
Wooden desk breaking cracking sound effect furniture destruction wood snapping
```

### 20. impact_punch
```
Heavy punch impact sound effect powerful hit flesh contact deep bass thud
```

### 21. floor_crack
```
Concrete floor cracking sound effect heavy impact ground breaking stress fracture
```

---

## 悪魔関連音（Devil）

### 22. devil_appear
```
Supernatural entity appearing eerie chime dark magic echo mysterious arrival demonic
```

### 23. devil_vanish
```
Supernatural entity disappearing fade out reverse echo dark magic departure
```

### 24. magic_sparkle
```
Magical sparkle shimmer sound effect fantasy spell high pitch twinkle mystical
```

### 25. contract
```
Dark contract seal sound effect ominous bell toll supernatural agreement sinister echo
```

### 26. dimension_shift
```
Dimensional portal transition sound effect otherworldly space shift deep reverb dissonance
```

---

## 感情音（Emotion）

### 27. heartbeat
```
Human heartbeat sound effect realistic pulse rhythm slow steady thump
```

### 28. heartbeat_fast
```
Fast heartbeat sound effect rapid pulse racing heart panic anxiety rhythm
```

### 29. sigh
```
Human deep sigh breath exhale tired disappointed resigned sound effect
```

### 30. gasp
```
Sharp gasp inhale sound effect surprise shock sudden breath intake
```

### 31. distant_cry
```
Distant crying sobbing sound effect far away weeping echo emotional ambient
```

---

## 通知・演出音（Effects）

### 32. notification
```
Smartphone notification sound effect mobile alert ping message received cheerful
```

### 33. camera_shutter
```
Digital camera shutter click sound effect photo capture DSLR snapshot
```

### 34. phone_vibrate
```
Smartphone vibration buzz sound effect mobile phone alert rumble
```

### 35. flash
```
Camera flash sound effect bright light burst photo strobe pop
```

### 36. crowd_murmur
```
Crowd murmuring background ambience people talking distant chatter school hallway
```

---

## 筋肉同好会活動音（Club Activity）

### 37. stamp_sound
```
Rubber stamp pressing sound effect official seal ink pad office approval mark
```

### 38. measuring_tape
```
Measuring tape extending sound effect fabric tape measure pull out click stop
```

### 39. grip_test
```
Hand grip dynamometer squeeze sound effect metal spring tension measurement testing equipment
```

---

## 使用方法
1. ElevenLabs Sound Effects (https://elevenlabs.io/sound-effects) で生成
2. 上記プロンプトをそのまま入力
3. 生成されたファイルを `game/public/assets/se/` に保存
4. ファイル名: `menu_select.mp3`, `muscle_growth.mp3` など

## 注意事項
- MP3形式推奨
- 短い効果音（1〜3秒程度）
- 適切な音量レベルに調整
- ループが必要なもの（heartbeat, crowd_murmurなど）はループ対応形式で
