/**
 * 悪魔との契約 - ビジュアルノベルエンジン
 */

class GameEngine {
  constructor() {
    this.currentScreen = 'title-screen';
    this.scenarios = {};
    this.characters = {};
    this.episodes = [];
    this.currentScenario = null;
    this.currentIndex = 0;
    this.backlog = [];
    this.isAutoMode = false;
    this.isSkipMode = false;
    this.textSpeed = 5;
    this.autoSpeed = 5;
    this.isTyping = false;
    this.currentText = '';
    this.displayedText = '';
    this.typeInterval = null;

    this.init();
  }

  async init() {
    await this.loadData();
    this.setupEventListeners();
    this.renderEpisodeList();
    this.renderCharacterList();
    this.loadSettings();
    // タイトル画面でメニューBGMを再生
    this.playMenuBgm();
  }

  async loadData() {
    try {
      // キャラクターデータ読み込み
      const charRes = await fetch('public/assets/characters.json');
      this.characters = await charRes.json();

      // エピソードデータ読み込み
      const epRes = await fetch('public/assets/episodes.json');
      const epData = await epRes.json();
      this.episodes = epData.episodes;

      console.log('Data loaded:', this.episodes.length, 'episodes');
    } catch (error) {
      console.error('Failed to load data:', error);
    }
  }

  async loadScenario(scenarioName) {
    try {
      const res = await fetch(`public/scenarios/${scenarioName}.json`);
      const data = await res.json();
      this.scenarios[scenarioName] = data[scenarioName];
      return this.scenarios[scenarioName];
    } catch (error) {
      console.error('Failed to load scenario:', scenarioName, error);
      return null;
    }
  }

  setupEventListeners() {
    // タイトル画面
    document.getElementById('btn-episodes').addEventListener('click', () => {
      this.showScreen('episodes-screen');
    });

    document.getElementById('btn-characters').addEventListener('click', () => {
      this.showScreen('characters-screen');
    });

    document.getElementById('btn-config').addEventListener('click', () => {
      this.showScreen('config-screen');
    });

    // 戻るボタン
    document.getElementById('btn-episodes-back').addEventListener('click', () => {
      this.showScreen('title-screen');
    });

    document.getElementById('btn-characters-back').addEventListener('click', () => {
      this.showScreen('title-screen');
    });

    document.getElementById('btn-detail-back').addEventListener('click', () => {
      this.showScreen('characters-screen');
    });

    document.getElementById('btn-config-back').addEventListener('click', () => {
      this.showScreen('title-screen');
    });

    document.getElementById('btn-log-back').addEventListener('click', () => {
      this.showScreen('game-screen');
    });

    // ゲーム画面
    document.getElementById('text-window').addEventListener('click', () => {
      this.advanceText();
    });

    document.getElementById('btn-auto').addEventListener('click', () => {
      this.toggleAuto();
    });

    document.getElementById('btn-skip').addEventListener('click', () => {
      this.toggleSkip();
    });

    document.getElementById('btn-log').addEventListener('click', () => {
      this.showBacklog();
    });

    document.getElementById('btn-game-menu').addEventListener('click', () => {
      this.showGameMenu();
    });

    // ゲームメニュー（onclickを使用してDOM置換時も対応）
    document.getElementById('btn-resume').onclick = () => {
      this.hideGameMenu();
    };

    document.getElementById('btn-to-episodes').onclick = () => {
      this.hideGameMenu();
      this.stopGame();
      this.showScreen('episodes-screen');
    };

    document.getElementById('btn-to-title').onclick = () => {
      this.hideGameMenu();
      this.stopGame();
      this.showScreen('title-screen');
    };

    // キーボード
    document.addEventListener('keydown', (e) => {
      if (this.currentScreen === 'game-screen') {
        if (e.code === 'Space' || e.code === 'Enter') {
          e.preventDefault();
          this.advanceText();
        } else if (e.code === 'Escape') {
          this.showGameMenu();
        }
      }
    });

    // 設定変更
    document.getElementById('text-speed').addEventListener('input', (e) => {
      this.textSpeed = parseInt(e.target.value);
      this.saveSettings();
    });

    document.getElementById('auto-speed').addEventListener('input', (e) => {
      this.autoSpeed = parseInt(e.target.value);
      this.saveSettings();
    });

    document.getElementById('bgm-volume').addEventListener('input', (e) => {
      const bgm = document.getElementById('bgm');
      bgm.volume = e.target.value / 100;
      this.saveSettings();
    });

    document.getElementById('se-volume').addEventListener('input', (e) => {
      const se = document.getElementById('se');
      se.volume = e.target.value / 100;
      this.saveSettings();
    });

    // キャラクターフィルター
    document.querySelectorAll('.filter-btn').forEach(btn => {
      btn.addEventListener('click', (e) => {
        document.querySelectorAll('.filter-btn').forEach(b => b.classList.remove('active'));
        e.target.classList.add('active');
        this.filterCharacters(e.target.dataset.filter);
      });
    });
  }

  showScreen(screenId) {
    document.querySelectorAll('.screen').forEach(s => s.classList.remove('active'));
    document.getElementById(screenId).classList.add('active');
    this.currentScreen = screenId;

    // メニュー画面に戻ったときはメニューBGMを再生
    const menuScreens = ['title-screen', 'episodes-screen', 'characters-screen', 'character-detail-screen', 'config-screen'];
    if (menuScreens.includes(screenId)) {
      this.playMenuBgm();
    }
  }

  playMenuBgm() {
    const bgm = document.getElementById('bgm');
    const menuBgmFile = 'public/assets/bgm/bgm_menu.mp3';
    // 既にメニューBGMが再生中なら何もしない
    if (bgm.src.endsWith('bgm_menu.mp3')) {
      return;
    }
    bgm.src = menuBgmFile;
    bgm.play().catch(e => console.log('Menu BGM autoplay blocked:', e));
  }

  renderEpisodeList() {
    const container = document.getElementById('episode-list');
    container.innerHTML = '';

    const stageNames = this.characters.stages || {};

    this.episodes.forEach(ep => {
      const card = document.createElement('div');
      card.className = 'episode-card';
      card.innerHTML = `
        <div class="ep-title">${ep.title}</div>
        <div class="ep-subtitle">「${ep.subtitle}」</div>
        <div class="ep-description">${ep.description}</div>
        <span class="ep-stage">${stageNames[ep.stage]?.name || ep.stage}</span>
      `;
      card.addEventListener('click', () => this.startEpisode(ep));
      container.appendChild(card);
    });
  }

  renderCharacterList(filter = 'all') {
    const container = document.getElementById('character-grid');
    container.innerHTML = '';

    const chars = this.characters.characters || {};

    Object.entries(chars).forEach(([id, char]) => {
      if (id === 'protagonist') return; // 主人公は除外

      if (filter !== 'all') {
        const type = char.type || 'classmate';
        if (filter !== type) return;
      }

      const card = document.createElement('div');
      card.className = 'character-card';
      card.innerHTML = `
        <div class="char-portrait" style="background-image: url('public/assets/characters/${id}_neutral.png')"></div>
        <div class="char-name">${char.name_display || char.name}</div>
        <div class="char-role">${char.role || ''}</div>
      `;
      card.addEventListener('click', () => this.showCharacterDetail(id, char));
      container.appendChild(card);
    });
  }

  filterCharacters(filter) {
    this.renderCharacterList(filter);
  }

  showCharacterDetail(id, char) {
    const portrait = document.getElementById('detail-portrait');
    portrait.style.backgroundImage = `url('public/assets/characters/${id}_neutral.png')`;
    document.getElementById('detail-name').textContent = char.name_display || char.name;
    document.getElementById('detail-meta').innerHTML = `
      <div>役割: ${char.role || '不明'}</div>
      <div>タイプ: ${char.type || '同級生'}</div>
    `;
    document.getElementById('detail-description').textContent = char.description || '情報なし';

    // 登場エピソードを検索
    const epContainer = document.getElementById('detail-episodes');
    epContainer.innerHTML = '';

    this.episodes.forEach(ep => {
      if (ep.featured_characters?.includes(id)) {
        const tag = document.createElement('span');
        tag.className = 'ep-tag';
        tag.textContent = ep.title;
        tag.addEventListener('click', () => {
          this.showScreen('game-screen');
          this.startEpisode(ep);
        });
        epContainer.appendChild(tag);
      }
    });

    this.showScreen('character-detail-screen');
  }

  async startEpisode(episode) {
    const scenarioName = episode.scenario;
    let scenario = this.scenarios[scenarioName];

    if (!scenario) {
      scenario = await this.loadScenario(scenarioName);
    }

    if (!scenario) {
      console.error('Scenario not found:', scenarioName);
      return;
    }

    this.currentScenario = scenario;
    this.currentEpisode = episode;
    this.currentIndex = 0;
    this.backlog = [];
    this.isAutoMode = false;
    this.isSkipMode = false;

    // ステータス更新
    document.getElementById('stat-episode').textContent = episode.title || 'プロローグ';
    const stageNames = this.characters.stages || {};
    document.getElementById('stat-stage').textContent = stageNames[episode.stage]?.name || episode.stage;

    // 最初のヒロインを設定（主人公と悪魔は除外）
    const heroineId = episode.featured_characters?.find(id =>
      id !== 'protagonist' && id !== 'akuma'
    );
    if (heroineId) {
      const char = this.characters.characters?.[heroineId];
      document.getElementById('stat-heroine').textContent = char?.name_display || char?.name || '---';
    } else {
      document.getElementById('stat-heroine').textContent = '---';
    }

    this.showScreen('game-screen');
    this.clearCharacters();
    this.processCommand();
  }

  processCommand() {
    if (!this.currentScenario || this.currentIndex >= this.currentScenario.length) {
      this.endScenario();
      return;
    }

    const cmd = this.currentScenario[this.currentIndex];

    switch (cmd.type) {
      case 'bg':
        this.setBackground(cmd.image);
        this.currentIndex++;
        this.processCommand();
        break;

      case 'bgm':
        this.playBgm(cmd.file);
        this.currentIndex++;
        this.processCommand();
        break;

      case 'char':
        this.showCharacter(cmd.position, cmd.image, cmd.highlight);
        this.currentIndex++;
        this.processCommand();
        break;

      case 'char_exit':
        this.hideCharacter(cmd.position);
        this.currentIndex++;
        this.processCommand();
        break;

      case 'text':
        this.showText(cmd.speaker, cmd.text);
        break;

      case 'monologue':
        this.showText('', cmd.text, true);
        break;

      case 'stat':
        this.showStatChange(cmd.name, cmd.value);
        break;

      case 'status':
        this.updateStatus(cmd.stage, cmd.heroine);
        this.currentIndex++;
        this.processCommand();
        break;

      case 'end':
        this.endScenario();
        break;

      default:
        this.currentIndex++;
        this.processCommand();
    }
  }

  setBackground(image) {
    const bg = document.getElementById('background');
    // 実際の背景画像を使用
    bg.style.backgroundImage = `url('public/assets/backgrounds/${image}.png')`;
    bg.style.backgroundSize = 'cover';
    bg.style.backgroundPosition = 'center';
  }

  playBgm(file) {
    const bgm = document.getElementById('bgm');
    bgm.src = `public/assets/bgm/${file}`;
    bgm.play().catch(e => console.log('BGM autoplay blocked:', e));
  }

  showCharacter(position, image, highlight) {
    const posMap = {
      'left': 'char-left',
      'center': 'char-center',
      'right': 'char-right'
    };
    const elemId = posMap[position] || 'char-center';
    const elem = document.getElementById(elemId);

    // 新しいキャラクターが登場する場合はアニメーション
    const isNewChar = !elem.classList.contains('visible');

    // キャラクター画像を設定
    elem.style.backgroundImage = `url('public/assets/characters/${image}.png')`;
    // キャラクター名をdata属性に設定（CSS用）
    const charName = image.split('_')[0];
    elem.dataset.character = charName;
    elem.classList.add('visible');

    if (isNewChar) {
      elem.classList.add('entering');
      setTimeout(() => {
        elem.classList.remove('entering');
      }, 400);
    }

    if (!highlight) {
      elem.classList.add('dimmed');
    } else {
      elem.classList.remove('dimmed');
    }
  }

  hideCharacter(position) {
    const posMap = {
      'left': 'char-left',
      'center': 'char-center',
      'right': 'char-right'
    };
    const elemId = posMap[position] || 'char-center';
    const elem = document.getElementById(elemId);
    elem.classList.remove('visible');
  }

  clearCharacters() {
    ['char-left', 'char-center', 'char-right'].forEach(id => {
      const elem = document.getElementById(id);
      elem.classList.remove('visible', 'dimmed');
    });
  }

  showText(speaker, text, isMonologue = false) {
    // 話者名を取得
    let speakerName = '';
    if (speaker) {
      const char = this.characters.characters?.[speaker];
      speakerName = char?.name_display || char?.name || speaker;
    }

    document.getElementById('speaker-name').textContent = speakerName;

    // バックログに追加
    this.backlog.push({ speaker: speakerName, text: text });

    // テキスト表示
    this.currentText = text;
    this.displayedText = '';
    this.isTyping = true;
    this.startTyping();
  }

  startTyping() {
    const messageElem = document.getElementById('message-text');
    const speed = 50 - (this.textSpeed * 4); // 10〜50ms

    if (this.typeInterval) {
      clearInterval(this.typeInterval);
    }

    let charIndex = 0;
    this.typeInterval = setInterval(() => {
      if (charIndex < this.currentText.length) {
        this.displayedText += this.currentText[charIndex];
        messageElem.textContent = this.displayedText;
        charIndex++;
      } else {
        clearInterval(this.typeInterval);
        this.typeInterval = null;
        this.isTyping = false;
        this.onTextComplete();
      }
    }, speed);
  }

  onTextComplete() {
    if (this.isAutoMode) {
      this.scheduleAutoAdvance();
    } else if (this.isSkipMode) {
      setTimeout(() => {
        if (this.isSkipMode) {
          this.currentIndex++;
          this.processCommand();
        }
      }, 30);
    }
  }

  advanceText() {
    if (this.isTyping) {
      // タイピング中なら即時表示
      clearInterval(this.typeInterval);
      this.typeInterval = null;
      this.displayedText = this.currentText;
      document.getElementById('message-text').textContent = this.displayedText;
      this.isTyping = false;
      this.onTextComplete();
    } else {
      // 次のコマンドへ
      this.currentIndex++;
      this.processCommand();
    }
  }

  showStatChange(name, value) {
    const popup = document.getElementById('stat-popup');
    const sign = value >= 0 ? '+' : '';
    popup.innerHTML = `
      <div style="font-size: 1.5rem; color: #9b59b6;">${name}</div>
      <div style="font-size: 2rem; color: ${value >= 0 ? '#4ecdc4' : '#ff6b6b'};">${sign}${value}</div>
    `;
    popup.classList.remove('hidden');

    setTimeout(() => {
      popup.classList.add('hidden');
      this.currentIndex++;
      this.processCommand();
    }, 1500);
  }

  updateStatus(stage, heroine) {
    // ステータスバーを更新
    if (stage) {
      document.getElementById('stat-stage').textContent = stage;
    }
    if (heroine) {
      document.getElementById('stat-heroine').textContent = heroine;
    }
    // 視覚的フィードバック
    const statusBar = document.getElementById('status-bar');
    statusBar.classList.add('status-changed');
    setTimeout(() => {
      statusBar.classList.remove('status-changed');
    }, 500);
  }

  endScenario() {
    this.stopGame();

    // 次のエピソードを探す
    const currentIdx = this.episodes.findIndex(ep => ep.scenario === this.currentEpisode?.scenario);
    const nextEp = this.episodes[currentIdx + 1];

    if (nextEp) {
      // 次のエピソードがある場合、選択肢を表示
      this.showEndMenu(nextEp);
    } else {
      this.showScreen('episodes-screen');
    }
  }

  showEndMenu(nextEp) {
    const overlay = document.getElementById('game-menu-overlay');
    const menu = overlay.querySelector('.game-menu');
    menu.innerHTML = `
      <h3>エピソード終了</h3>
      <button id="btn-next-episode">次の話へ（${nextEp.title}）</button>
      <button id="btn-end-to-episodes">エピソード選択へ</button>
      <button id="btn-end-to-title">タイトルへ</button>
    `;
    overlay.classList.remove('hidden');

    // イベントリスナーを一度だけ発火させるためonclickを使用
    document.getElementById('btn-next-episode').onclick = () => {
      overlay.classList.add('hidden');
      this.restoreGameMenu();
      this.startEpisode(nextEp);
    };
    document.getElementById('btn-end-to-episodes').onclick = () => {
      overlay.classList.add('hidden');
      this.restoreGameMenu();
      this.showScreen('episodes-screen');
    };
    document.getElementById('btn-end-to-title').onclick = () => {
      overlay.classList.add('hidden');
      this.restoreGameMenu();
      this.showScreen('title-screen');
    };
  }

  restoreGameMenu() {
    // ゲームメニューを元の状態に戻す
    const menu = document.querySelector('.game-menu');
    menu.innerHTML = `
      <h3>メニュー</h3>
      <button id="btn-resume">ゲームに戻る</button>
      <button id="btn-to-episodes">エピソード選択へ</button>
      <button id="btn-to-title">タイトルへ</button>
    `;
    // イベントリスナーを再設定
    document.getElementById('btn-resume').onclick = () => this.hideGameMenu();
    document.getElementById('btn-to-episodes').onclick = () => {
      this.hideGameMenu();
      this.stopGame();
      this.showScreen('episodes-screen');
    };
    document.getElementById('btn-to-title').onclick = () => {
      this.hideGameMenu();
      this.stopGame();
      this.showScreen('title-screen');
    };
  }

  stopGame() {
    this.currentScenario = null;
    this.isAutoMode = false;
    this.isSkipMode = false;
    document.getElementById('btn-auto').classList.remove('active');
    document.getElementById('btn-skip').classList.remove('active');
    if (this.typeInterval) {
      clearInterval(this.typeInterval);
      this.typeInterval = null;
    }
  }

  toggleAuto() {
    this.isAutoMode = !this.isAutoMode;
    this.isSkipMode = false;
    document.getElementById('btn-auto').classList.toggle('active', this.isAutoMode);
    document.getElementById('btn-skip').classList.remove('active');

    // オートモード開始時、現在のテキストが表示済みなら待機後に次へ進む
    if (this.isAutoMode && !this.isTyping) {
      this.scheduleAutoAdvance();
    }
  }

  scheduleAutoAdvance() {
    const delay = (11 - this.autoSpeed) * 500;
    setTimeout(() => {
      if (this.isAutoMode && !this.isTyping) {
        this.currentIndex++;
        this.processCommand();
      }
    }, delay);
  }

  toggleSkip() {
    this.isSkipMode = !this.isSkipMode;
    this.isAutoMode = false;
    document.getElementById('btn-skip').classList.toggle('active', this.isSkipMode);
    document.getElementById('btn-auto').classList.remove('active');

    // スキップモード開始時、現在のテキストが表示済みなら少し待ってから次へ進む
    if (this.isSkipMode && !this.isTyping) {
      setTimeout(() => {
        if (this.isSkipMode && !this.isTyping) {
          this.currentIndex++;
          this.processCommand();
        }
      }, 30);
    }
  }

  showBacklog() {
    const container = document.getElementById('log-content');
    container.innerHTML = '';

    this.backlog.forEach(entry => {
      const div = document.createElement('div');
      div.className = 'log-entry';
      div.innerHTML = `
        <div class="log-speaker">${entry.speaker || '（モノローグ）'}</div>
        <div class="log-text">${entry.text}</div>
      `;
      container.appendChild(div);
    });

    this.showScreen('log-screen');
  }

  showGameMenu() {
    document.getElementById('game-menu-overlay').classList.remove('hidden');
  }

  hideGameMenu() {
    document.getElementById('game-menu-overlay').classList.add('hidden');
  }

  loadSettings() {
    try {
      const settings = JSON.parse(localStorage.getItem('devil-contract-settings') || '{}');
      if (settings.textSpeed) {
        this.textSpeed = settings.textSpeed;
        document.getElementById('text-speed').value = settings.textSpeed;
      }
      if (settings.autoSpeed) {
        this.autoSpeed = settings.autoSpeed;
        document.getElementById('auto-speed').value = settings.autoSpeed;
      }
      if (settings.bgmVolume !== undefined) {
        document.getElementById('bgm-volume').value = settings.bgmVolume;
        document.getElementById('bgm').volume = settings.bgmVolume / 100;
      }
      if (settings.seVolume !== undefined) {
        document.getElementById('se-volume').value = settings.seVolume;
        document.getElementById('se').volume = settings.seVolume / 100;
      }
    } catch (e) {
      console.error('Failed to load settings:', e);
    }
  }

  saveSettings() {
    const settings = {
      textSpeed: this.textSpeed,
      autoSpeed: this.autoSpeed,
      bgmVolume: parseInt(document.getElementById('bgm-volume').value),
      seVolume: parseInt(document.getElementById('se-volume').value)
    };
    localStorage.setItem('devil-contract-settings', JSON.stringify(settings));
  }
}

// ゲーム起動
document.addEventListener('DOMContentLoaded', () => {
  window.game = new GameEngine();
});
