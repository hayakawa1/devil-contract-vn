/**
 * 言語切り替え（日本語 / English）
 * 言語は localStorage に保存し、切り替え時はページを再読み込みする。
 */
const STORAGE_KEY = 'akuma_lang';
const SUPPORTED = ['ja', 'en'];

function detectLang() {
  try {
    const saved = localStorage.getItem(STORAGE_KEY);
    if (SUPPORTED.includes(saved)) return saved;
  } catch (e) {
    // localStorage が使えない環境ではブラウザの言語で判定
  }
  const nav = (navigator.language || 'ja').toLowerCase();
  return nav.startsWith('ja') ? 'ja' : 'en';
}

export const LANG = detectLang();

export function setLang(lang) {
  if (!SUPPORTED.includes(lang) || lang === LANG) return;
  try {
    localStorage.setItem(STORAGE_KEY, lang);
  } catch (e) {
    // 保存できなくても再読み込みだけはする
  }
  const url = new URL(location.href);
  url.searchParams.set('lang', lang);
  location.href = url.toString();
}

// URL の ?lang=en でも指定できる（共有リンク用）
(() => {
  const param = new URLSearchParams(location.search).get('lang');
  if (SUPPORTED.includes(param) && param !== LANG) {
    try { localStorage.setItem(STORAGE_KEY, param); } catch (e) { /* noop */ }
    location.reload();
  }
})();

const STRINGS = {
  ja: {
    'doc.title': '悪魔との契約',
    'title.episodes': 'エピソード選択',
    'title.characters': 'キャラクター図鑑',
    'title.config': '設定',
    'episodes.heading': 'エピソード選択',
    'episodes.description': '閲覧するエピソードを選択してください',
    'common.back': '戻る',
    'characters.heading': 'キャラクター図鑑',
    'filter.all': '全員',
    'filter.classmate': '同級生',
    'filter.special': '特殊枠',
    'filter.other': 'その他',
    'detail.name': 'キャラクター名',
    'detail.description': '説明',
    'detail.episodes': '登場エピソード',
    'detail.role': '役割',
    'detail.type': 'タイプ',
    'detail.unknown': '不明',
    'detail.noInfo': '情報なし',
    'type.classmate': '同級生',
    'type.special': '特殊枠',
    'type.other': 'その他',
    'log.heading': 'バックログ',
    'log.monologue': '（モノローグ）',
    'config.heading': '設定',
    'config.bgm': 'BGM音量',
    'config.se': 'SE音量',
    'config.textSpeed': 'テキスト速度',
    'config.autoSpeed': 'AUTO速度',
    'config.language': '言語 / Language',
    'menu.resume': 'ゲームに戻る',
    'menu.toEpisodes': 'エピソード選択へ',
    'menu.toTitle': 'タイトルへ',
    'end.heading': 'エピソード終了',
    'end.next': '次の話へ（{title}）',
    'name.label': '名前',
    'name.submit': '決定',
    'name.default': '主人公',
    'pov.prefix': '視点: ',
    'stat.affinity': '{name}好感度',
  },
  en: {
    'doc.title': 'Contract with the Devil',
    'title.episodes': 'Episodes',
    'title.characters': 'Characters',
    'title.config': 'Settings',
    'episodes.heading': 'Episodes',
    'episodes.description': 'Choose an episode to play',
    'common.back': 'Back',
    'characters.heading': 'Characters',
    'filter.all': 'All',
    'filter.classmate': 'Classmates',
    'filter.special': 'Special',
    'filter.other': 'Others',
    'detail.name': 'Character',
    'detail.description': 'Profile',
    'detail.episodes': 'Appears in',
    'detail.role': 'Role',
    'detail.type': 'Type',
    'detail.unknown': 'Unknown',
    'detail.noInfo': 'No information',
    'type.classmate': 'Classmate',
    'type.special': 'Special',
    'type.other': 'Other',
    'log.heading': 'Backlog',
    'log.monologue': '(Monologue)',
    'config.heading': 'Settings',
    'config.bgm': 'Music volume',
    'config.se': 'Sound volume',
    'config.textSpeed': 'Text speed',
    'config.autoSpeed': 'Auto speed',
    'config.language': '言語 / Language',
    'menu.resume': 'Resume',
    'menu.toEpisodes': 'Episodes',
    'menu.toTitle': 'Title screen',
    'end.heading': 'End of episode',
    'end.next': 'Next: {title}',
    'name.label': 'Name',
    'name.submit': 'OK',
    'name.default': 'Haru',
    'pov.prefix': 'POV: ',
    'stat.affinity': '{name} affinity',
  },
};

export function t(key, vars = {}) {
  const table = STRINGS[LANG] || STRINGS.ja;
  const template = table[key] ?? STRINGS.ja[key] ?? key;
  return template.replace(/\{(\w+)\}/g, (_, name) => (vars[name] ?? ''));
}

/**
 * JSON データの「field_en」を英語時に優先して返す。
 */
export function loc(obj, field) {
  if (!obj) return '';
  if (LANG === 'en') {
    const en = obj[`${field}_en`];
    if (en !== undefined && en !== null && en !== '') return en;
  }
  return obj[field];
}

/**
 * index.html の data-i18n 属性を持つ要素を翻訳する。
 */
export function applyStaticTranslations(root = document) {
  document.documentElement.lang = LANG;
  document.title = t('doc.title');
  root.querySelectorAll('[data-i18n]').forEach((el) => {
    el.textContent = t(el.dataset.i18n);
  });
  root.querySelectorAll('[data-lang]').forEach((el) => {
    el.classList.toggle('active', el.dataset.lang === LANG);
    el.addEventListener('click', () => setLang(el.dataset.lang));
  });
}
