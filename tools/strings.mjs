#!/usr/bin/env node
// Translation helper for the BASIC sources in web/data/basic/<lang>/.
//
//   node tools/strings.mjs list [lang]          list every string literal (file:line, length, text)
//   node tools/strings.mjs export [lang] > f.tsv tab separated: file, line, index, text  (for spreadsheets)
//   node tools/strings.mjs check <lang>          validate a translation against the German original
//
// "check" verifies that every file tokenizes, that the program structure (line numbers and
// everything outside string literals) is unchanged, and warns about texts that will not fit:
// strings ending in {home} are printed into the 16 column message window on the right.
import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';
import { textToLines, textToPetscii } from '../web/js/basictext.js';

const root = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '..');
const [cmd = 'list', lang = 'de'] = process.argv.slice(2);
const base = (l) => path.join(root, 'web/data/basic', l);

function files(l) {
  const out = [];
  if (!fs.existsSync(base(l))) return out;
  for (const d of fs.readdirSync(base(l)).sort()) for (const f of fs.readdirSync(path.join(base(l), d)).sort()) if (f.endsWith('.bas')) out.push(path.join(d, f));
  return out;
}

// split a source line into code skeleton and string literals
function splitLine(code) {
  const strings = [];
  let skel = '', i = 0;
  while (i < code.length) {
    if (code[i] === '"') {
      let j = i + 1;
      while (j < code.length && code[j] !== '"') j++;
      strings.push(code.slice(i + 1, j));
      skel += '"' + (strings.length - 1) + '"';
      i = j + 1;
      continue;
    }
    // REM and DATA contents are free text as well
    skel += code[i++];
  }
  return { skel, strings };
}

function parse(file) {
  const text = fs.readFileSync(file, 'utf8');
  const lines = new Map();
  for (const raw of text.split(/\r?\n/)) {
    const m = /^\s*(\d+) ?(.*)$/.exec(raw);
    if (m) lines.set(+m[1], m[2]);
  }
  return { text, lines };
}

// visible length of a string in characters on screen (control codes take no space)
function visibleLength(s) {
  return textToPetscii(s).filter((b) => (b >= 0x20 && b < 0x80) || (b >= 0xa0)).length;
}

if (cmd === 'list' || cmd === 'export') {
  for (const f of files(lang)) {
    const { lines } = parse(path.join(base(lang), f));
    for (const [n, code] of lines) {
      splitLine(code).strings.forEach((s, i) => {
        if (!/[a-zäöü]{2}/i.test(s.replace(/\{[^}]*\}/g, ""))) return;
        if (cmd === 'export') console.log([f, n, i, s].join('\t'));
        else console.log(`${f}:${n}#${i} (${visibleLength(s)}) ${s}`);
      });
    }
  }
} else if (cmd === 'check') {
  let errors = 0, warnings = 0;
  for (const f of files('de')) {
    const tf = path.join(base(lang), f);
    if (!fs.existsSync(tf)) { console.log(`missing ${f} (German original will be used)`); continue; }
    const de = parse(path.join(base('de'), f)), tr = parse(tf);
    try { textToLines(tr.text); } catch (e) { console.log(`ERROR ${f}: ${e.message}`); errors++; continue; }
    for (const [n, code] of de.lines) {
      if (!tr.lines.has(n)) { console.log(`ERROR ${f}:${n} line missing`); errors++; continue; }
      const a = splitLine(code), b = splitLine(tr.lines.get(n));
      if (a.skel !== b.skel && !/^(rem|data)/.test(code)) {
        console.log(`WARN  ${f}:${n} code outside strings changed\n      de: ${a.skel}\n      ${lang}: ${b.skel}`); warnings++;
      }
      b.strings.forEach((s, i) => {
        if (s.endsWith('{home}')) {
          const len = visibleLength(s.replace(/\{home\}$/, ''));
          if (len > 16) { console.log(`WARN  ${f}:${n}#${i} message window text is ${len} > 16 chars: ${s}`); warnings++; }
        }
      });
    }
    for (const n of tr.lines.keys()) if (!de.lines.has(n)) { console.log(`WARN  ${f}:${n} extra line`); warnings++; }
  }
  console.log(`${errors} errors, ${warnings} warnings`);
  process.exit(errors ? 1 : 0);
}
