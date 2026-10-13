// 英語版シナリオ（public/scenarios/en/*.ks）が日本語版と同じ構造かを確認する。
// ラベル・タグ・話者の並びが一致していること（本文と選択肢の文言は除く）を検査する。
const fs = require('node:fs');
const path = require('node:path');

const root = path.resolve(__dirname, '..');
const jaDir = path.join(root, 'public', 'scenarios');
const enDir = path.join(jaDir, 'en');

function skeleton(text) {
  const out = [];
  for (const raw of text.split(/\r?\n/)) {
    const line = raw.trim();
    if (!line || line.startsWith(';')) continue;
    let item;
    if (line.startsWith('*')) item = `LABEL ${line}`;
    else if (line.startsWith('#')) item = `SPEAKER ${line}`;
    else if (line.startsWith('[')) {
      // 選択肢の文言は翻訳されるので、text 属性だけ伏せる
      item = `TAG ${line.replace(/\stext="[^"]*"/g, ' text=*')}`;
    } else item = 'TEXT';
    if (item === 'TEXT' && out[out.length - 1] === 'TEXT') continue;
    out.push(item);
  }
  return out;
}

const errors = [];
const jaFiles = fs.readdirSync(jaDir).filter((f) => f.endsWith('.ks'));
for (const file of jaFiles) {
  const enPath = path.join(enDir, file);
  if (!fs.existsSync(enPath)) {
    errors.push(`${file}: English version missing`);
    continue;
  }
  const ja = skeleton(fs.readFileSync(path.join(jaDir, file), 'utf8'));
  const en = skeleton(fs.readFileSync(enPath, 'utf8'));
  const enText = fs.readFileSync(enPath, 'utf8');
  const leftover = enText.split(/\r?\n/).findIndex((l) => !l.trim().startsWith(';') && /[぀-ヿ]/.test(l.replace(/^#\S+$/, '')));
  if (leftover !== -1) errors.push(`en/${file}:${leftover + 1}: Japanese text left in English file`);
  const n = Math.max(ja.length, en.length);
  for (let i = 0; i < n; i++) {
    if (ja[i] !== en[i]) {
      errors.push(`${file}: structure differs at item ${i}: ja=${ja[i]} | en=${en[i]}`);
      break;
    }
  }
}

if (errors.length) {
  console.error(errors.join('\n'));
  process.exit(1);
}
console.log(`Translation check passed: ${jaFiles.length} scenario(s).`);
