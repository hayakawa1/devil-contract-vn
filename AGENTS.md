# AGENTS.md

This file provides guidance to Codex (Codex.ai/code) when working with code in this repository.

## Build and Run Commands

```bash
cd game
npm install    # Install dependencies (first time only)
npm run dev    # Start Vite dev server at http://localhost:5173
npm run build  # Production build
```

## Architecture Overview

This is a visual novel game engine built with vanilla JavaScript and Vite.

### Core Classes (game/main.js)

**TyranoParser** (lines 10-480): Parses TyranoScript (.ks) files into internal command objects. Handles tags like `[bg]`, `[chara_show]`, `[playbgm]`, `[glink]`, `[if]`/`[endif]`, and speaker lines (`#character_name`).

**GameEngine** (lines 482-1826): Main game controller handling:
- Screen management (title, episodes, game, config, character gallery)
- Scenario loading (.ks preferred, .json fallback)
- Command execution loop with typewriter text display
- Character sprite display with stage-based resolution
- Audio playback (BGM/SE)
- Choice handling, jumps, and conditional branching
- Affinity tracking and flag system

### Scenario Format

TyranoScript (.ks) files in `game/public/scenarios/`:
```
*label_name
[bg storage="classroom.png"]
[chara_show name="furyo" face="neutral" pos="center"]
#furyo
セリフテキスト
[glink text="選択肢1" target="*label1"]
```

### Asset Structure

```
game/public/assets/
├── characters/     # {char}_{stage}_{expression}.png (e.g., furyo_stage1_smile.png)
├── backgrounds/    # Background images
├── bgm/           # Music files (mp3)
├── characters.json # Character definitions with stage sprites
└── episodes.json  # Episode list and unlock conditions
```

### Character Stage System

Characters have muscle transformation stages defined in characters.json:
- `neutral`: Normal state
- `stage1`: Muscular
- `stage2`: Monster level

`resolveCharacterImage()` in GameEngine maps sprite requests to stage-appropriate images.

### Image Path

Character images are loaded from `public/assets/characters/` via the path in line ~1417 of main.js.
