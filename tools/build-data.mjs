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
fs.writeFileSync(path.join(root, 'web/data/manifest.json'), JSON.stringify(manifest, null, 1) + '\n');
console.log('ok', JSON.stringify(manifest));
