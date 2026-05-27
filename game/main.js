/**
 * 悪魔との契約 - ビジュアルノベルエンジン
 * ティラノスクリプト互換パーサー搭載
 */

/**
 * ティラノスクリプトパーサー
 * .ks ファイルをパースして内部コマンド形式に変換
 */
class TyranoParser {
  constructor() {
    this.labels = {};
    this.commands = [];
  }

  /**
   * ティラノスクリプトをパース
   * @param {string} script - スクリプト文字列
   * @returns {object} { commands: [], labels: {} }
   */
  parse(script) {
    this.labels = {};
    this.commands = [];

    const lines = script.split('\n');
    let currentSpeaker = '';
    let i = 0;

    while (i < lines.length) {
      const line = lines[i].trim();
      i++;

      // 空行・コメント行をスキップ
      if (!line || line.startsWith(';')) {
        continue;
      }

      // ラベル: *label_name
      if (line.startsWith('*')) {
        const labelName = line.substring(1).trim();
        this.labels[labelName] = this.commands.length;
        this.commands.push({ type: 'label', id: labelName });
        continue;
      }

      // 話者名: #キャラ名
      if (line.startsWith('#')) {
        currentSpeaker = line.substring(1).trim();
        continue;
      }

      // タグ行: [tag ...]
      if (line.startsWith('[')) {
        this.parseTagLine(line, currentSpeaker);
        continue;
      }

      // テキスト行（インラインタグ対応）
      this.parseTextLine(line, currentSpeaker);
      currentSpeaker = ''; // テキスト後は話者リセット
    }

    return {
      commands: this.commands,
      labels: this.labels
    };
  }

  /**
   * タグ行をパース
   */
  parseTagLine(line, currentSpeaker) {
    // 複数タグが1行にある場合を処理
    const tagRegex = /\[([^\]]+)\]/g;
    let match;

    while ((match = tagRegex.exec(line)) !== null) {
      const tagContent = match[1];
      const cmd = this.parseTag(tagContent, currentSpeaker);
      if (cmd) {
        this.commands.push(cmd);
      }
    }
  }

  /**
   * 単一タグをパース
   */
  parseTag(tagContent, currentSpeaker) {
    // タグ名とパラメータを分離
    const parts = this.tokenizeTag(tagContent);
    if (parts.length === 0) return null;

    const tagName = parts[0].toLowerCase();
    const params = this.parseParams(parts.slice(1));

    switch (tagName) {
      // 背景
      case 'bg':
        return {
          type: 'bg',
          image: this.removeExtension(params.storage || params.file || '')
        };

      // BGM
      case 'playbgm':
        return {
          type: 'bgm',
          file: params.storage || params.file || ''
        };

      case 'stopbgm':
      case 'fadebgm':
        return { type: 'stopbgm' };

      // SE
      case 'playse':
        return {
          type: 'se',
          file: params.storage || params.file || ''
        };

      case 'stopse':
        return { type: 'stopse' };

      // キャラクター表示
      case 'chara_show':
        return {
          type: 'char',
          position: this.getPosition(params),
          image: this.buildCharacterImage(params.name, params.face || 'neutral'),
          highlight: params.brightness !== '0'
        };

      // キャラクター非表示
      case 'chara_hide':
        {
          const hasExplicitPos = Object.prototype.hasOwnProperty.call(params, 'pos') ||
            Object.prototype.hasOwnProperty.call(params, 'left');
          return {
            type: 'char_exit',
            position: hasExplicitPos ? this.getPosition(params) : null,
            character: params.name || params.character || ''
          };
        }

      // キャラクター表情変更
      case 'chara_face':
      case 'chara_mod':
        return {
          type: 'char',
          position: this.getPosition(params),
          image: this.buildCharacterImage(params.name, params.face || 'neutral'),
          highlight: true
        };

      // 全キャラクター非表示
      case 'chara_hide_all':
        return { type: 'clear_characters' };

      // クリック待ち（テキスト内で使用）
      case 'l':
        return { type: 'wait_click' };

      // 改行
      case 'r':
        return { type: 'line_break' };

      // 改ページ待ち
      case 'p':
        return { type: 'page_break' };

      // 名前入力
      case 'edit':
        return {
          type: 'edit',
          name: params.name || '',
          maxchars: parseInt(params.maxchars || params.length || '10', 10)
        };

      // 停止（選択肢待ちなど）
      case 's':
        return { type: 'stop' };

      // メッセージクリア
      case 'cm':
      case 'er':
        return { type: 'clear_message' };

      // ジャンプ
      case 'jump':
        return {
          type: 'jump',
          target: params.target || params.storage?.replace('.ks', '') || ''
        };

      // 選択肢
      case 'glink':
      case 'link':
        return {
          type: 'glink',
          text: this.substituteVariables(params.text || params.name || ''),
          target: (params.target || '').replace(/^\*/, '')
        };

      // 明示テキスト（例: [TEXT: SPECIAL END]）
      case 'text:':
        return {
          type: currentSpeaker ? 'text' : 'monologue',
          speaker: currentSpeaker,
          text: tagContent.replace(/^text:\s*/i, '').trim()
        };

      // 選択肢終了（無視）
      case 'endlink':
        return null;

      // レイヤー設定（無視）
      case 'layopt':
        return null;

      // 画像表示（背景として扱う）
      case 'image':
        if (params.layer === 'base' || !params.layer) {
          return {
            type: 'bg',
            image: this.removeExtension(params.storage || '')
          };
        }
        return null;

      // 変数操作
      case 'eval':
        return {
          type: 'eval',
          exp: params.exp || ''
        };

      // フラグ設定（ティラノ拡張）
      case 'set_flag':
        return {
          type: 'set_flag',
          name: params.name || '',
          value: params.value === 'true' || params.value === '1' || params.value
        };

      // 親密度変更（ティラノ拡張）
      case 'affinity':
        return {
          type: 'affinity',
          character: params.name || params.character || '',
          value: parseInt(params.value || '0', 10)
        };

      // ステータス更新（ティラノ拡張）
      case 'status':
        return {
          type: 'status',
          stage: params.stage || null,
          heroine: params.heroine || null
        };

      // POV設定（ティラノ拡張）
      case 'pov':
        return {
          type: 'pov',
          character: params.name || params.character || '',
          name: params.display || params.name || ''
        };

      // 待機
      case 'wait':
        return {
          type: 'wait',
          time: parseInt(params.time || '1000', 10)
        };

      // 条件分岐
      case 'if':
        return {
          type: 'if',
          exp: params.exp || ''
        };

      case 'elsif':
      case 'elseif':
        return {
          type: 'elsif',
          exp: params.exp || ''
        };

      case 'else':
        return { type: 'else' };

      case 'endif':
        return { type: 'endif' };

      // シナリオ終了
      case 'end':
      case 'endscript':
        return { type: 'end' };

      default:
        console.log('Unknown tag:', tagName, params);
        return null;
    }
  }

  /**
   * タグをトークン化
   */
  tokenizeTag(tagContent) {
    const tokens = [];
    let current = '';
    let inQuote = false;
    let quoteChar = '';

    for (let i = 0; i < tagContent.length; i++) {
      const char = tagContent[i];

      if (inQuote) {
        if (char === quoteChar) {
          inQuote = false;
        } else {
          current += char;
        }
      } else if (char === '"' || char === "'") {
        inQuote = true;
        quoteChar = char;
      } else if (char === ' ' || char === '\t') {
        if (current) {
          tokens.push(current);
          current = '';
        }
      } else {
        current += char;
      }
    }

    if (current) {
      tokens.push(current);
    }

    return tokens;
  }

  /**
   * パラメータをパース
   */
  parseParams(parts) {
    const params = {};
    for (const part of parts) {
      const eqIndex = part.indexOf('=');
      if (eqIndex !== -1) {
        const key = part.substring(0, eqIndex);
        let value = part.substring(eqIndex + 1);
        // 引用符を削除
        if ((value.startsWith('"') && value.endsWith('"')) ||
            (value.startsWith("'") && value.endsWith("'"))) {
          value = value.slice(1, -1);
        }
        params[key] = value;
      }
    }
    return params;
  }

  substituteVariables(text) {
    if (!text) return text;
    return text.replace(/&(?:f|sf|tf)\.(\w+)/g, (_, name) => {
      const variables = this.variables || {};
      const currentFlags = this.currentFlags || {};
      const value = variables[name] ?? currentFlags[name] ?? '';
      return String(value);
    });
  }

  /**
   * テキスト行をパース（インラインタグ対応）
   */
  parseTextLine(line, currentSpeaker) {
    // インラインタグを処理
    const segments = this.splitTextAndTags(line);
    let textBuffer = '';

    for (const segment of segments) {
      if (segment.type === 'tag') {
        // テキストがあれば先に出力
        if (textBuffer) {
          this.commands.push({
            type: currentSpeaker ? 'text' : 'monologue',
            speaker: currentSpeaker,
            text: textBuffer
          });
          textBuffer = '';
        }
        // タグを処理
        const cmd = this.parseTag(segment.content, currentSpeaker);
        if (cmd) {
          this.commands.push(cmd);
        }
      } else {
        textBuffer += segment.content;
      }
    }

    // 残りのテキストを出力
    if (textBuffer) {
      this.commands.push({
        type: currentSpeaker ? 'text' : 'monologue',
        speaker: currentSpeaker,
        text: textBuffer
      });
    }
  }

  /**
   * テキストとインラインタグを分離
   */
  splitTextAndTags(line) {
    const segments = [];
    let current = '';
    let i = 0;

    while (i < line.length) {
      if (line[i] === '[') {
        // テキストをプッシュ
        if (current) {
          segments.push({ type: 'text', content: current });
          current = '';
        }
        // タグを探す
        let j = i + 1;
        while (j < line.length && line[j] !== ']') {
          j++;
        }
        if (j < line.length) {
          segments.push({ type: 'tag', content: line.substring(i + 1, j) });
          i = j + 1;
        } else {
          current += line[i];
          i++;
        }
      } else {
        current += line[i];
        i++;
      }
    }

    if (current) {
      segments.push({ type: 'text', content: current });
    }

    return segments;
  }

  /**
   * 拡張子を削除
   */
  removeExtension(filename) {
    return filename.replace(/\.(png|jpg|jpeg|gif|webp|mp3|ogg|wav)$/i, '');
  }

  /**
   * キャラクター画像名を構築
   */
  buildCharacterImage(name, face) {
    if (!name) return '';
    return `${name}_${face || 'neutral'}`;
  }

  /**
   * 位置を取得
   */
  getPosition(params) {
    if (params.pos) return params.pos;
    if (params.left) {
      const left = parseInt(params.left, 10);
      if (left < 300) return 'left';
      if (left > 700) return 'right';
      return 'center';
    }
    return 'center';
  }

  /**
   * 話者の位置を取得
   * キャラクター名に基づいて表示位置を決定
   */
  getSpeakerPosition(speaker) {
    // 悪魔は常に中央
    if (speaker === 'akuma') {
      return 'center';
    }
    
    // その他のキャラクターは自動的に中央（既存のキャラクターを非表示にする処理は不要）
    return 'center';
  }
}

class GameEngine {
  constructor() {
    this.currentScreen = 'title-screen';
    this.scenarios = {};
    this.characters = {};
    this.episodes = [];
    this.currentScenario = null;
    this.currentEpisode = null;
    this.currentStage = null;
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
    this.autoTimer = null;

    // ティラノスクリプトパーサー
    this.parser = new TyranoParser();
    const viteBaseUrl = (typeof import.meta !== 'undefined' && import.meta.env && import.meta.env.BASE_URL)
      ? import.meta.env.BASE_URL
      : '/';
    this.baseUrl = viteBaseUrl.endsWith('/') ? viteBaseUrl : `${viteBaseUrl}/`;
    this.assetVersion = '20260527-harem-standee-refresh';
    this.currentLabels = {};
    this.callStack = []; // サブルーチン用コールスタック
    this.pendingChoices = []; // 選択肢収集用

    // 選択肢・フラグ・親密度システム
    this.choices = {};
    this.currentFlags = {};
    this.variables = { main_name: '主人公' }; // ティラノスクリプト変数
    this.affinity = {
      osananajimi: 0,
      seitokai: 0,
      gyaru: 0,
      otaku: 0,
      kakutogi: 0,
      furyo: 0,
      imouto: 0
    };

    this.characterAliasMap = {};
    this.lastCharacterPosition = {};
    this.sceneHasExplicitCharacterControl = false;

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
      this.characters = await this.fetchJsonWithFallback(
        ['assets/characters.json', 'public/assets/characters.json'],
        'characters'
      );
      this.buildCharacterAliasMap();

      // エピソードデータ読み込み
      const epData = await this.fetchJsonWithFallback(
        ['assets/episodes.json', 'public/assets/episodes.json'],
        'episodes'
      );
      this.episodes = epData.episodes;

      console.log('Data loaded:', this.episodes.length, 'episodes');
    } catch (error) {
      console.error('Failed to load data:', error);
    }
  }

  resolveUrl(path) {
    const normalized = (path || '').toString().replace(/^\/+/, '');
    return `${this.baseUrl}${normalized}`;
  }

  resolveAssetUrl(path) {
    const url = this.resolveUrl(path);
    const separator = url.includes('?') ? '&' : '?';
    return `${url}${separator}v=${this.assetVersion}`;
  }

  async fetchJsonWithFallback(paths, label = 'json') {
    let lastError = null;
    for (const path of paths) {
      try {
        const res = await fetch(this.resolveUrl(path));
        if (!res.ok) {
          continue;
        }
        const contentType = res.headers.get('content-type') || '';
        const bodyText = await res.text();
        if (this.looksLikeHtml(bodyText, contentType)) {
          continue;
        }
        return JSON.parse(bodyText);
      } catch (error) {
        lastError = error;
      }
    }
    throw new Error(`Failed to load ${label}${lastError ? `: ${lastError.message}` : ''}`);
  }

  looksLikeHtml(text, contentType = '') {
    const type = (contentType || '').toLowerCase();
    if (type.includes('text/html')) return true;
    const head = (text || '').trimStart().slice(0, 300).toLowerCase();
    return head.startsWith('<!doctype html') ||
      head.startsWith('<html') ||
      head.includes('<head') ||
      head.includes('<body');
  }

  /**
   * シナリオを読み込む（.ksと.json両対応）
   * .ksファイルを優先して読み込み、なければ.jsonにフォールバック
   */
  async loadScenario(scenarioName) {
    // ファイル名の変換パターン（episode_01 → episode01 など）
    const nameVariants = [
      scenarioName,
      scenarioName.replace(/_/g, ''),  // アンダースコア除去
    ];

    // .ksファイルを試す
    const ksPaths = [];
    for (const name of nameVariants) {
      ksPaths.push(`scenarios/${name}.ks`);
      ksPaths.push(`public/scenarios/${name}.ks`);
    }

    for (const ksPath of ksPaths) {
      try {
        const ksRes = await fetch(this.resolveUrl(ksPath));
        if (ksRes.ok) {
          const contentType = ksRes.headers.get('content-type') || '';
          const scriptText = await ksRes.text();
          if (this.looksLikeHtml(scriptText, contentType)) {
            console.warn('Scenario fetch returned HTML, skipping:', ksPath);
            continue;
          }
          const parsed = this.parser.parse(scriptText);
          this.scenarios[scenarioName] = parsed.commands;
          this.currentLabels = parsed.labels;
          console.log(`Loaded TyranoScript: ${ksPath} (${parsed.commands.length} commands)`);
          return this.scenarios[scenarioName];
        }
      } catch (e) {
        // 続行
      }
    }

    // .jsonファイルにフォールバック
    const jsonPaths = [
      `scenarios/${scenarioName}.json`,
      `public/scenarios/${scenarioName}.json`
    ];

    for (const jsonPath of jsonPaths) {
      try {
        const res = await fetch(this.resolveUrl(jsonPath));
        if (!res.ok) continue;
        const contentType = res.headers.get('content-type') || '';
        const bodyText = await res.text();
        if (this.looksLikeHtml(bodyText, contentType)) {
          console.warn('Scenario JSON fetch returned HTML, skipping:', jsonPath);
          continue;
        }
        const data = JSON.parse(bodyText);
        this.scenarios[scenarioName] = data[scenarioName];
        this.currentLabels = {};
        // JSONからラベルを抽出
        if (this.scenarios[scenarioName]) {
          this.scenarios[scenarioName].forEach((cmd, idx) => {
            if (cmd.type === 'label' && cmd.id) {
              this.currentLabels[cmd.id] = idx;
            }
          });
        }
        return this.scenarios[scenarioName];
      } catch (error) {
        // 続行
      }
    }

    console.error('Failed to load scenario:', scenarioName);
    return null;
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
    const menuBgmFile = this.resolveUrl('assets/bgm/bgm_devil.mp3');
    // 既にメニューBGMが再生中なら何もしない
    if (bgm.src.endsWith('bgm_devil.mp3')) {
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
      if (Object.keys(char.sprites || {}).length === 0) return;

      if (filter !== 'all') {
        const type = char.type || 'classmate';
        if (filter !== type) return;
      }

      const card = document.createElement('div');
      card.className = 'character-card';
      card.innerHTML = `
        <div class="char-portrait" style="background-image: url('${this.resolveAssetUrl(`assets/characters/${this.getCharacterPortraitImage(id)}.png`)}')"></div>
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
    portrait.style.backgroundImage = `url('${this.resolveAssetUrl(`assets/characters/${this.getCharacterPortraitImage(id)}.png`)}')`;
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
    this.currentStage = episode.stage || null;
    this.currentIndex = 0;
    this.backlog = [];
    this.sceneHasExplicitCharacterControl = false;
    this.isAutoMode = false;
    this.isSkipMode = false;

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
        this.sceneHasExplicitCharacterControl = false;
        this.currentIndex++;
        this.processCommand();
        break;

      case 'bgm':
        this.playBgm(cmd.file);
        this.currentIndex++;
        this.processCommand();
        break;

      case 'se':
        this.playSe(cmd.file);
        this.currentIndex++;
        this.processCommand();
        break;

      case 'pov':
        this.setPov(cmd.character, cmd.name);
        this.currentIndex++;
        this.processCommand();
        break;

      case 'char':
        this.sceneHasExplicitCharacterControl = true;
        this.showCharacter(cmd.position, cmd.image, cmd.highlight);
        this.currentIndex++;
        this.processCommand();
        break;

      case 'char_exit':
        this.sceneHasExplicitCharacterControl = true;
        this.hideCharacter(cmd.position, cmd.character);
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

      case 'choice':
        this.showChoices(cmd.prompt, cmd.choices);
        break;

      case 'set_flag':
        this.currentFlags[cmd.name] = cmd.value;
        this.currentIndex++;
        this.processCommand();
        break;

      case 'edit':
        this.handleEdit(cmd);
        break;

      case 'affinity':
        this.affinity[cmd.character] += cmd.value;
        this.showStatChange(cmd.character + '好感度', cmd.value);
        this.currentIndex++;
        this.processCommand();
        break;

      case 'label':
        // ラベルはジャンプ先としてのみ使用され、スキップする
        this.currentIndex++;
        this.processCommand();
        break;

      // ティラノスクリプト: ジャンプ
      case 'jump':
        this.handleJump(cmd.target);
        break;

      // ティラノスクリプト: 選択肢リンク
      case 'glink':
        this.pendingChoices.push({
          text: cmd.text,
          next: cmd.target
        });
        this.currentIndex++;
        this.processCommand();
        break;

      // ティラノスクリプト: 停止（選択肢表示）
      case 'stop':
        if (this.pendingChoices.length > 0) {
          this.showChoices('', this.pendingChoices);
          this.pendingChoices = [];
        }
        break;

      // ティラノスクリプト: 全キャラクター非表示
      case 'clear_characters':
        this.sceneHasExplicitCharacterControl = true;
        this.clearCharacters();
        this.currentIndex++;
        this.processCommand();
        break;

      // ティラノスクリプト: メッセージクリア
      case 'clear_message':
        document.getElementById('message-text').textContent = '';
        this.currentIndex++;
        this.processCommand();
        break;

      // ティラノスクリプト: 待機
      case 'wait':
        setTimeout(() => {
          this.currentIndex++;
          this.processCommand();
        }, this.isSkipMode ? 20 : (cmd.time || 1000));
        break;

      // ティラノスクリプト: クリック待ち
      case 'wait_click':
      case 'page_break':
        if (this.isAutoMode) {
          this.scheduleAutoAdvance(80);
        } else if (this.isSkipMode) {
          this.scheduleSkipAdvance();
        }
        break;

      // ティラノスクリプト: 改行
      case 'line_break':
        // 現在表示中のテキストに改行を追加（次のテキストと連結用）
        this.currentIndex++;
        this.processCommand();
        break;

      // ティラノスクリプト: BGM停止
      case 'stopbgm':
        this.stopBgm();
        this.currentIndex++;
        this.processCommand();
        break;

      // ティラノスクリプト: SE停止
      case 'stopse':
        document.getElementById('se').pause();
        this.currentIndex++;
        this.processCommand();
        break;

      // ティラノスクリプト: 条件分岐
      case 'if':
        this.handleIf(cmd.exp);
        break;

      case 'elsif':
        // ifブロック内でtrueだった場合はendifまでスキップ
        this.skipToEndif();
        break;

      case 'else':
        // ifブロック内でtrueだった場合はendifまでスキップ
        this.skipToEndif();
        break;

      case 'endif':
        this.currentIndex++;
        this.processCommand();
        break;

      // ティラノスクリプト: 変数評価
      case 'eval':
        this.handleEval(cmd.exp);
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

  /**
   * ジャンプ処理
   */
  handleJump(target) {
    // まずラベルを検索
    if (this.currentLabels[target] !== undefined) {
      this.currentIndex = this.currentLabels[target] + 1;
      this.processCommand();
      return;
    }

    // シナリオ内のラベルを検索
    const labelIndex = this.currentScenario.findIndex(cmd =>
      cmd.type === 'label' && cmd.id === target
    );
    if (labelIndex !== -1) {
      this.currentIndex = labelIndex + 1;
      this.processCommand();
      return;
    }

    // 別シナリオファイルとして読み込み
    this.loadScenario(target).then(scenario => {
      if (scenario) {
        this.currentScenario = scenario;
        this.currentIndex = 0;
        this.clearCharacters();
        this.processCommand();
      }
    });
  }

  /**
   * 条件分岐処理
   */
  handleIf(exp) {
    const result = this.evaluateExpression(exp);
    if (result) {
      // 条件が真の場合、次のコマンドへ
      this.currentIndex++;
      this.processCommand();
    } else {
      // 条件が偽の場合、elsif/else/endifを探す
      this.skipToNextBranch();
    }
  }

  /**
   * 次の分岐（elsif/else/endif）までスキップ
   */
  skipToNextBranch() {
    let depth = 1;
    this.currentIndex++;

    while (this.currentIndex < this.currentScenario.length && depth > 0) {
      const cmd = this.currentScenario[this.currentIndex];
      if (cmd.type === 'if') {
        depth++;
      } else if (cmd.type === 'endif') {
        depth--;
        if (depth === 0) {
          this.currentIndex++;
          this.processCommand();
          return;
        }
      } else if (depth === 1 && (cmd.type === 'elsif' || cmd.type === 'else')) {
        if (cmd.type === 'elsif') {
          this.handleIf(cmd.exp);
        } else {
          // else の場合は次のコマンドへ
          this.currentIndex++;
          this.processCommand();
        }
        return;
      }
      this.currentIndex++;
    }

    this.processCommand();
  }

  /**
   * endifまでスキップ
   */
  skipToEndif() {
    let depth = 1;
    this.currentIndex++;

    while (this.currentIndex < this.currentScenario.length && depth > 0) {
      const cmd = this.currentScenario[this.currentIndex];
      if (cmd.type === 'if') {
        depth++;
      } else if (cmd.type === 'endif') {
        depth--;
      }
      this.currentIndex++;
    }

    this.processCommand();
  }

  /**
   * 式を評価
   */
  evaluateExpression(exp) {
    if (!exp) return false;

    // f.フラグ名 や sf.変数名 の形式を処理
    const safeExp = exp
      .replace(/f\.(\w+)/g, (_, name) => {
        return this.currentFlags[name] ? 'true' : 'false';
      })
      .replace(/sf\.(\w+)/g, (_, name) => {
        return JSON.stringify(this.variables[name] || 0);
      })
      .replace(/tf\.(\w+)/g, (_, name) => {
        return JSON.stringify(this.variables[name] || 0);
      });

    try {
      // 安全な評価のため、簡単な式のみ対応
      return new Function(`return ${safeExp}`)();
    } catch (e) {
      console.error('Expression evaluation failed:', exp, e);
      return false;
    }
  }

  /**
   * eval式を実行
   */
  handleEval(exp) {
    if (!exp) return;

    // f.フラグ名 = value の形式を処理
    const flagMatch = exp.match(/f\.(\w+)\s*=\s*(.+)/);
    if (flagMatch) {
      const [, name, value] = flagMatch;
      try {
        const evaluated = new Function(`return ${value}`)();
        if (typeof evaluated === 'string' || typeof evaluated === 'number') {
          this.variables[name] = evaluated;
        } else {
          this.currentFlags[name] = evaluated;
        }
      } catch (e) {
        this.variables[name] = value;
      }
      return;
    }

    // sf.変数名 や tf.変数名 の形式を処理
    const varMatch = exp.match(/[st]f\.(\w+)\s*([+\-*/])?=\s*(.+)/);
    if (varMatch) {
      const [, name, op, value] = varMatch;
      try {
        const val = new Function(`return ${value}`)();
        if (op) {
          const current = this.variables[name] || 0;
          switch (op) {
            case '+': this.variables[name] = current + val; break;
            case '-': this.variables[name] = current - val; break;
            case '*': this.variables[name] = current * val; break;
            case '/': this.variables[name] = current / val; break;
          }
        } else {
          this.variables[name] = val;
        }
      } catch (e) {
        this.variables[name] = value;
      }
    }
  }

  handleEdit(cmd) {
    const variableName = (cmd.name || '').replace(/^(?:f|sf|tf)\./, '');
    const currentValue = this.variables[variableName] || '主人公';
    const maxchars = cmd.maxchars || 10;
    const overlay = document.createElement('div');
    overlay.className = 'name-input-overlay';
    overlay.innerHTML = `
      <div class="name-input-panel">
        <label for="main-name-input">名前</label>
        <div class="name-input-row">
          <input id="main-name-input" type="text" maxlength="${maxchars}">
          <button type="button" id="main-name-submit">決定</button>
        </div>
      </div>
    `;
    overlay.style.cssText = 'position:fixed;inset:0;z-index:1000;display:flex;align-items:center;justify-content:center;background:rgba(0,0,0,.65);';

    const panel = overlay.querySelector('.name-input-panel');
    panel.style.cssText = 'width:min(420px,calc(100vw - 40px));padding:24px;background:rgba(18,18,24,.96);border:1px solid rgba(255,255,255,.2);border-radius:8px;color:#fff;';

    const label = overlay.querySelector('label');
    label.style.cssText = 'display:block;margin-bottom:10px;font-size:14px;';

    const row = overlay.querySelector('.name-input-row');
    row.style.cssText = 'display:flex;gap:10px;';

    const input = overlay.querySelector('#main-name-input');
    input.value = currentValue;
    input.style.cssText = 'flex:1;min-width:0;padding:10px 12px;border-radius:6px;border:1px solid rgba(255,255,255,.35);background:#fff;color:#111;font-size:18px;';

    const button = overlay.querySelector('#main-name-submit');
    button.style.cssText = 'padding:10px 18px;border:0;border-radius:6px;background:#c92a2a;color:#fff;font-weight:700;cursor:pointer;';

    const submit = () => {
      const name = (input.value || currentValue).trim().slice(0, maxchars) || '主人公';
      this.variables[variableName] = name;

      if (this.characters.characters?.protagonist) {
        this.characters.characters.protagonist.name_display = name;
      }

      overlay.remove();
      this.currentIndex++;
      if (this.currentScenario[this.currentIndex]?.type === 'stop') {
        this.currentIndex++;
      }
      this.processCommand();
    };

    button.addEventListener('click', submit);
    input.addEventListener('keydown', (event) => {
      if (event.key === 'Enter') {
        submit();
      }
    });

    document.body.appendChild(overlay);
    input.focus();
    input.select();
  }

  substituteVariables(text) {
    if (!text) return text;
    return text.replace(/&(?:f|sf|tf)\.(\w+)/g, (_, name) => {
      const value = this.variables[name] ?? this.currentFlags[name] ?? '';
      return String(value);
    });
  }

  setBackground(image) {
    const bg = document.getElementById('background');

    // 背景名のマッピング（.ksファイル内の名前 → 実際のファイル名）
    const bgMapping = {
      'house_front': 'childhood_friend_home',
      'house': 'protagonist_home',
      'home': 'protagonist_home',
      'school': 'school_gate',
      'school_hallway': 'hallway',
      'school_corridor': 'hallway',
      'corridor': 'hallway',
      'room': 'protagonist_room',
      'room_night': 'protagonist_room_night',
      'room_morning': 'protagonist_room',
      'my_room': 'protagonist_room',
      'karaoke_room': 'karaoke',
      'train_night': 'train',
      'train_inside': 'train_interior',
      'night_sky': 'black',
      'night_street': 'street_night',
      'street_day': 'street_evening',
      'street': 'street_evening',
      'alley': 'street_evening',
      'park_day': 'park',
      'entrance': 'hallway',
      'living_room': 'protagonist_home',
      'kitchen': 'friend_house',
      'council_room': 'student_council_room',
      'seitokai_room': 'student_council_room',
      'gym_evening': 'gym',
      'factory': 'abandoned_factory',
    };

    const mappedImage = bgMapping[image] || image;

    if (bgMapping[image]) {
      console.log(`Background mapped: ${image} → ${mappedImage}`);
    }

    // 実際の背景画像を使用
    const bgPath = this.resolveAssetUrl(`assets/backgrounds/${mappedImage}.png`);
    bg.style.backgroundImage = `url('${bgPath}')`;
    bg.style.backgroundSize = 'cover';
    bg.style.backgroundPosition = 'center';
  }

  playBgm(file) {
    if (!file) return;

    const bgm = document.getElementById('bgm');

    // 同じBGMが既にセットされているなら何もしない
    if (bgm.src.endsWith(file)) {
      // 一時停止中なら再開
      if (bgm.paused) {
        bgm.play().catch(e => console.log('BGM resume blocked:', e));
      }
      return;
    }

    console.log('Playing BGM:', file);

    // 停止してから新しいBGMを再生
    bgm.pause();
    bgm.src = this.resolveUrl(`assets/bgm/${file}`);
    bgm.currentTime = 0;

    bgm.play().catch(e => console.log('BGM autoplay blocked:', e));
  }

  stopBgm() {
    const bgm = document.getElementById('bgm');
    bgm.pause();
    bgm.currentTime = 0;
  }

  playSe(file) {
    const se = document.getElementById('se');
    se.src = this.resolveUrl(`assets/se/${file}`);
    se.currentTime = 0;
    se.play().catch(e => console.log('SE autoplay blocked:', e));
  }

  setPov(characterId, name) {
    // 既存のPOV要素がなければ作成
    let povElem = document.getElementById('pov-display');
    if (!povElem) {
      povElem = document.createElement('div');
      povElem.id = 'pov-display';
      povElem.style.cssText = `
        position: absolute;
        top: 10px;
        left: 10px;
        background: rgba(0, 0, 0, 0.7);
        color: #fff;
        padding: 8px 16px;
        border-radius: 4px;
        font-size: 14px;
        z-index: 100;
      `;
      document.getElementById('game-screen').appendChild(povElem);
    }
    povElem.textContent = `視点: ${name}`;
  }

  isStageableCharacter(characterId) {
    const sprites = this.characters.characters?.[characterId]?.sprites;
    return Boolean(sprites?.stage1 || sprites?.stage2);
  }

  getCharacterPortraitImage(characterId) {
    return this.isStageableCharacter(characterId)
      ? `${characterId}_neutral_default`
      : `${characterId}_neutral`;
  }

  normalizeSpeakerKey(value) {
    return (value || '')
      .toString()
      .trim()
      .toLowerCase()
      .replace(/[　\s]/g, '')
      .replace(/[（(]/g, '')
      .replace(/[）)]/g, '')
      .replace(/[：:]/g, '')
      .replace(/[・]/g, '');
  }

  buildCharacterAliasMap() {
    const chars = this.characters.characters || {};
    const aliases = {};

    const register = (key, id) => {
      const normalizedKey = this.normalizeSpeakerKey(key);
      if (!normalizedKey || !id || aliases[normalizedKey]) return;
      aliases[normalizedKey] = id;
    };

    Object.entries(chars).forEach(([id, char]) => {
      register(id, id);
      register(char.id, id);
      register(char.name, id);
      register(char.name_display, id);
    });

    const manualAliases = {
      protagonist: 'protagonist',
      主人公: 'protagonist',
      悪魔off: 'akuma',
      悪魔offvoice: 'akuma',
      幼なじみの母: 'mother',
      親友: 'friend',
      友樹: 'friend',
      tomoki: 'friend',
      生徒: 'mob',
      教頭: 'kyoutou',
      理事長: 'rijichou',
      顧問: 'komon'
    };

    Object.entries(manualAliases).forEach(([key, id]) => {
      register(key, id);
    });

    this.characterAliasMap = aliases;
  }

  resolveCharacterId(nameOrId) {
    if (!nameOrId) return '';

    const raw = nameOrId.toString().trim();
    if (!raw) return '';

    if (this.characters.characters?.[raw]) {
      return raw;
    }

    const normalized = this.normalizeSpeakerKey(raw);
    return this.characterAliasMap[normalized] || raw;
  }

  getStageSpritePrefix(stageId) {
    const id = (stageId || this.currentStage || this.currentEpisode?.stage || '').toString();
    if (id === 'neutral' || !id) return 'neutral';
    if (/^stage[1-4]$/.test(id)) return id;
    return 'neutral';
  }

  normalizeExpression(expression) {
    const expr = (expression || '').toString().toLowerCase();
    const aliases = {
      neutral: 'neutral',
      serious: 'neutral',
      cold: 'neutral',
      analyzing: 'neutral',
      curious: 'surprised',
      surprised: 'surprised',
      angry: 'angry',
      fighting: 'angry',
      determined: 'angry',
      crying: 'crying',
      sad: 'sad',
      vulnerable: 'sad',
      hurt: 'sad',
      guilty: 'sad',
      worried: 'sad',
      flustered: 'flustered',
      shy: 'flustered',
      embarrassed: 'flustered',
      default: 'default',
      smile: 'smile',
      smirk: 'smile',
      excited: 'smile',
      pleased: 'smile',
      proud: 'smile',
      hopeful: 'smile',
      posing: 'smile',
    };
    return aliases[expr] || expr;
  }

  resolveStage2FdImage(characterId, expr) {
    const stage2FdCharacters = new Set([
      'osananajimi',
      'seitokai',
      'gyaru',
      'otaku',
      'kakutogi',
      'furyo',
      'imouto'
    ]);
    if (!stage2FdCharacters.has(characterId)) return null;

    const raw = expr || '';
    const isExplicitFd =
      /^stage2_fd(_|$)/.test(raw) ||
      /^fd(_|$)/.test(raw) ||
      raw === 'contact';
    if (!isExplicitFd) return null;

    const rawExpr = raw.replace(/^stage2_?/, '').replace(/^fd_?/, '') || 'contact';
    const fdExpressionMap = {
      contact: 'contact',
      angry: 'angry',
      blush: 'blush',
      sad: 'sad',
      worried: 'sad',
      vulnerable: 'sad',
      surprised: 'surprised'
    };
    const fdExpression = fdExpressionMap[rawExpr];
    return fdExpression ? `${characterId}_stage2_fd_${fdExpression}` : null;
  }

  resolveCharacterImage(image) {
    if (!image || typeof image !== 'string') return image;

    const parts = image.split('_');
    if (parts.length < 2) return image;

    const rawCharacterId = parts.shift();
    const exprOrStage = parts.join('_');
    const characterId = this.resolveCharacterId(rawCharacterId);
    if (!characterId || !exprOrStage) return image;
    if (!this.characters.characters?.[characterId]) return image;

    const expr = this.normalizeExpression(exprOrStage);
    const stagePrefix = this.getStageSpritePrefix();

    // Explicitly handle stage overrides in the expression (e.g. stage1_sad)
    // If the expression starts with stageX, use it directly instead of prepending the global stage
    if (/^stage\d+(_|$)/.test(expr)) {
      if (/^stage\d+$/.test(expr)) {
        return `${characterId}_${expr}_default`;
      }
      if (expr.startsWith('stage2_fd')) {
        const fdImage = this.resolveStage2FdImage(characterId, expr);
        if (fdImage) return fdImage;
      }
      return `${characterId}_${expr}`;
    }

    // ステージ非対応キャラ（悪魔など）は neutral 系命名へ正規化
    if (!this.isStageableCharacter(characterId)) {
      if (expr === 'neutral' || expr === 'default') {
        return `${characterId}_neutral`;
      }
      return `${characterId}_neutral_${expr}`;
    }

    // neutralまたはstageが含まれている場合はステージプレフィックスで置換
    if (expr === 'neutral' || /^stage\d+$/.test(expr)) {
      // 既にステージが指定されている場合はそのまま返す
      if (/^stage\d+$/.test(expr)) {
        return `${characterId}_${expr}_default`;
      }
      return `${characterId}_${stagePrefix}_default`;
    }

    // それ以外は表情をステージに合わせて追加
    if (stagePrefix === 'stage2' && (/^fd(_|$)/.test(expr) || expr === 'contact')) {
      const fdImage = this.resolveStage2FdImage(characterId, expr);
      if (fdImage) return fdImage;
    }
    return `${characterId}_${stagePrefix}_${expr}`;
  }

  showCharacter(position, image, highlight) {
    const posMap = {
      'left': 'char-left',
      'center': 'char-center',
      'right': 'char-right'
    };
    const elemId = posMap[position] || 'char-center';
    const elem = document.getElementById(elemId);

    const imageParts = typeof image === 'string' ? image.split('_') : [];
    if (imageParts.length >= 2) {
      const resolvedId = this.resolveCharacterId(imageParts[0]);
      if (resolvedId && resolvedId !== imageParts[0]) {
        imageParts[0] = resolvedId;
        image = imageParts.join('_');
      }
    }

    // キャラクター画像を設定
    const resolvedImage = this.resolveCharacterImage(image);
    if (!resolvedImage) return;

    // キャラクター名をdata属性に設定（CSS用）
    const charName = this.resolveCharacterId(resolvedImage.split('_')[0]);

    // 同一キャラクターが他の位置にいる場合は先に消す（重複表示防止）
    ['char-left', 'char-center', 'char-right'].forEach((id) => {
      if (id === elemId) return;
      const target = document.getElementById(id);
      if (target.dataset.character === charName) {
        target.classList.remove('visible', 'dimmed');
        target.dataset.character = '';
      }
    });

    // 新しいキャラクターが登場する場合はアニメーション
    const isNewChar = !elem.classList.contains('visible') || elem.dataset.character !== charName;

    elem.style.backgroundImage = `url('${this.resolveAssetUrl(`assets/characters/${resolvedImage}.png`)}')`;
    elem.dataset.character = charName;
    elem.classList.add('visible');
    this.lastCharacterPosition[charName] = position;

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

  hideCharacter(position, character) {
    const posMap = {
      'left': 'char-left',
      'center': 'char-center',
      'right': 'char-right'
    };

    const resolvedCharacter = this.resolveCharacterId(character);
    let hidden = false;
    if (resolvedCharacter) {
      Object.values(posMap).forEach((elemId) => {
        const elem = document.getElementById(elemId);
        if (elem.dataset.character === resolvedCharacter) {
          elem.classList.remove('visible');
          elem.classList.remove('dimmed');
          elem.dataset.character = '';
          hidden = true;
        }
      });
    }

    if (!hidden && position) {
      const elemId = posMap[position] || 'char-center';
      const elem = document.getElementById(elemId);
      elem.classList.remove('visible');
      elem.classList.remove('dimmed');
      elem.dataset.character = '';
    }
  }

  clearCharacters() {
    ['char-left', 'char-center', 'char-right'].forEach(id => {
      const elem = document.getElementById(id);
      elem.classList.remove('visible', 'dimmed');
      elem.dataset.character = '';
    });
  }

  isCharacterVisible(characterId) {
    const resolvedId = this.resolveCharacterId(characterId);
    const ids = ['char-left', 'char-center', 'char-right'];
    return ids.some((id) => {
      const elem = document.getElementById(id);
      return elem.classList.contains('visible') && elem.dataset.character === resolvedId;
    });
  }

  getVisibleCharacterCount() {
    const ids = ['char-left', 'char-center', 'char-right'];
    return ids.filter((id) => {
      const elem = document.getElementById(id);
      return elem.classList.contains('visible');
    }).length;
  }

  getVisibleCharactersWithPositions() {
    const posMap = {
      'char-left': 'left',
      'char-center': 'center',
      'char-right': 'right'
    };
    const ids = ['char-left', 'char-center', 'char-right'];
    return ids
      .map((id) => {
        const elem = document.getElementById(id);
        if (!elem.classList.contains('visible') || !elem.dataset.character) return null;
        return {
          id: elem.dataset.character,
          position: posMap[id] || 'center'
        };
      })
      .filter(Boolean);
  }

  getAssistPositionForExplicitScene(speakerId) {
    const visible = this.getVisibleCharactersWithPositions();
    if (visible.length === 0) {
      return this.getAutoShowPosition(speakerId);
    }

    if (visible.length === 1) {
      const current = visible[0];
      if (current.id === speakerId) {
        return null;
      }

      if (current.position === 'left') return 'right';
      if (current.position === 'right') return 'left';
      return 'right';
    }

    if (visible.length === 2) {
      const positions = new Set(visible.map((v) => v.position));
      const slots = ['left', 'center', 'right'];
      const empty = slots.find((slot) => !positions.has(slot));
      return empty || null;
    }

    if (visible.length >= 3) {
      return null;
    }
    return null;
  }

  getAutoShowPosition(characterId) {
    const positions = ['center', 'left', 'right'];
    const posMap = {
      'left': 'char-left',
      'center': 'char-center',
      'right': 'char-right'
    };

    const lastPos = this.lastCharacterPosition[characterId];
    if (lastPos && posMap[lastPos]) {
      const elem = document.getElementById(posMap[lastPos]);
      if (!elem.classList.contains('visible') || elem.dataset.character === characterId) {
        return lastPos;
      }
    }

    for (const pos of positions) {
      const elem = document.getElementById(posMap[pos]);
      if (!elem.classList.contains('visible')) {
        return pos;
      }
    }

    return lastPos || 'center';
  }

  shouldAutoShowSpeaker(characterId) {
    if (!characterId) return false;
    if (characterId === 'protagonist') return false;

    const char = this.characters.characters?.[characterId];
    if (!char) return false;
    if (characterId === 'akuma') return true;
    if (char.type === 'classmate' || char.type === 'special') return true;
    return false;
  }

  ensureSpeakerVisible(characterId) {
    const resolvedSpeakerId = this.resolveCharacterId(characterId);
    if (!this.shouldAutoShowSpeaker(resolvedSpeakerId)) return;
    if (this.isCharacterVisible(resolvedSpeakerId)) return;

    const image = this.parser.buildCharacterImage(resolvedSpeakerId, 'default');
    if (!image) return;

    const visibleCount = this.getVisibleCharacterCount();
    if (this.sceneHasExplicitCharacterControl) {
      const assistPos = this.getAssistPositionForExplicitScene(resolvedSpeakerId);
      if (!assistPos) {
        return;
      }
      this.showCharacter(assistPos, image, true);
      return;
    }

    // 台本にchara_showが少ないシーンでは、話者を中央にフォーカス表示する
    if (visibleCount > 0) {
      this.clearCharacters();
      this.showCharacter('center', image, true);
      return;
    }

    const pos = this.getAutoShowPosition(resolvedSpeakerId);
    this.showCharacter(pos, image, true);
  }

  showText(speaker, text, isMonologue = false) {
    const speakerId = this.resolveCharacterId(speaker);
    this.ensureSpeakerVisible(speakerId);
    const displayText = this.substituteVariables(text);

    // 話者名を取得
    let speakerName = '';
    if (speakerId) {
      const char = this.characters.characters?.[speakerId];
      speakerName = char?.name_display || char?.name || speaker || '';
    }

    // 新しいUIに合わせてspeaker-nameを更新
    const speakerContainer = document.getElementById('speaker-name');
    const namePlate = speakerContainer.querySelector('.name-plate');
    const namePlateSpan = namePlate.querySelector('span');
    const messageText = document.getElementById('message-text');

    if (speakerName) {
      namePlateSpan.textContent = speakerName;
      speakerContainer.style.display = 'block';
      messageText.classList.add('has-speaker');
    } else {
      speakerContainer.style.display = 'none';
      messageText.classList.remove('has-speaker');
    }

    // バックログに追加
    this.backlog.push({ speaker: speakerName, text: displayText });

    // テキスト表示
    this.currentText = displayText;
    this.displayedText = '';
    this.isTyping = true;
    this.startTyping();
  }

  startTyping() {
    const messageElem = document.getElementById('message-text');
    const speed = this.getTypingDelay();

    if (this.typeInterval) {
      clearInterval(this.typeInterval);
    }

    if (this.isSkipMode) {
      this.displayedText = this.currentText;
      messageElem.textContent = this.displayedText;
      this.isTyping = false;
      this.onTextComplete();
      return;
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
      this.scheduleSkipAdvance();
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
      this.clearAutoAdvanceTimer();
      // 次のコマンドへ（非同期でUI更新を許可）
      this.currentIndex++;
      setTimeout(() => this.processCommand(), 0);
    }
  }

  showStatChange(name, value) {
    const popup = document.getElementById('stat-popup');
    const sign = value >= 0 ? '+' : '';
    popup.innerHTML = `
      <div style="font-size: 1.5rem; color: hsl(0, 72%, 55%); letter-spacing: 0.1em;">${name}</div>
      <div style="font-size: 2rem; color: ${value >= 0 ? '#4ecdc4' : '#ff6b6b'}; font-weight: 600;">${sign}${value}</div>
    `;
    popup.classList.remove('hidden');

    setTimeout(() => {
      popup.classList.add('hidden');
      this.currentIndex++;
      this.processCommand();
    }, 1500);
  }

  showChoices(prompt, choices) {
    const choicesContainer = document.getElementById('choices-container');
    const choicesPrompt = document.getElementById('choices-prompt');
    const choicesOptions = document.getElementById('choices-options');

    choicesPrompt.textContent = prompt;
    choicesOptions.innerHTML = '';

    choices.forEach(choice => {
      const button = document.createElement('button');
      button.className = 'choice-button';
      button.textContent = choice.text;
      button.addEventListener('click', () => {
        this.handleChoice(choice);
      });
      choicesOptions.appendChild(button);
    });

    choicesContainer.classList.remove('hidden');
  }

  handleChoice(choice) {
    const choicesContainer = document.getElementById('choices-container');
    choicesContainer.classList.add('hidden');

    // フラグを設定
    if (choice.flags) {
      for (const [key, value] of Object.entries(choice.flags)) {
        this.currentFlags[key] = value;
      }
    }

    // 親密度を変動
    if (choice.affinity) {
      for (const [character, value] of Object.entries(choice.affinity)) {
        this.affinity[character] += value;
      }
    }

    // 次のシナリオへ
    if (choice.next) {
      if (typeof choice.next === 'number') {
        // インデックスジャンプ
        this.currentIndex = choice.next;
        this.processCommand();
      } else if (typeof choice.next === 'string') {
        // ラベルを探す
        const labelIndex = this.currentScenario.findIndex(cmd =>
          cmd.type === 'label' && cmd.id === choice.next
        );
        if (labelIndex !== -1) {
          this.currentIndex = labelIndex + 1;
          this.processCommand();
        } else {
          // ラベルが見つからない場合はシナリオファイルとして読み込み
          this.loadScenario(choice.next).then(scenario => {
            if (scenario) {
              this.currentScenario = scenario;
              this.currentIndex = 0;
              this.clearCharacters();
              this.processCommand();
            }
          });
        }
      }
    } else {
      this.currentIndex++;
      this.processCommand();
    }
  }

  updateStatus(stage, heroine) {
    if (stage) {
      this.currentStage = stage;
    }
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
      <h3>MENU</h3>
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
    this.clearAutoAdvanceTimer();
  }

  toggleAuto() {
    this.isAutoMode = !this.isAutoMode;
    this.isSkipMode = false;
    this.clearAutoAdvanceTimer();
    document.getElementById('btn-auto').classList.toggle('active', this.isAutoMode);
    document.getElementById('btn-skip').classList.remove('active');

    // オートモード開始時、現在のテキストが表示済みなら待機後に次へ進む
    if (this.isAutoMode && !this.isTyping) {
      this.scheduleAutoAdvance();
    }
  }

  getTypingDelay() {
    return 100 - (this.textSpeed * 9);
  }

  getAutoAdvanceDelay() {
    return 3600 - (this.autoSpeed * 300);
  }

  clearAutoAdvanceTimer() {
    if (this.autoTimer) {
      clearTimeout(this.autoTimer);
      this.autoTimer = null;
    }
  }

  scheduleAutoAdvance(delay = this.getAutoAdvanceDelay()) {
    this.clearAutoAdvanceTimer();
    this.autoTimer = setTimeout(() => {
      this.autoTimer = null;
      if (this.isAutoMode && !this.isTyping) {
        this.currentIndex++;
        this.processCommand();
      }
    }, delay);
  }

  scheduleSkipAdvance() {
    this.clearAutoAdvanceTimer();
    this.autoTimer = setTimeout(() => {
      this.autoTimer = null;
      if (this.isSkipMode && !this.isTyping) {
        this.currentIndex++;
        this.processCommand();
      }
    }, 20);
  }

  toggleSkip() {
    this.isSkipMode = !this.isSkipMode;
    this.isAutoMode = false;
    this.clearAutoAdvanceTimer();
    document.getElementById('btn-skip').classList.toggle('active', this.isSkipMode);
    document.getElementById('btn-auto').classList.remove('active');

    // スキップモード開始時、現在のテキストが表示済みなら少し待ってから次へ進む
    if (this.isSkipMode && !this.isTyping) {
      this.scheduleSkipAdvance();
    } else if (this.isSkipMode && this.isTyping) {
      this.advanceText();
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
