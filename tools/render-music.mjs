#!/usr/bin/env node
// Renders the SID output of the running game to a WAV file (offline, using the same
// AudioWorklet SID code as the web app). Example (title tunes):
//   node tools/render-music.mjs out.wav 1100 '@400 @300 '
import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';
import { createMachine, runScript } from './headless.mjs';

const root = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '..');
const [out = 'out.wav', frames = '1000', keys = ''] = process.argv.slice(2);
const SR = 44100;

// minimal AudioWorklet shim
let Proc;
globalThis.sampleRate = SR;
globalThis.AudioWorkletProcessor = class { constructor() { this.port = { onmessage: null }; } };
globalThis.registerProcessor = (n, c) => { Proc = c; };
await import(path.join(root, 'web/js/sid-worklet.js'));

const m = await createMachine();
m.boot();
const proc = new Proc();
const chunks = [];
let lastLog = 0;
const origFrame = m.runFrame.bind(m);
m.runFrame = () => {
  origFrame();
  const writes = m.sidLog.slice(lastLog); lastLog = m.sidLog.length;
  proc.port.onmessage({ data: { type: 'writes', writes, now: m.totalCycles } });
  const n = Math.round(SR / 50.125);
  const buf = new Float32Array(n);
  proc.process([], [[buf]]);
  chunks.push(buf);
};
await runScript(m, keys, +frames);
const total = chunks.reduce((a, c) => a + c.length, 0);
const pcm = Buffer.alloc(44 + total * 2);
pcm.write('RIFF', 0); pcm.writeUInt32LE(36 + total * 2, 4); pcm.write('WAVEfmt ', 8);
pcm.writeUInt32LE(16, 16); pcm.writeUInt16LE(1, 20); pcm.writeUInt16LE(1, 22); pcm.writeUInt32LE(SR, 24);
pcm.writeUInt32LE(SR * 2, 28); pcm.writeUInt16LE(2, 32); pcm.writeUInt16LE(16, 34); pcm.write('data', 36); pcm.writeUInt32LE(total * 2, 40);
let o = 44, sec = [], acc = 0, cnt = 0;
for (const c of chunks) for (const s of c) {
  pcm.writeInt16LE(Math.max(-32768, Math.min(32767, Math.round(s * 32767))), o); o += 2;
  acc += s * s; if (++cnt === SR) { sec.push(Math.sqrt(acc / cnt).toFixed(3)); acc = 0; cnt = 0; }
}
fs.writeFileSync(out, pcm);
console.log('wrote', out, (total / SR).toFixed(1) + 's', 'RMS/s:', sec.join(' '), 'sid writes:', m.sidLog.length);
