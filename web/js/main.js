import { Machine, CYCLES_PER_FRAME } from './machine.js';
import { Disk } from './disk.js';
import { SidAudio } from './sid.js';
import { makeCharRom } from './charrom.js';
import { PALETTE } from './vic.js';

const FPS = 985248 / CYCLES_PER_FRAME; // ~50.12 Hz (PAL)

const params = new URLSearchParams(location.search);
let storedLang = null;
try { storedLang = localStorage.getItem('ddd-lang'); } catch (e) { /* storage unavailable */ }
const lang = params.get('lang') || storedLang || 'en';
try { if (params.get('lang')) localStorage.setItem('ddd-lang', lang); } catch (e) { /* ignore */ }
document.documentElement.lang = lang;
// edition: 'regular' = original game and graphics, 'enhanced' = new graphics (?edition=..., remembered)
let storedEdition = null;
try { storedEdition = localStorage.getItem('ddd-edition'); } catch (e) { /* storage unavailable */ }
const edition = ['regular', 'enhanced'].includes(params.get('edition')) ? params.get('edition')
  : (storedEdition === 'enhanced' ? 'enhanced' : 'regular');
try { if (params.get('edition')) localStorage.setItem('ddd-edition', edition); } catch (e) { /* ignore */ }
document.documentElement.dataset.edition = edition;
const MSG = {
  de: { loading: 'Lade Spieldaten…', ready: 'Klicken oder eine Taste drücken, um zu starten', halted: 'Programm angehalten: ', saved: 'Gespeichert: ', loadError: 'Fehler beim Laden: ', turboOn: 'Turbo AN', turboOff: 'Turbo AUS (Originalgeschwindigkeit)', soundOff: 'Ton aus', soundOn: 'Ton an' },
  en: { loading: 'Loading game data…', ready: 'Click or press a key to start', halted: 'Program halted: ', saved: 'Saved: ', loadError: 'Error while loading: ', turboOn: 'Turbo ON', turboOff: 'Turbo OFF (original speed)', soundOff: 'Sound off', soundOn: 'Sound on' },
};
const T = MSG[lang] || MSG.en;

const canvas = document.getElementById('screen');
const ctx2d = canvas.getContext('2d');
const overlay = document.getElementById('overlay');
const help = document.getElementById('help');
const toast = document.getElementById('toast');
const status = document.getElementById('status');

let machine, sid, image;
let running = false, turbo = false, paused = false;
let last = 0, acc = 0;

function showToast(msg) {
  toast.textContent = msg;
  toast.classList.add('show');
  clearTimeout(showToast.t);
  showToast.t = setTimeout(() => toast.classList.remove('show'), 1800);
}

function layout() {
  // 320x200 picture scaled to fill the window with a 10% margin on every side
  const w = window.innerWidth * 0.8, h = window.innerHeight * 0.8;
  const scale = Math.min(w / 320, h / 200);
  canvas.style.width = Math.floor(320 * scale) + 'px';
  canvas.style.height = Math.floor(200 * scale) + 'px';
}

async function init() {
  status.textContent = T.loading;
  const disk = new Disk();
  await disk.init(new URL('../data/', import.meta.url).href, lang,
    async (p) => { const r = await fetch(p); if (!r.ok) throw new Error(p); return r.arrayBuffer(); },
    async (p) => { const r = await fetch(p); if (!r.ok) throw new Error(p); return r.text(); },
    { edition });
  sid = new SidAudio();
  machine = new Machine({ disk, sid, charRom: makeCharRom(disk) });
  machine.on('halt', (e) => { status.textContent = T.halted + e.message; overlay.classList.remove('hidden'); });
  machine.on('save', (name) => showToast(T.saved + name + ' (IndexedDB)'));
  image = new ImageData(new Uint8ClampedArray(machine.vic.fb.buffer), 320, 200);
  window.ddd = machine; // debugging aid
  status.textContent = T.ready;
  document.getElementById('start').disabled = false;
}

async function start() {
  if (running || !machine) return;
  running = true;
  overlay.classList.add('hidden');
  try { await sid.start(); } catch (e) { console.warn('audio failed', e); }
  if (params.get('nofs') === null && document.documentElement.requestFullscreen && !document.fullscreenElement) {
    document.documentElement.requestFullscreen().catch(() => {});
  }
  machine.boot();
  last = performance.now();
  setInterval(emulate, 8); // emulation clock (independent of display refresh)
  requestAnimationFrame(present);
}

function emulate() {
  const now = performance.now();
  let dt = (now - last) / 1000;
  last = now;
  if (paused || machine.halted) return;
  if (dt > 0.25) dt = 0.25; // tab was in background
  if (turbo) {
    const t0 = performance.now();
    let n = 0;
    while (performance.now() - t0 < 6 && n < 60) { machine.runFrame(); n++; }
    acc = 0;
  } else {
    acc += dt * FPS;
    let n = 0;
    while (acc >= 1 && n < 15) { machine.runFrame(); acc -= 1; n++; }
    if (n === 15) acc = 0;
  }
}

function present() {
  requestAnimationFrame(present);
  ctx2d.putImageData(image, 0, 0);
  const [r, g, b] = PALETTE[machine.vic.regs[0x20] & 15];
  const bg = `rgb(${r},${g},${b})`;
  if (document.body.style.backgroundColor !== bg) document.body.style.backgroundColor = bg;
}

// ------------------------------------------------------------- keyboard
const SPECIAL = {
  Enter: 0x0d, NumpadEnter: 0x0d, Backspace: 0x14, Delete: 0x14, Insert: 0x94, Home: 0x13,
  ArrowUp: 0x91, ArrowDown: 0x11, ArrowLeft: 0x9d, ArrowRight: 0x1d, ' ': 0x20,
  'ä': 0x5b, 'ö': 0x5c, 'ü': 0x5d, 'Ä': 0x5b, 'Ö': 0x5c, 'Ü': 0x5d, '[': 0x5b, ']': 0x5d, '£': 0x5c,
  '^': 0x5f, '_': 0x5f, '`': 0x5f,
};

function toPetscii(e) {
  if (e.code === 'Backquote' || e.code === 'IntlBackslash') return 0x5f; // C64 "←" key position
  if (e.key in SPECIAL) {
    const v = SPECIAL[e.key];
    if (e.key === 'Home' && e.shiftKey) return 0x93; // CLR
    return v;
  }
  if (e.key.length !== 1) return -1;
  const c = e.key.charCodeAt(0);
  if (c >= 0x61 && c <= 0x7a) return c - 0x20; // a-z
  if (c >= 0x41 && c <= 0x5a) return c + 0x80; // A-Z (shifted)
  if (c >= 0x20 && c <= 0x40) return c;
  return -1;
}

// kernal shift flag ($028D), e.g. holding SHIFT freezes the title scroller
const setShift = (e) => { if (machine) machine.ram[0x028d] = (e.shiftKey ? 1 : 0) | (e.ctrlKey ? 4 : 0); };
window.addEventListener('keyup', setShift);

window.addEventListener('keydown', (e) => {
  setShift(e);
  if (!running) {
    if (machine && !e.repeat) { e.preventDefault(); start(); }
    return;
  }
  // application keys
  if (e.key === 'F1' || (e.key === '?' && e.ctrlKey)) { e.preventDefault(); help.classList.toggle('hidden'); paused = !help.classList.contains('hidden'); return; }
  if (e.key === 'F8') { e.preventDefault(); turbo = !turbo; sid.setEnabled(!turbo, machine.sidRegs); showToast(turbo ? T.turboOn : T.turboOff); return; }
  if (e.key === 'F9') { e.preventDefault(); sid.setMuted(!sid.muted); showToast(sid.muted ? T.soundOff : T.soundOn); return; }
  if (e.key === 'F10') { e.preventDefault(); toggleFullscreen(); return; }
  if (e.key === 'Escape' && !help.classList.contains('hidden')) { help.classList.add('hidden'); paused = false; return; }
  if (e.ctrlKey || e.metaKey || e.altKey) return;
  const k = toPetscii(e);
  if (k >= 0) { e.preventDefault(); machine.pressKey(k); }
});

function toggleFullscreen() {
  if (document.fullscreenElement) document.exitFullscreen();
  else document.documentElement.requestFullscreen().catch(() => {});
}

canvas.addEventListener('dblclick', toggleFullscreen);
document.getElementById('start').addEventListener('click', start);
document.getElementById('help-close').addEventListener('click', () => { help.classList.add('hidden'); paused = false; });
window.addEventListener('resize', layout);
document.addEventListener('visibilitychange', () => { last = performance.now(); acc = 0; });
layout();
init().catch((e) => { status.textContent = T.loadError + e.message; console.error(e); });
