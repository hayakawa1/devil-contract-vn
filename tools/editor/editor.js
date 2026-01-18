/**
 * シナリオエディタ
 */

// コマンドリスト
let commands = [];
let selectedIndex = -1;
let isPlaying = false;
let playIndex = 0;
let playTimer = null;

// 現在の状態
let currentState = {
  bg: '',
  bgm: '',
  char: '',
  charExpr: ''
};

// アセットパス（プロジェクトルートからの絶対パス）
const ASSET_PATH = '/game/public/assets';

// キャラクター名マッピング
const CHAR_NAMES = {
  'protagonist': '主人公',
  'akuma': '悪魔',
  'osananajimi': '幼馴染',
  'seitokai': '生徒会長',
  'gyaru': 'ギャル',
  'otaku': 'オタク',
  'kakutogi': '格闘技部',
  'furyo': '不良',
  'imouto': '妹'
};

const CHAR_IDS = {
  '主人公': 'protagonist',
  '悪魔': 'akuma',
  '幼馴染': 'osananajimi',
  '生徒会長': 'seitokai',
  'ギャル': 'gyaru',
  'オタク': 'otaku',
  '格闘技部': 'kakutogi',
  '不良': 'furyo',
  '妹': 'imouto'
};

// 右クリックメニュー用
let ctxTargetIndex = -1;

// 初期化
document.addEventListener('DOMContentLoaded', () => {
  document.getElementById('file-input').addEventListener('change', loadFile);
  renderCommands();

  // 右クリックメニューを閉じる
  document.addEventListener('click', () => {
    document.getElementById('context-menu').style.display = 'none';
  });
});

// ファイル読み込み
function loadFile(e) {
  const file = e.target.files[0];
  if (!file) return;

  const reader = new FileReader();
  reader.onload = (evt) => {
    const content = evt.target.result;
    if (file.name.endsWith('.ks')) {
      parseKsFile(content);
    } else {
      parseTxtFile(content);
    }
    renderCommands();
  };
  reader.readAsText(file);
}

// .ksファイルをパース
function parseKsFile(content) {
  commands = [];
  const lines = content.split('\n');
  let currentSpeaker = '';

  for (const line of lines) {
    const trimmed = line.trim();
    if (!trimmed || trimmed.startsWith(';') || trimmed.startsWith('*')) continue;

    // 話者
    if (trimmed.startsWith('#')) {
      currentSpeaker = trimmed.substring(1).trim();
      continue;
    }

    // タグ
    const tagMatch = trimmed.match(/^\[(\w+)\s*(.*)\]$/);
    if (tagMatch) {
      const [, tag, params] = tagMatch;
      const parsedParams = parseParams(params);

      switch (tag.toLowerCase()) {
        case 'bg':
          commands.push({ type: 'bg', image: parsedParams.storage?.replace('.png', '') || '' });
          break;
        case 'playbgm':
          commands.push({ type: 'bgm', file: parsedParams.storage || '' });
          break;
        case 'chara_show':
        case 'chara_face':
          commands.push({
            type: 'char',
            name: parsedParams.name || '',
            face: parsedParams.face || 'neutral',
            pos: parsedParams.pos || 'center'
          });
          break;
        case 'chara_hide':
          commands.push({ type: 'char_hide', name: parsedParams.name || '' });
          break;
        case 'glink':
          commands.push({
            type: 'choice',
            text: parsedParams.text || '',
            target: parsedParams.target || ''
          });
          break;
      }
      continue;
    }

    // テキスト
    if (trimmed && !trimmed.startsWith('[')) {
      if (currentSpeaker) {
        commands.push({ type: 'text', speaker: currentSpeaker, text: trimmed });
      } else {
        commands.push({ type: 'narration', text: trimmed });
      }
      currentSpeaker = '';
    }
  }
}

// .txtファイルをパース（シナリオ形式）
function parseTxtFile(content) {
  commands = [];
  const lines = content.split('\n');

  for (const line of lines) {
    const trimmed = line.trim();
    if (!trimmed) continue;

    // コメント・区切り線をスキップ
    if (trimmed.startsWith('=') || trimmed.startsWith('■') || trimmed.startsWith('【') ||
        trimmed.startsWith('※') || trimmed.startsWith('→') || trimmed.startsWith('-') ||
        trimmed.startsWith('・')) {
      continue;
    }

    // [BG: xxx]
    const bgMatch = trimmed.match(/^\[BG:\s*(.+?)\]/i);
    if (bgMatch) {
      commands.push({ type: 'bg', image: bgMatch[1].trim() });
      continue;
    }

    // [BGM: xxx]
    const bgmMatch = trimmed.match(/^\[BGM:\s*(.+?)\]/i);
    if (bgmMatch) {
      commands.push({ type: 'bgm', file: bgmMatch[1].trim() });
      continue;
    }

    // [SE: xxx]
    const seMatch = trimmed.match(/^\[SE:\s*(.+?)\]/i);
    if (seMatch) {
      commands.push({ type: 'se', file: seMatch[1].trim() });
      continue;
    }

    // [char: xxx, expression]
    const charMatch = trimmed.match(/^\[char:\s*(.+?)(?:,\s*(.+?))?\]/i);
    if (charMatch) {
      commands.push({
        type: 'char',
        name: charMatch[1].trim(),
        face: charMatch[2]?.trim() || 'neutral',
        pos: 'center'
      });
      continue;
    }

    // セリフ: キャラ名：「セリフ」
    const dialogueMatch = trimmed.match(/^(.+?)[:：]\s*[「『](.+?)[」』]$/);
    if (dialogueMatch) {
      commands.push({
        type: 'text',
        speaker: dialogueMatch[1].trim(),
        text: dialogueMatch[2].trim()
      });
      continue;
    }

    // 複数行セリフの開始
    const dialogueStartMatch = trimmed.match(/^(.+?)[:：]\s*[「『](.+)$/);
    if (dialogueStartMatch) {
      commands.push({
        type: 'text',
        speaker: dialogueStartMatch[1].trim(),
        text: dialogueStartMatch[2].trim()
      });
      continue;
    }

    // ナレーション: （テキスト）
    const narrationMatch = trimmed.match(/^[（\(](.+?)[）\)]$/);
    if (narrationMatch) {
      commands.push({ type: 'narration', text: narrationMatch[1].trim() });
      continue;
    }

    // 心の声: キャラ名（テキスト）
    const thoughtMatch = trimmed.match(/^(.+?)[（\(](.+?)[）\)]$/);
    if (thoughtMatch && thoughtMatch[1] === '主人公') {
      commands.push({ type: 'thought', text: thoughtMatch[2].trim() });
      continue;
    }
  }
}

// パラメータパース
function parseParams(str) {
  const params = {};
  const regex = /(\w+)=["']?([^"'\s]+)["']?/g;
  let match;
  while ((match = regex.exec(str)) !== null) {
    params[match[1]] = match[2];
  }
  return params;
}

// コマンドリスト描画
function renderCommands() {
  const container = document.getElementById('commands');
  container.innerHTML = '';

  commands.forEach((cmd, i) => {
    const div = document.createElement('div');
    div.className = 'command-item' + (i === selectedIndex ? ' selected' : '');
    div.onclick = () => selectCommand(i);
    div.draggable = true;
    div.ondragstart = (e) => e.dataTransfer.setData('index', i);
    div.ondragover = (e) => e.preventDefault();
    div.ondrop = (e) => {
      const from = parseInt(e.dataTransfer.getData('index'));
      moveCommand(from, i);
    };

    const typeClass = getTypeClass(cmd.type);
    const content = getCommandContent(cmd);

    // 右クリックイベント
    div.oncontextmenu = (e) => {
      e.preventDefault();
      ctxTargetIndex = i;
      const menu = document.getElementById('context-menu');
      menu.style.display = 'block';
      menu.style.left = e.clientX + 'px';
      menu.style.top = e.clientY + 'px';
    };

    div.innerHTML = `
      <span class="type ${typeClass}">${getTypeName(cmd.type)}</span>
      <span class="content">${escapeHtml(content)}</span>
      <span class="actions">
        <button onclick="event.stopPropagation(); duplicateCommand(${i})">複製</button>
        <button onclick="event.stopPropagation(); deleteCommand(${i})">削除</button>
      </span>
    `;
    container.appendChild(div);
  });
}

function getTypeClass(type) {
  switch (type) {
    case 'bg': return 'bg';
    case 'bgm': return 'bgm';
    case 'char': case 'char_hide': return 'char';
    case 'text': case 'narration': case 'thought': return 'text';
    case 'choice': return 'choice';
    default: return '';
  }
}

function getTypeName(type) {
  switch (type) {
    case 'bg': return '背景';
    case 'bgm': return 'BGM';
    case 'char': return 'キャラ';
    case 'char_hide': return '退場';
    case 'text': return 'セリフ';
    case 'narration': return 'ナレ';
    case 'thought': return '心声';
    case 'choice': return '選択';
    case 'se': return 'SE';
    default: return type;
  }
}

function getCommandContent(cmd) {
  switch (cmd.type) {
    case 'bg': return cmd.image;
    case 'bgm': return cmd.file;
    case 'char': return `${cmd.name} (${cmd.face})`;
    case 'char_hide': return cmd.name;
    case 'text': return `${cmd.speaker}: ${cmd.text}`;
    case 'narration': return cmd.text;
    case 'thought': return `(${cmd.text})`;
    case 'choice': return `→${cmd.target}: ${cmd.text}`;
    case 'se': return cmd.file;
    default: return JSON.stringify(cmd);
  }
}

function escapeHtml(str) {
  return str.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;');
}

// コマンド選択
function selectCommand(index) {
  selectedIndex = index;
  renderCommands();
  updatePreview();
  showProperties();
}

// プレビュー更新
function updatePreview() {
  // 選択位置までの状態を計算
  currentState = { bg: '', bgm: '', char: '', charExpr: '' };

  for (let i = 0; i <= selectedIndex && i < commands.length; i++) {
    const cmd = commands[i];
    switch (cmd.type) {
      case 'bg':
        currentState.bg = cmd.image;
        break;
      case 'bgm':
        currentState.bgm = cmd.file;
        break;
      case 'char':
        currentState.char = cmd.name;
        currentState.charExpr = cmd.face;
        break;
      case 'char_hide':
        if (cmd.name === currentState.char) {
          currentState.char = '';
          currentState.charExpr = '';
        }
        break;
    }
  }

  // プレビュー表示
  const bgEl = document.getElementById('preview-bg');
  const charEl = document.getElementById('preview-char');
  const speakerEl = document.getElementById('preview-speaker');
  const textEl = document.getElementById('preview-text');

  // 背景
  if (currentState.bg) {
    bgEl.style.backgroundImage = `url('${ASSET_PATH}/backgrounds/${currentState.bg}.png')`;
  } else {
    bgEl.style.backgroundImage = 'none';
  }

  // キャラクター
  if (currentState.char) {
    const charId = CHAR_IDS[currentState.char] || currentState.char;
    charEl.style.backgroundImage = `url('${ASSET_PATH}/characters/${charId}_${currentState.charExpr}.png')`;
    charEl.style.display = 'block';
  } else {
    charEl.style.display = 'none';
  }

  // テキスト
  const cmd = commands[selectedIndex];
  if (cmd) {
    switch (cmd.type) {
      case 'text':
        speakerEl.textContent = cmd.speaker;
        textEl.textContent = cmd.text;
        break;
      case 'narration':
      case 'thought':
        speakerEl.textContent = '';
        textEl.textContent = cmd.text;
        break;
      default:
        speakerEl.textContent = '';
        textEl.textContent = '';
    }
  }

  // 情報表示
  document.getElementById('info-bg').textContent = currentState.bg || '-';
  document.getElementById('info-bgm').textContent = currentState.bgm || '-';
  document.getElementById('info-char').textContent = currentState.char ?
    `${currentState.char} (${currentState.charExpr})` : '-';
}

// プロパティパネル
function showProperties() {
  const panel = document.getElementById('properties');
  const cmd = commands[selectedIndex];

  if (!cmd) {
    panel.innerHTML = '<p style="color:#666">コマンドを選択してください</p>';
    return;
  }

  let html = '';

  switch (cmd.type) {
    case 'bg':
      html = `
        <div class="prop-group">
          <label>背景画像</label>
          <input type="text" value="${cmd.image}" onchange="updateProp('image', this.value)">
        </div>
      `;
      break;

    case 'bgm':
      html = `
        <div class="prop-group">
          <label>BGMファイル</label>
          <input type="text" value="${cmd.file}" onchange="updateProp('file', this.value)">
        </div>
      `;
      break;

    case 'char':
      html = `
        <div class="prop-group">
          <label>キャラクター</label>
          <select onchange="updateProp('name', this.value)">
            ${Object.keys(CHAR_IDS).map(n => `<option value="${n}" ${cmd.name === n ? 'selected' : ''}>${n}</option>`).join('')}
          </select>
        </div>
        <div class="prop-group">
          <label>表情</label>
          <input type="text" value="${cmd.face}" onchange="updateProp('face', this.value)">
        </div>
        <div class="prop-group">
          <label>位置</label>
          <select onchange="updateProp('pos', this.value)">
            <option value="left" ${cmd.pos === 'left' ? 'selected' : ''}>左</option>
            <option value="center" ${cmd.pos === 'center' ? 'selected' : ''}>中央</option>
            <option value="right" ${cmd.pos === 'right' ? 'selected' : ''}>右</option>
          </select>
        </div>
      `;
      break;

    case 'text':
      html = `
        <div class="prop-group">
          <label>話者</label>
          <input type="text" value="${cmd.speaker}" onchange="updateProp('speaker', this.value)">
        </div>
        <div class="prop-group">
          <label>セリフ</label>
          <textarea onchange="updateProp('text', this.value)">${cmd.text}</textarea>
        </div>
      `;
      break;

    case 'narration':
    case 'thought':
      html = `
        <div class="prop-group">
          <label>テキスト</label>
          <textarea onchange="updateProp('text', this.value)">${cmd.text}</textarea>
        </div>
      `;
      break;

    case 'choice':
      html = `
        <div class="prop-group">
          <label>選択肢テキスト</label>
          <input type="text" value="${cmd.text}" onchange="updateProp('text', this.value)">
        </div>
        <div class="prop-group">
          <label>ジャンプ先</label>
          <input type="text" value="${cmd.target}" onchange="updateProp('target', this.value)">
        </div>
      `;
      break;
  }

  panel.innerHTML = html;
}

function updateProp(key, value) {
  if (selectedIndex >= 0 && commands[selectedIndex]) {
    commands[selectedIndex][key] = value;
    renderCommands();
    updatePreview();
  }
}

// コマンド操作
function addCommand(type) {
  let cmd;
  switch (type) {
    case 'bg':
      cmd = { type: 'bg', image: 'classroom' };
      break;
    case 'bgm':
      cmd = { type: 'bgm', file: 'bgm_daily.mp3' };
      break;
    case 'char':
      cmd = { type: 'char', name: '幼馴染', face: 'neutral', pos: 'center' };
      break;
    case 'text':
      cmd = { type: 'text', speaker: '幼馴染', text: 'セリフ' };
      break;
    case 'narration':
      cmd = { type: 'narration', text: 'ナレーション' };
      break;
    case 'choice':
      cmd = { type: 'choice', text: '選択肢', target: 'label_name' };
      break;
  }

  const insertAt = selectedIndex >= 0 ? selectedIndex + 1 : commands.length;
  commands.splice(insertAt, 0, cmd);
  selectedIndex = insertAt;
  renderCommands();
  updatePreview();
  showProperties();
}

function deleteCommand(index) {
  commands.splice(index, 1);
  if (selectedIndex >= commands.length) selectedIndex = commands.length - 1;
  renderCommands();
  updatePreview();
  showProperties();
}

function duplicateCommand(index) {
  const copy = JSON.parse(JSON.stringify(commands[index]));
  commands.splice(index + 1, 0, copy);
  selectedIndex = index + 1;
  renderCommands();
  updatePreview();
  showProperties();
}

function moveCommand(from, to) {
  const [cmd] = commands.splice(from, 1);
  commands.splice(to, 0, cmd);
  selectedIndex = to;
  renderCommands();
}

// 再生
function playPreview() {
  if (isPlaying) return;
  isPlaying = true;
  playIndex = selectedIndex >= 0 ? selectedIndex : 0;

  // BGM開始
  if (currentState.bgm) {
    const audio = document.getElementById('bgm-audio');
    audio.src = `${ASSET_PATH}/bgm/${currentState.bgm}`;
    audio.play().catch(e => console.log('BGM blocked:', e));
  }

  playNext();
}

function playNext() {
  if (!isPlaying || playIndex >= commands.length) {
    stopPreview();
    return;
  }

  selectedIndex = playIndex;
  renderCommands();
  updatePreview();

  const cmd = commands[playIndex];
  let delay = 500; // デフォルト遅延

  // コマンドタイプによって遅延調整
  switch (cmd.type) {
    case 'text':
    case 'narration':
    case 'thought':
      delay = 2000 + cmd.text.length * 50; // 文字数に応じて
      break;
    case 'bg':
    case 'char':
      delay = 800;
      break;
    case 'bgm':
      // BGM変更
      const audio = document.getElementById('bgm-audio');
      audio.src = `${ASSET_PATH}/bgm/${cmd.file}`;
      audio.play().catch(e => console.log('BGM blocked:', e));
      delay = 500;
      break;
  }

  playIndex++;
  playTimer = setTimeout(playNext, delay);
}

function stopPreview() {
  isPlaying = false;
  if (playTimer) clearTimeout(playTimer);
  document.getElementById('bgm-audio').pause();
}

// 保存 (.ks)
function saveFile() {
  let output = '; Auto-generated TyranoScript\n*start\n\n';
  let lastSpeaker = '';

  for (const cmd of commands) {
    switch (cmd.type) {
      case 'bg':
        output += `[bg storage="${cmd.image}.png"]\n`;
        break;
      case 'bgm':
        output += `[playbgm storage="${cmd.file}"]\n`;
        break;
      case 'char':
        const charId = CHAR_IDS[cmd.name] || cmd.name;
        output += `[chara_show name="${charId}" face="${cmd.face}" pos="${cmd.pos}"]\n`;
        break;
      case 'char_hide':
        const hideId = CHAR_IDS[cmd.name] || cmd.name;
        output += `[chara_hide name="${hideId}"]\n`;
        break;
      case 'text':
        const speakerId = CHAR_IDS[cmd.speaker] || cmd.speaker;
        if (speakerId !== lastSpeaker) {
          output += `\n#${speakerId}\n`;
          lastSpeaker = speakerId;
        }
        output += `${cmd.text}\n`;
        break;
      case 'narration':
        output += `\n${cmd.text}\n`;
        lastSpeaker = '';
        break;
      case 'thought':
        output += `\n; 心の声\n${cmd.text}\n`;
        lastSpeaker = '';
        break;
      case 'choice':
        output += `[glink text="${cmd.text}" target="${cmd.target}"]\n`;
        break;
      case 'se':
        output += `[playse storage="${cmd.file}"]\n`;
        break;
    }
  }

  output += '\n[end]\n';

  downloadFile(output, 'scenario.ks', 'text/plain');
}

// 保存 (.txt)
function exportTxt() {
  let output = '';

  for (const cmd of commands) {
    switch (cmd.type) {
      case 'bg':
        output += `[BG: ${cmd.image}]\n`;
        break;
      case 'bgm':
        output += `[BGM: ${cmd.file}]\n`;
        break;
      case 'char':
        output += `[char: ${cmd.name}, ${cmd.face}]\n`;
        break;
      case 'text':
        output += `${cmd.speaker}：「${cmd.text}」\n`;
        break;
      case 'narration':
        output += `（${cmd.text}）\n`;
        break;
      case 'thought':
        output += `主人公（${cmd.text}）\n`;
        break;
      case 'se':
        output += `[SE: ${cmd.file}]\n`;
        break;
    }
    output += '\n';
  }

  downloadFile(output, 'scenario.txt', 'text/plain');
}

function downloadFile(content, filename, type) {
  const blob = new Blob([content], { type });
  const url = URL.createObjectURL(blob);
  const a = document.createElement('a');
  a.href = url;
  a.download = filename;
  a.click();
  URL.revokeObjectURL(url);
}

// 右クリックメニュー: 上に追加
function ctxAddBefore(type) {
  document.getElementById('context-menu').style.display = 'none';
  const cmd = createCommand(type);
  const insertAt = ctxTargetIndex >= 0 ? ctxTargetIndex : 0;
  commands.splice(insertAt, 0, cmd);
  selectedIndex = insertAt;
  renderCommands();
  updatePreview();
  showProperties();
}

// 右クリックメニュー: 下に追加
function ctxAddAfter(type) {
  document.getElementById('context-menu').style.display = 'none';
  const cmd = createCommand(type);
  const insertAt = ctxTargetIndex >= 0 ? ctxTargetIndex + 1 : commands.length;
  commands.splice(insertAt, 0, cmd);
  selectedIndex = insertAt;
  renderCommands();
  updatePreview();
  showProperties();
}

// 右クリックメニュー: 複製
function ctxDuplicate() {
  document.getElementById('context-menu').style.display = 'none';
  if (ctxTargetIndex >= 0) {
    duplicateCommand(ctxTargetIndex);
  }
}

// 右クリックメニュー: 削除
function ctxDelete() {
  document.getElementById('context-menu').style.display = 'none';
  if (ctxTargetIndex >= 0) {
    deleteCommand(ctxTargetIndex);
  }
}

// コマンド作成ヘルパー
function createCommand(type) {
  switch (type) {
    case 'bg':
      return { type: 'bg', image: 'classroom' };
    case 'bgm':
      return { type: 'bgm', file: 'bgm_daily.mp3' };
    case 'char':
      return { type: 'char', name: '幼馴染', face: 'neutral', pos: 'center' };
    case 'text':
      return { type: 'text', speaker: '幼馴染', text: 'セリフ' };
    case 'narration':
      return { type: 'narration', text: 'ナレーション' };
    case 'choice':
      return { type: 'choice', text: '選択肢', target: 'label_name' };
    default:
      return { type: 'text', speaker: '', text: '' };
  }
}

// シナリオフォルダのパス
const SCENARIO_PATH = '/game/public/scenarios/';

// ファイル一覧モーダルを表示
async function showFileList() {
  const modal = document.getElementById('file-modal');
  const listEl = document.getElementById('file-list');

  modal.style.display = 'flex';
  listEl.innerHTML = '<p style="color:#888">読み込み中...</p>';

  try {
    // ディレクトリ一覧を取得（http-serverのディレクトリリスティング）
    const res = await fetch(SCENARIO_PATH);
    const html = await res.text();

    // HTMLからファイル名を抽出
    const parser = new DOMParser();
    const doc = parser.parseFromString(html, 'text/html');
    const links = doc.querySelectorAll('a');

    const files = [];
    links.forEach(link => {
      const href = link.getAttribute('href');
      if (href && (href.endsWith('.ks') || href.endsWith('.txt') || href.endsWith('.json'))) {
        files.push(href);
      }
    });

    if (files.length === 0) {
      listEl.innerHTML = '<p style="color:#888">ファイルが見つかりません</p>';
      return;
    }

    // ファイル種類でグループ分け
    const ksFiles = files.filter(f => f.endsWith('.ks'));
    const txtFiles = files.filter(f => f.endsWith('.txt'));
    const jsonFiles = files.filter(f => f.endsWith('.json'));

    let html2 = '';

    if (ksFiles.length > 0) {
      html2 += '<div style="margin-bottom:15px;"><div style="color:#2e7d32; margin-bottom:8px; font-weight:bold;">.ks ファイル</div>';
      ksFiles.forEach(f => {
        html2 += `<div class="file-item" onclick="loadFromServer('${f}')">${f}</div>`;
      });
      html2 += '</div>';
    }

    if (txtFiles.length > 0) {
      html2 += '<div style="margin-bottom:15px;"><div style="color:#1565c0; margin-bottom:8px; font-weight:bold;">.txt ファイル</div>';
      txtFiles.forEach(f => {
        html2 += `<div class="file-item" onclick="loadFromServer('${f}')">${f}</div>`;
      });
      html2 += '</div>';
    }

    if (jsonFiles.length > 0) {
      html2 += '<div style="margin-bottom:15px;"><div style="color:#6a1b9a; margin-bottom:8px; font-weight:bold;">.json ファイル</div>';
      jsonFiles.forEach(f => {
        html2 += `<div class="file-item" onclick="loadFromServer('${f}')">${f}</div>`;
      });
      html2 += '</div>';
    }

    listEl.innerHTML = html2;

  } catch (e) {
    console.error('Failed to load file list:', e);
    listEl.innerHTML = '<p style="color:#e94560">ファイル一覧の取得に失敗しました</p>';
  }
}

// モーダルを閉じる
function closeFileModal() {
  document.getElementById('file-modal').style.display = 'none';
}

// サーバーからファイルを読み込む
async function loadFromServer(filename) {
  closeFileModal();

  try {
    const res = await fetch(SCENARIO_PATH + filename);
    const content = await res.text();

    if (filename.endsWith('.ks')) {
      parseKsFile(content);
    } else if (filename.endsWith('.txt')) {
      parseTxtFile(content);
    } else if (filename.endsWith('.json')) {
      parseJsonFile(content, filename);
    }

    renderCommands();
    if (commands.length > 0) {
      selectCommand(0);
    }

    // 現在のファイル名を表示
    document.querySelector('header h1').textContent = `シナリオエディタ - ${filename}`;

  } catch (e) {
    console.error('Failed to load file:', e);
    alert('ファイルの読み込みに失敗しました: ' + filename);
  }
}

// JSONファイルをパース
function parseJsonFile(content, filename) {
  commands = [];
  try {
    const data = JSON.parse(content);
    // ルート名を推測
    const rootKey = filename.replace('.json', '');
    const scenario = data[rootKey] || data.commands || data;

    if (Array.isArray(scenario)) {
      scenario.forEach(cmd => {
        if (cmd.type === 'bg') {
          commands.push({ type: 'bg', image: cmd.image || '' });
        } else if (cmd.type === 'bgm') {
          commands.push({ type: 'bgm', file: cmd.file || '' });
        } else if (cmd.type === 'char') {
          commands.push({ type: 'char', name: cmd.name || cmd.image?.split('_')[0] || '', face: 'neutral', pos: cmd.position || 'center' });
        } else if (cmd.type === 'text') {
          commands.push({ type: 'text', speaker: cmd.speaker || '', text: cmd.text || '' });
        } else if (cmd.type === 'monologue') {
          commands.push({ type: 'narration', text: cmd.text || '' });
        } else if (cmd.type === 'choice') {
          (cmd.options || []).forEach(opt => {
            commands.push({ type: 'choice', text: opt.text || '', target: opt.next || '' });
          });
        }
      });
    }
  } catch (e) {
    console.error('JSON parse error:', e);
  }
}
