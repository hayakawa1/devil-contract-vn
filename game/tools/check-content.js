const fs = require('node:fs');
const path = require('node:path');

const root = process.cwd();
const scenariosDir = path.join(root, 'public', 'scenarios');
const assetsDir = path.join(root, 'public', 'assets');
const charactersDir = path.join(assetsDir, 'characters');

const errors = [];

function rel(file) {
  return path.relative(root, file).replace(/\\/g, '/');
}

function addError(file, line, message) {
  errors.push(`${rel(file)}:${line}: ${message}`);
}

function readJson(file) {
  try {
    return JSON.parse(fs.readFileSync(file, 'utf8'));
  } catch (error) {
    errors.push(`${rel(file)}: invalid JSON: ${error.message}`);
    return null;
  }
}

function listNames(dir) {
  return new Set(fs.existsSync(dir) ? fs.readdirSync(dir) : []);
}

function hasFile(dir, filename) {
  return listNames(dir).has(filename);
}

function removeExtension(filename) {
  return String(filename || '').replace(/\.(png|jpg|jpeg|gif|webp|mp3|ogg|wav|ks|json)$/i, '');
}

function tokenizeTag(tagContent) {
  const tokens = [];
  let current = '';
  let inQuote = false;
  let quoteChar = '';

  for (const char of tagContent) {
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

  if (current) tokens.push(current);
  return tokens;
}

function parseParams(parts) {
  const params = {};
  for (const part of parts) {
    const eqIndex = part.indexOf('=');
    if (eqIndex === -1) continue;
    const key = part.slice(0, eqIndex);
    let value = part.slice(eqIndex + 1);
    if (
      (value.startsWith('"') && value.endsWith('"')) ||
      (value.startsWith("'") && value.endsWith("'"))
    ) {
      value = value.slice(1, -1);
    }
    params[key] = value;
  }
  return params;
}

function parseTags(line) {
  const tags = [];
  const tagRegex = /\[([^\]]+)\]/g;
  let match;
  while ((match = tagRegex.exec(line)) !== null) {
    const tokens = tokenizeTag(match[1]);
    if (!tokens.length) continue;
    tags.push({
      name: tokens[0].toLowerCase(),
      params: parseParams(tokens.slice(1)),
    });
  }
  return tags;
}

function normalizeExpression(expression) {
  const expr = String(expression || '').toLowerCase();
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

function characterCandidates(characterId, face, characters) {
  const char = characters[characterId];
  if (!char) return [];

  const expr = normalizeExpression(face || 'neutral');
  const sprites = char.sprites || {};
  const stageable = Boolean(sprites.stage1 || sprites.stage2);
  const names = new Set();

  Object.values(sprites).forEach((sprite) => {
    if (typeof sprite === 'string') names.add(sprite);
  });

  if (/^(stage|scale)\d+(_|$)/.test(expr)) {
    if (/^(stage|scale)\d+$/.test(expr)) {
      names.add(`${characterId}_${expr}_default`);
    } else {
      names.add(`${characterId}_${expr}`);
    }
  } else if (!stageable) {
    if (expr === 'neutral' || expr === 'default') {
      names.add(`${characterId}_neutral`);
    } else {
      names.add(`${characterId}_neutral_${expr}`);
    }
  } else if (expr === 'neutral' || expr === 'default') {
    names.add(`${characterId}_scale1_default`);
    names.add(`${characterId}_stage1_default`);
    names.add(`${characterId}_stage2_default`);
  } else {
    names.add(`${characterId}_neutral_${expr}`);
    names.add(`${characterId}_scale1_${expr}`);
    names.add(`${characterId}_stage1_${expr}`);
    names.add(`${characterId}_stage2_${expr}`);
  }

  return Array.from(names);
}

function checkAsset(file, line, dirName, filename) {
  if (!filename) {
    addError(file, line, `empty ${dirName} asset reference`);
    return;
  }

  const dir = path.join(assetsDir, dirName);
  const assetRef = path.normalize(String(filename));
  if (path.isAbsolute(assetRef) || assetRef === '..' || assetRef.startsWith(`..${path.sep}`)) {
    addError(file, line, `invalid ${dirName} asset path: ${filename}`);
    return;
  }

  const assetPath = path.join(dir, assetRef);
  if (!fs.existsSync(assetPath) || !fs.statSync(assetPath).isFile()) {
    addError(file, line, `missing ${dirName} asset: ${filename}`);
  }
}

const charactersJson = readJson(path.join(assetsDir, 'characters.json'));
readJson(path.join(assetsDir, 'episodes.json'));

const characters = charactersJson?.characters || {};
const characterImageNames = listNames(charactersDir);
const scenarioFiles = fs.readdirSync(scenariosDir).filter((name) => name.endsWith('.ks')).sort();
const scenarioNames = new Set(scenarioFiles.map(removeExtension));
const scenarioLabels = new Map();

for (const filename of scenarioFiles) {
  const file = path.join(scenariosDir, filename);
  const labels = new Set();
  const lines = fs.readFileSync(file, 'utf8').split(/\r?\n/);
  lines.forEach((line) => {
    const trimmed = line.trim();
    if (trimmed.startsWith('*')) {
      labels.add(trimmed.slice(1).trim());
    }
  });
  scenarioLabels.set(removeExtension(filename), labels);
}

for (const filename of scenarioFiles) {
  const file = path.join(scenariosDir, filename);
  const scenarioName = removeExtension(filename);
  const labels = scenarioLabels.get(scenarioName) || new Set();
  const lines = fs.readFileSync(file, 'utf8').split(/\r?\n/);

  lines.forEach((line, index) => {
    const lineNo = index + 1;
    for (const tag of parseTags(line)) {
      const p = tag.params;

      if (tag.name === 'bg') {
        const image = removeExtension(p.storage || p.file || '');
        checkAsset(file, lineNo, 'backgrounds', `${image}.webp`);
      }

      if (tag.name === 'image' && (!p.layer || p.layer === 'base')) {
        const image = removeExtension(p.storage || p.file || '');
        checkAsset(file, lineNo, 'backgrounds', `${image}.webp`);
      }

      if (tag.name === 'playbgm') {
        checkAsset(file, lineNo, 'bgm', p.storage || p.file || '');
      }

      if (tag.name === 'playse') {
        checkAsset(file, lineNo, 'se', p.storage || p.file || '');
      }

      if (tag.name === 'jump') {
        const target = (p.target || '').replace(/^\*/, '');
        const storage = p.storage || p.file || '';
        if (storage) {
          const targetScenario = removeExtension(storage);
          if (!scenarioNames.has(targetScenario)) {
            addError(file, lineNo, `missing scenario: ${storage}`);
          }
        } else if (target && !labels.has(target)) {
          addError(file, lineNo, `missing local jump label: *${target}`);
        }
      }

      if (tag.name === 'glink' || tag.name === 'link') {
        const target = (p.target || '').replace(/^\*/, '');
        if (!target) {
          addError(file, lineNo, 'choice has no target');
        } else if (!labels.has(target)) {
          addError(file, lineNo, `missing choice label: *${target}`);
        }
      }

      if (tag.name === 'chara_show' || tag.name === 'chara_face' || tag.name === 'chara_mod') {
        const characterId = p.name || p.character || '';
        if (!characters[characterId]) {
          addError(file, lineNo, `unknown character: ${characterId}`);
          continue;
        }

        const candidates = characterCandidates(characterId, p.face || 'neutral', characters);
        const found = candidates.some((name) => characterImageNames.has(`${name}.webp`));
        if (!found) {
          addError(
            file,
            lineNo,
            `missing character image for ${characterId}/${p.face || 'neutral'}; tried ${candidates.map((name) => `${name}.webp`).join(', ')}`
          );
        }
      }
    }
  });
}

if (errors.length) {
  console.error(`Content check failed with ${errors.length} issue(s):`);
  for (const error of errors) console.error(`- ${error}`);
  process.exitCode = 1;
} else {
  console.log(`Content check passed: ${scenarioFiles.length} scenario(s), ${characterImageNames.size} character image(s).`);
}
