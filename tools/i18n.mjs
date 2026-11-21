#!/usr/bin/env node
// Builds a translated set of BASIC sources from the German originals.
//
// Translation sources live in i18n/<lang>/:
//   strings/<file>.txt   "<line>|<text 1>|<text 2>|..."  translations of the translatable texts of one
//                        BASIC line (string literals and DATA items with at least two letters, in order).
//                        An entry is also reused for every other line (in any file) that has exactly the
//                        same German texts, so shared code only needs translating once.
//   code/<file>.txt      "<line> <complete BASIC line>"  replaces a whole line after the string pass
//                        (key remapping, conversation keywords, added message lines ...).
//   rules.txt            "<from> => <to>"  literal replacements applied to code outside of string
//                        literals in all files (e.g. key comparisons), before code/ overrides.
//
//   node tools/i18n.mjs work <lang> <file> [n]   show German lines still missing a translation (with code)
//   node tools/i18n.mjs build <lang>             write web/data/basic/<lang>/ and report coverage
//   node tools/i18n.mjs stats <lang>             coverage per file
import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';
import { textToLines, textToPetscii } from '../web/js/basictext.js';

const root = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '..');
const [cmd, lang = 'en', fileArg, countArg] = process.argv.slice(2);
const deBase = path.join(root, 'web/data/basic/de');
const trBase = path.join(root, 'i18n', lang);

// processing order: earlier files define the shared translations
const ORDER = ['ddd.prep', 'ddd.twna', 'ddd.twnb', 'ddd.twnc', 'ddd.twnk', 'ddd.twnl', 'ddd.twnr', 'ddd.twnd', 'ddd.twne',
  'ddd.twnf', 'ddd.twng', 'ddd.twnh', 'ddd.twni', 'ddd.twnj', 'ddd.twnm', 'ddd.twnp', 'ddd.twnn', 'ddd.twno', 'ddd.twnq',
  'ddd.boot', 'ddd.dbas', 'ddd.konj'];

function sourceFiles() {
  const out = [];
  for (const d of fs.readdirSync(deBase).sort()) for (const f of fs.readdirSync(path.join(deBase, d)).sort()) {
    if (f.endsWith('.bas')) out.push({ disk: d, name: f.replace(/\.bas$/, ''), rel: path.join(d, f) });
  }
  out.sort((a, b) => (ORDER.indexOf(a.name) - ORDER.indexOf(b.name)) || a.disk.localeCompare(b.disk));
  return out;
}

const plain = (s) => s.replace(/\{[^}]*\}/g, '');
export const isText = (s) => /[a-zäöü]{2}/.test(s.replace(/\{[^}]*\}/g, ' '));

// Tokenize a source line into segments: {t:'code'|'str'|'data', v}
export function segments(code) {
  const segs = [];
  let i = 0, cur = '';
  const flush = () => { if (cur) segs.push({ t: 'code', v: cur }); cur = ''; };
  let inData = false;
  while (i < code.length) {
    const c = code[i];
    if (c === '"') {
      let j = i + 1;
      while (j < code.length && code[j] !== '"') j++;
      flush();
      segs.push({ t: 'str', v: code.slice(i + 1, j), closed: j < code.length });
      i = j + 1;
      continue;
    }
    if (!inData && code.startsWith('data', i) && !/[a-z0-9$]/.test(code[i - 1] || ' ' ) ) {
      cur += 'data'; i += 4; inData = true;
      // DATA items up to ':' (quotes handled by the main loop)
      let j = i;
      while (j < code.length && code[j] !== ':' && code[j] !== '"') j++;
      const items = code.slice(i, j);
      flush();
      // split items by comma, keep commas as code
      const parts = items.split(',');
      parts.forEach((p, k) => { segs.push({ t: 'data', v: p }); if (k < parts.length - 1) segs.push({ t: 'code', v: ',' }); });
      i = j;
      if (code[j] === ':') inData = false;
      continue;
    }
    if (c === ':') inData = false;
    if (code.startsWith('rem', i)) { cur += code.slice(i); i = code.length; continue; }
    cur += c; i++;
  }
  flush();
  return segs;
}

export function texts(code) { return segments(code).filter((s) => s.t !== 'code' && isText(s.v)).map((s) => s.v); }

// Short fragments (keyword completions such as "en" or "tz") depend on context, so they are
// only reused when the German text is long enough to be unambiguous.
const shareable = (g) => g.length >= 2 || plain(g.join('')).length >= 12;

function readLines(file) {
  const m = new Map();
  if (!fs.existsSync(file)) return m;
  for (const raw of fs.readFileSync(file, 'utf8').split(/\r?\n/)) {
    const r = /^\s*(\d+) ?(.*)$/.exec(raw);
    if (r) m.set(+r[1], r[2]);
  }
  return m;
}

const KEEP = Symbol('keep'); // "<line>=" keeps the German texts (graphics drawn with letters)

function readTable(file) {
  const m = new Map();
  if (!fs.existsSync(file)) return m;
  for (const raw of fs.readFileSync(file, 'utf8').split(/\r?\n/)) {
    if (!raw.trim() || raw.startsWith('#')) continue;
    const r = /^(\d+)(?:\|(.*)|=)$/.exec(raw);
    if (!r) throw new Error(`${file}: bad entry: ${raw}`);
    m.set(+r[1], r[2] === undefined ? KEEP : r[2].split('|'));
  }
  return m;
}

function load() {
  const files = sourceFiles();
  const dict = new Map(); // german tuple key -> english array
  const perFile = new Map();
  const errs = [];
  for (const f of files) {
    const t = readTable(path.join(trBase, 'strings', f.name + '.txt'));
    perFile.set(f.rel, t);
    const de = readLines(path.join(deBase, f.rel));
    for (const [n, en0] of t) {
      if (!de.has(n)) { errs.push(`${f.name}:${n} no such line`); continue; }
      const g = texts(de.get(n));
      const en = en0 === KEEP ? g : en0;
      if (en0 === KEEP) t.set(n, g);
      if (g.length !== en.length) { errs.push(`${f.name}:${n} expects ${g.length} texts, got ${en.length}\n  de: ${g.join('|')}\n  en: ${en.join('|')}`); continue; }
      const key = g.join('\u0001');
      if (shareable(g) && !dict.has(key)) dict.set(key, en);
    }
  }
  // explicit shared pairs: "<german texts> => <english texts>" (texts separated by |)
  const cf = path.join(trBase, 'common.txt');
  if (fs.existsSync(cf)) for (const raw of fs.readFileSync(cf, 'utf8').split(/\r?\n/)) {
    if (!raw.trim() || raw.startsWith('#')) continue;
    const [a, b] = raw.split(' => ');
    if (b === undefined) { errs.push('common.txt: bad entry ' + raw); continue; }
    const g = a.split('|'), en = b.split('|');
    if (g.length !== en.length) { errs.push('common.txt: count mismatch ' + raw); continue; }
    dict.set(g.join('\u0001'), en);
  }
  if (errs.length) { console.log(errs.join('\n')); process.exit(1); }
  const rules = [];
  const rf = path.join(trBase, 'rules.txt');
  if (fs.existsSync(rf)) for (const raw of fs.readFileSync(rf, 'utf8').split(/\r?\n/)) {
    if (!raw.trim() || raw.startsWith('#')) continue;
    const [a, b] = raw.split(' => ');
    rules.push([a, b ?? '']);
  }
  return { files, dict, perFile, rules };
}

function translateLine(code, en) {
  let k = 0;
  return segments(code).map((s) => {
    if (s.t === 'code') return s.v;
    const v = isText(s.v) ? en[k++] : s.v;
    return s.t === 'str' ? `"${v}${s.closed ? '"' : ''}` : v;
  }).join('');
}

function applyRules(code, rules) {
  if (!rules.length) return code;
  // apply to the line as a whole; rules are written including quotes where needed
  for (const [a, b] of rules) code = code.split(a).join(b);
  return code;
}

const visLen = (s) => textToPetscii(s).filter((b) => (b >= 0x20 && b < 0x80) || b >= 0xa0).length;

if (cmd === "work") {
  const { files, dict, rules } = load();
  const f = files.find((x) => x.name === fileArg || x.rel === fileArg);
  if (!f) throw new Error('unknown file ' + fileArg);
  const de = readLines(path.join(deBase, f.rel));
  const own = readTable(path.join(trBase, 'strings', f.name + '.txt'));
  const codeOv = readLines(path.join(trBase, 'code', f.name + '.txt'));
  let shown = 0;
  const max = +(countArg || 1e9);
  for (const [n, code] of de) {
    const g = texts(code);
    if (!g.length || own.has(n) || codeOv.has(n) || dict.has(g.join('\u0001')) || texts(applyRules(code, rules)).join() !== g.join()) continue;
    console.log(`${n} ${code}`);
    if (++shown >= max) break;
  }
} else if (cmd === 'build' || cmd === 'stats') {
  const { files, dict, perFile, rules } = load();
  let total = 0, done = 0, warnings = 0;
  for (const f of files) {
    const de = readLines(path.join(deBase, f.rel));
    const own = perFile.get(f.rel);
    const codeOv = readLines(path.join(trBase, 'code', f.name + '.txt'));
    const out = [];
    let ft = 0, fd = 0;
    for (const [n, code] of de) {
      const g = texts(code);
      let line = applyRules(code, rules);
      if (g.length) {
        ft++;
        const en = own.get(n) || dict.get(g.join('\u0001'));
        const rg = texts(line);
        if (en && rg.length === en.length && rg.join() === g.join()) { fd++; line = translateLine(line, en); }
        else if (en) { console.log(`WARN ${f.name}:${n} rules changed the texts; table entry ignored`); warnings++; }
        else if (codeOv.has(n) || rg.join() !== g.join()) fd++;
      }
      if (codeOv.has(n)) line = codeOv.get(n);
      out.push(`${n} ${line}`);
      if (cmd === 'build') segments(line).forEach((s, i, all) => {
        if (s.t === 'str' && /\{home\}$/.test(s.v) && visLen(s.v.replace(/\{home\}$/, '')) > 16) {
          console.log(`WARN ${f.name}:${n} message text > 16: ${s.v}`); warnings++;
        }
        // yes/no prompt: gosub970 appends " G" in the 16 column window
        const next = all[i + 1];
        if (s.t === 'str' && next && next.t === 'code' && /^;?:gosub970/.test(next.v) && visLen(s.v) > 14) {
          console.log(`WARN ${f.name}:${n} y/n prompt text > 14: ${s.v}`); warnings++;
        }
      });
    }
    for (const [n, l] of codeOv) if (!de.has(n)) out.push(`${n} ${l}`);
    total += ft; done += fd;
    if (cmd === 'stats') console.log(`${f.rel.padEnd(22)} ${fd}/${ft}`);
    if (cmd === 'build') {
      const text = out.sort((a, b) => parseInt(a) - parseInt(b)).join('\n') + '\n';
      try { textToLines(text); } catch (e) { console.log(`ERROR ${f.rel}: ${e.message}`); process.exitCode = 1; continue; }
      const dst = path.join(root, 'web/data/basic', lang, f.rel);
      fs.mkdirSync(path.dirname(dst), { recursive: true });
      fs.writeFileSync(dst, text);
    }
  }
  console.log(`translated lines: ${done}/${total} (${(100 * done / total).toFixed(1)}%), ${dict.size} unique entries, ${warnings} warnings`);
} else {
  console.log('usage: node tools/i18n.mjs work|build|stats <lang> [file] [n]');
}
