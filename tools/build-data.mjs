#!/usr/bin/env node
// Extracts the game files from c64/DDD{1,2,3} into web/data:
//  - BASIC programs  -> web/data/basic/de/disk<N>/<name>.bas  (editable text, see web/js/basictext.js)
//  - everything else -> web/data/bin/disk<N>/<name>.prg       (raw PRG incl. load address)
//  - web/data/manifest.json
// Existing .bas files are only overwritten with --force (they may contain edits/translations).
import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';
import { prgToText, textToLines, parsePrg } from '../web/js/basictext.js';
import { pngToKoala } from './koala.mjs';

const root = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '..');
const force = process.argv.includes('--force');
const BASIC = /^ddd\.(twn.|konj|prep|boot|dbas)$/;
const SKIP = /^(\.|C\.|\s|version|dunkle dimension|ddd\.sav)/;
const manifest = { disks: {}, basic: {} };

for (const d of [1, 2, 3]) {
  const dir = path.join(root, 'c64', 'DDD' + d);
  manifest.disks[d] = [];
  manifest.basic[d] = [];
  for (const name of fs.readdirSync(dir).sort()) {
    if (SKIP.test(name) || /\.(txt|asm|png)$/.test(name)) continue;
    const data = fs.readFileSync(path.join(dir, name));
    if (BASIC.test(name)) {
      const out = path.join(root, 'web/data/basic/de', 'disk' + d, name + '.bas');
      fs.mkdirSync(path.dirname(out), { recursive: true });
      const text = prgToText([...data]);
      // verify round trip
      const orig = parsePrg([...data]).lines;
      const back = textToLines(text);
      if (orig.length !== back.length || orig.some((l, i) => l.num !== back[i].num || l.code.join() !== back[i].code.join())) throw new Error('round trip failed: ' + name);
      if (force || !fs.existsSync(out)) fs.writeFileSync(out, text);
      manifest.basic[d].push(name);
    } else {
      const out = path.join(root, 'web/data/bin', 'disk' + d, name + '.prg');
      fs.mkdirSync(path.dirname(out), { recursive: true });
      fs.writeFileSync(out, data);
      manifest.disks[d].push(name);
    }
  }
}
// Replacement files per edition and language (manifest.art[edition][lang] = [names]):
//  - pictures (tools/title_art.py), most specific first: art/<edition>/<lang>/, art/<edition>/ (enhanced only),
//    art/<lang>/ (translated texts, both editions)
//  - title scroller text: i18n/<lang>/ddd.dtxt.txt (upper case, line breaks become spaces, Ä Ö Ü use the
//    font's umlaut glyphs; screen codes at $4000 ending with $60)
// The regular German edition uses the original files unchanged.
const artDir = path.join(root, 'art'), i18nDir = path.join(root, 'i18n');
const subdirs = (d) => (fs.existsSync(d) ? fs.readdirSync(d).filter((f) => fs.statSync(path.join(d, f)).isDirectory()) : []);
const langs = [...new Set(['de', 'en', ...subdirs(i18nDir), ...subdirs(artDir).filter((d) => d !== 'enhanced')])];
const pngs = (d) => (fs.existsSync(d) ? fs.readdirSync(d).filter((f) => f.endsWith('.png')).map((f) => f.slice(0, -4)) : []);

function scrollerText(src) {
  const text = fs.readFileSync(src, 'utf8').replace(/\s*\n\s*/g, ' ').trim().toUpperCase();
  const bytes = [0x00, 0x40];
  for (const ch of text) {
    const o = ch.charCodeAt(0);
    if (o >= 65 && o <= 90) bytes.push(o - 64);
    else if ('ÄÖÜ'.includes(ch)) bytes.push(27 + 'ÄÖÜ'.indexOf(ch));
    else if (o >= 32 && o <= 63) bytes.push(o);
    else throw new Error(`${src}: character '${ch}' is not in the scroller font`);
  }
  bytes.push(0x60);
  if (bytes.length > 0x2000) throw new Error(`${src}: text too long for $4000-$5FFF`);
  return Uint8Array.from(bytes);
}

manifest.art = {};
for (const edition of ['regular', 'enhanced']) {
  manifest.art[edition] = {};
  for (const lang of langs) {
    const dirs = edition === 'enhanced' ? [path.join(artDir, 'enhanced', lang), path.join(artDir, 'enhanced')] : [];
    dirs.push(path.join(artDir, lang));
    const files = new Map();
    for (const d of [...dirs].reverse()) for (const n of pngs(d)) files.set(n, path.join(d, n + '.png'));
    const out = path.join(root, 'web/data/bin', edition, lang);
    const names = [];
    for (const [name, src] of files) {
      const { prg, errors } = pngToKoala(fs.readFileSync(src));
      if (errors.length) throw new Error(`${src}: ${errors.slice(0, 3).join('; ')}`);
      fs.mkdirSync(out, { recursive: true });
      fs.writeFileSync(path.join(out, name + '.prg'), prg);
      names.push(name);
    }
    const txt = path.join(i18nDir, lang, 'ddd.dtxt.txt');
    if (fs.existsSync(txt)) {
      fs.mkdirSync(out, { recursive: true });
      fs.writeFileSync(path.join(out, 'ddd.dtxt.prg'), scrollerText(txt));
      names.push('ddd.dtxt');
    }
    if (names.length) manifest.art[edition][lang] = names.sort();
  }
}
fs.writeFileSync(path.join(root, 'web/data/manifest.json'), JSON.stringify(manifest, null, 1) + '\n');
console.log('ok', JSON.stringify(manifest));
