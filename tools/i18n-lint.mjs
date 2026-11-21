#!/usr/bin/env node
// Checks a translation for leftovers and keyword problems:
//   node tools/i18n-lint.mjs en
//  - German words / umlauts remaining in string literals
//  - conversation keywords (n$="...") longer than 4 letters, or not mentioned anywhere in the dialogue
import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';
import { segments } from './i18n.mjs';

const root = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '..');
const lang = process.argv[2] || 'en';
const base = path.join(root, 'web/data/basic', lang);
const GERMAN = /\b(der|das|und|ich|nicht|ist|du|dich|dir|mit|ein|eine|einen|zu|von|sich|auch|hier|wird|bist|hast|kann|noch|nur|aber|oder|wenn|mein|dein|sein|uns)\b|[äöüß]/;
const ALLOW = /yz|äö|üssss|ssss\^|\{rvon\}ü|trofnih|hinfort|üselgür|öd'|madraksan|grüss gott|fei guat|saupreissen|ja mei|cogito|sicaria|draconem|adieu|cherie|schw|lederhosen|schweinshaxn|der wastl/;
let problems = 0;
const allText = [];
const keywords = [];
for (const d of fs.readdirSync(base).sort()) for (const f of fs.readdirSync(path.join(base, d)).sort()) {
  for (const raw of fs.readFileSync(path.join(base, d, f), 'utf8').split('\n')) {
    const m = /^(\d+) (.*)$/.exec(raw); if (!m) continue;
    const segs = segments(m[2]);
    segs.forEach((s, i) => {
      if (s.t === 'code') return;
      const txt = s.v.replace(/\{[^}]*\}/g, ' ');
      const prev = segs[i - 1];
      if (prev && prev.t === 'code' && /n\$=$|n\$<>$|mid\$\(n\$,2\)=$|orn\$=$/.test(prev.v)) { keywords.push({ f, n: m[1], k: s.v }); return; }
      allText.push(txt);
      if (/[a-z]{2}/.test(txt) && GERMAN.test(txt) && !ALLOW.test(txt)) { console.log(`GERMAN? ${f}:${m[1]}  ${s.v}`); problems++; }
    });
  }
}
const corpus = allText.join(' ').toLowerCase();
for (const { f, n, k } of keywords) {
  if (k.length > 4 && k !== 'balan' && k !== 'trofnih' && k !== 'hinfort') { console.log(`KEYWORD too long ${f}:${n} "${k}"`); problems++; }
  if (!new RegExp('\\b' + k.replace(/[^a-z]/g, '')).test(corpus)) { console.log(`KEYWORD never mentioned ${f}:${n} "${k}"`); }
}
console.log(problems + ' problems');
