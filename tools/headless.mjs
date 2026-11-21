#!/usr/bin/env node
// Headless runner: node tools/headless.mjs [--frames N] [--keys "seq"] [--png out.png] [--start prog]
// keys: plain chars, \r for return; "@NNN" waits NNN frames before next key.
import fs from 'fs';
import path from 'path';
import zlib from 'zlib';
import { fileURLToPath } from 'url';
import { Machine } from '../web/js/machine.js';
import { Disk } from '../web/js/disk.js';
import { makeCharRom } from '../web/js/charrom.js';

const root = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '..');
const args = process.argv.slice(2);
const opt = (n, d) => { const i = args.indexOf(n); return i >= 0 ? args[i + 1] : d; };

export async function createMachine({ lang = 'de' } = {}) {
  const disk = new Disk();
  const base = path.join(root, 'web/data') + '/';
  await disk.init(base, lang, async (p) => fs.readFileSync(p), async (p) => fs.readFileSync(p, 'utf8'));
  disk.db = null;
  const sidLog = [];
  const m = new Machine({ disk, sid: { write: (r, v, t) => sidLog.push([t, r, v]) }, charRom: makeCharRom(disk) });
  m.sidLog = sidLog;
  return m;
}

export function screenText(m) {
  const b = m.ram[0x288] << 8;
  const rows = [];
  for (let r = 0; r < 25; r++) {
    let s = '';
    for (let c = 0; c < 40; c++) {
      const v = m.ram[b + r * 40 + c] & 0x7f;
      let ch;
      if (v === 0) ch = '@'; else if (v < 27) ch = String.fromCharCode(96 + v); else if (v < 0x40) ch = String.fromCharCode(v);
      else if (v < 0x5b) ch = String.fromCharCode(v);  else ch = '·';
      if (v === 0x1b) ch = 'ä'; if (v === 0x1c) ch = 'ö'; if (v === 0x1d) ch = 'ü';
      s += ch;
    }
    rows.push(s);
  }
  return rows.join('\n');
}

export function writePng(m, file) {
  const w = 320, h = 200, fb = m.vic.fb;
  const raw = Buffer.alloc((w * 3 + 1) * h);
  for (let y = 0; y < h; y++) {
    raw[y * (w * 3 + 1)] = 0;
    for (let x = 0; x < w; x++) {
      const p = fb[y * w + x];
      const o = y * (w * 3 + 1) + 1 + x * 3;
      raw[o] = p & 255; raw[o + 1] = (p >> 8) & 255; raw[o + 2] = (p >> 16) & 255;
    }
  }
  const crcT = []; for (let n = 0; n < 256; n++) { let c = n; for (let k = 0; k < 8; k++) c = c & 1 ? 0xedb88320 ^ (c >>> 1) : c >>> 1; crcT[n] = c >>> 0; }
  const crc = (buf) => { let c = 0xffffffff; for (const b of buf) c = crcT[(c ^ b) & 255] ^ (c >>> 8); return (c ^ 0xffffffff) >>> 0; };
  const chunk = (t, d) => { const len = Buffer.alloc(4); len.writeUInt32BE(d.length); const td = Buffer.concat([Buffer.from(t), d]); const c = Buffer.alloc(4); c.writeUInt32BE(crc(td)); return Buffer.concat([len, td, c]); };
  const ihdr = Buffer.alloc(13); ihdr.writeUInt32BE(w, 0); ihdr.writeUInt32BE(h, 4); ihdr[8] = 8; ihdr[9] = 2;
  fs.writeFileSync(file, Buffer.concat([Buffer.from([137, 80, 78, 71, 13, 10, 26, 10]), chunk('IHDR', ihdr), chunk('IDAT', zlib.deflateSync(raw)), chunk('IEND', Buffer.alloc(0))]));
}

export async function runScript(m, keys, frames, { log = false } = {}) {
  let wait = 0, i = 0;
  for (let f = 0; f < frames; f++) {
    if (wait > 0) wait--;
    else if (i < keys.length) {
      if (keys[i] === '@') { let j = i + 1, n = ''; while (/\d/.test(keys[j])) n += keys[j++]; wait = +n; i = j; }
      else { const ch = keys[i++]; m.pressKey(ch === '\r' ? 13 : ch === '\x1b' ? 0x5f : ch.charCodeAt(0) >= 97 && ch.charCodeAt(0) <= 122 ? ch.charCodeAt(0) - 32 : ch.charCodeAt(0)); wait = 5; }
    }
    m.runFrame();
    if (m.halted) { console.log('HALTED', m.halted.message); break; }
  }
}

if (process.argv[1] && process.argv[1].endsWith('headless.mjs')) {
  const m = await createMachine({ lang: opt('--lang', 'de') });
  const loads = [];
  m.on('load', (n) => loads.push(m.frameCount + ':' + n));
  m.boot(opt('--start', 'ddd.dbas'));
  const t0 = Date.now();
  await runScript(m, (opt('--keys', '')).replace(/\\r/g, '\r'), +opt('--frames', 500));
  console.log(screenText(m));
  console.log('loads:', loads.join(' '));
  console.log('frames', m.frameCount, 'ms', Date.now() - t0, 'state', m.basic.state, m.mode, 'line', m.basic.lines[m.basic.li] && m.basic.lines[m.basic.li].num);
  if (opt('--png')) writePng(m, opt('--png'));
}
