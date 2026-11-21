#!/usr/bin/env node
// Fuzz test: create a character, then enter every area via the loader and press random keys.
import { createMachine, runScript, screenText, writePng } from './headless.mjs';

const frames = +(process.argv[2] || 3000);
const only = process.argv[3] ? process.argv[3].split(',').map(Number) : null;
const KEYS = [0x91, 0x11, 0x9d, 0x1d, 0x91, 0x11, 0x9d, 0x1d, 0x20, 0x0d, ...'abcdefghijklmnopqrstuvwxyz0123456789'.split('').map((c) => c.toUpperCase().charCodeAt(0)), 0x5f];

const LANG = process.env.DDD_LANG || 'de';
const EDITION = process.env.DDD_EDITION || 'regular';
const base = await createMachine({ lang: LANG, edition: EDITION });
base.boot();
await runScript(base, LANG === 'en' ? '@400 @300 @200 @1500n@100hero\r@100y@200s@300e@400a@200y' : '@400 @300 @200 @1500n@100held\r@100j@200s@300l@400a@200j', 4200);
const snap = base.ram.slice();
const color = base.colorRam.slice();
console.log('base at line', base.basic.lines[base.basic.li].num);
let seed = 1;
const rnd = (n) => { seed = (seed * 1103515245 + 12345) & 0x7fffffff; return seed % n; };

for (let n = 0; n <= 17; n++) {
  if (only && !only.includes(n)) continue;
  const m = await createMachine({ lang: LANG, edition: EDITION });
  m.ram.set(snap); m.colorRam.set(color);
  m.ram[0xc04e - 0] = 250; // lots of hit points so we survive longer
  m.ram[2] = n;
  const errors = [];
  const loads = [];
  m.on('load', (f) => loads.push(f));
  // loading a save slot that does not exist from the main menu (ddd.prep line 136) ends in
  // ?FILE NOT FOUND on purpose: the program put "rU" into the keyboard buffer and restarts itself
  const expected = (c, w) => c === 'file not found' && w === ' in 136' && m.basic.lines.some((l) => l.num === 2000);
  m.onError = (c, w) => { if (!expected(c, w)) errors.push(c + w); };
  m.basic.m.onError = m.onError;
  const konj = m.disk.find('ddd.konj', n);
  m.basic.setProgram(konj.basic());
  m.basic.run();
  for (let f = 0; f < frames; f++) {
    if (f > 300 && f % 7 === 0 && m.ram[0xc6] === 0) m.pressKey(KEYS[rnd(KEYS.length)]);
    if (m.ram[0xc04e] < 50) m.ram[0xc04e] = 200; // keep alive
    m.runFrame();
    if (m.halted) { errors.push('HALT ' + m.halted.message); break; }
    if (m.basic.state === 'idle' && errors.length) break;
  }
  console.log(`area ${n}: loads=${[...new Set(loads)].join(',')} errors=${JSON.stringify(errors.slice(0, 5))} state=${m.basic.state} line=${m.basic.lines[m.basic.li] && m.basic.lines[m.basic.li].num}`);
  if (errors.length) console.log(screenText(m));
  if (process.env.FUZZ_PNG) writePng(m, `${process.env.FUZZ_PNG}/area${n}.png`);
}
