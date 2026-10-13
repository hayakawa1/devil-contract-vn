"""
Extract translatable lines from a Japanese .ks file, or merge a translation back in.

  python tools/i18n_ks.py extract public/scenarios/prologue.ks > prologue.ja.txt
  python tools/i18n_ks.py merge public/scenarios/prologue.ks translations/prologue.en.txt public/scenarios/en/prologue.ks

Translation file format: one entry per line, "<line number>|<English text>".
Text lines keep their trailing tags ([l][er] etc.); glink lines get their text="" replaced.
Lines starting with "#" in the translation file are ignored (use for notes).
"""
import re
import sys

TRAILING_TAGS = re.compile(r'((?:\[[^\]]+\])*)\s*$')
GLINK_TEXT = re.compile(r'(\[(?:glink|link)\b[^\]]*?\stext=")([^"]*)(")')


def classify(line):
    s = line.strip()
    if not s or s.startswith(';') or s.startswith('*') or s.startswith('#'):
        return None
    if s.startswith('['):
        return 'glink' if GLINK_TEXT.search(s) else None
    return 'text'


def extract(path):
    speaker = ''
    out = []
    with open(path, encoding='utf-8-sig') as f:
        for n, line in enumerate(f.read().split('\n'), 1):
            s = line.strip()
            if s.startswith('#'):
                speaker = s[1:]
                continue
            kind = classify(line)
            if kind == 'text':
                body = TRAILING_TAGS.sub('', s)
                out.append(f'{n}|{speaker or "-"}|{body}')
                speaker = ''
            elif kind == 'glink':
                out.append(f'{n}|CHOICE|{GLINK_TEXT.search(s).group(2)}')
    print('\n'.join(out))


def merge(ja_path, tr_path, out_path):
    tr = {}
    with open(tr_path, encoding='utf-8-sig') as f:
        for raw in f.read().split('\n'):
            if not raw.strip() or raw.startswith('#'):
                continue
            num, _, text = raw.partition('|')
            tr[int(num)] = text.strip()
    lines = open(ja_path, encoding='utf-8-sig').read().split('\n')
    missing = []
    for i, line in enumerate(lines):
        n = i + 1
        kind = classify(line)
        if kind is None:
            continue
        if n not in tr:
            missing.append(n)
            continue
        if kind == 'text':
            suffix = TRAILING_TAGS.search(line.strip()).group(1)
            indent = line[: len(line) - len(line.lstrip())]
            lines[i] = f'{indent}{tr[n]}{suffix}'
        else:
            lines[i] = GLINK_TEXT.sub(lambda m: m.group(1) + tr[n].replace('"', '”') + m.group(3), line)
    if missing:
        sys.exit(f'{tr_path}: missing translations for lines {missing[:20]}{"..." if len(missing) > 20 else ""}')
    extra = sorted(set(tr) - {i + 1 for i, l in enumerate(lines) if classify(open(ja_path, encoding="utf-8-sig").read().split(chr(10))[i])})
    if extra:
        sys.exit(f'{tr_path}: translations for non-text lines {extra[:20]}')
    with open(out_path, 'w', encoding='utf-8', newline='\n') as f:
        f.write('\n'.join(lines))
    print(f'wrote {out_path}')


if __name__ == '__main__':
    if sys.argv[1] == 'extract':
        extract(sys.argv[2])
    elif sys.argv[1] == 'merge':
        merge(sys.argv[2], sys.argv[3], sys.argv[4])
    else:
        sys.exit(__doc__)
