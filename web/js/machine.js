// "Virtual C64": RAM, I/O, kernal screen editor & traps, scheduling of the
// BASIC interpreter, 6502 core, IRQs, VIC rendering and SID register writes.
// No Commodore ROM code is used: the kernal/BASIC behaviour the game relies on
// is reimplemented in JavaScript.

import { CPU6502 } from './cpu6502.js';
import { VIC, RASTER_LINES, CYCLES_PER_LINE } from './vic.js';
import { Basic } from './basic.js';
import { crunch, textToPetscii } from './basictext.js';

export const CYCLES_PER_FRAME = RASTER_LINES * CYCLES_PER_LINE; // PAL 19656
export const CPU_HZ = 985248;

const TRAP_SYS_RETURN = 0x0000;
const TRAP_IRQ_RETURN = 0x0001;

export function petsciiToScreen(c) {
  if (c < 0x20) return c + 0x80; // (only used for quote mode, reversed)
  if (c < 0x40) return c;
  if (c < 0x60) return c - 0x40;
  if (c < 0x80) return c - 0x20;
  if (c < 0xa0) return (c - 0x40) | 0x80;
  if (c < 0xc0) return c - 0x40;
  if (c < 0xff) return c - 0x80;
  return 0x5e;
}

function screenToPetscii(s) {
  s &= 0x7f;
  if (s < 0x20) return s + 0x40;
  if (s < 0x40) return s;
  if (s < 0x60) return s + 0x80;
  return s + 0x40;
}

const COLOR_CODES = { 0x90: 0, 0x05: 1, 0x1c: 2, 0x9f: 3, 0x9c: 4, 0x1e: 5, 0x1f: 6, 0x9e: 7, 0x81: 8, 0x95: 9, 0x96: 10, 0x97: 11, 0x98: 12, 0x99: 13, 0x9a: 14, 0x9b: 15 };

export class Machine {
  constructor({ disk, sid, charRom }) {
    this.ram = new Uint8Array(65536);
    this.colorRam = new Uint8Array(1024);
    this.charRom = charRom || new Uint8Array(4096);
    this.disk = disk;
    this.sid = sid; // { write(reg, val, cycle) }
    this.sidRegs = new Uint8Array(32);
    this.vic = new VIC(this);
    this.cpu = new CPU6502(this);
    this.basic = new Basic(this);
    this.totalCycles = 0;
    this.frameCycle = 0;
    this.renderedLine = 0;
    this.mode = 'basic'; // basic | cpu
    this.cpuReason = null; // 'sys' | 'irq'
    this.keyQueue = [];
    this.files = new Map();
    this.st = 0;
    this.halted = null;
    this.frameCount = 0;
    this.listeners = {};
    // CIA1
    this.cia1 = { latchA: 0x4025, counterA: 0x4025, icr: 0, mask: 0x01, cra: 0x11, latchB: 0xffff, counterB: 0xffff, crb: 0 };
    this.cia2 = { pra: 0x97, ddra: 0x3f };
    this.directKeys = false;
    this.blink = { on: false, count: 0, under: 0x20, color: 14 };
    this.reset();
  }

  on(ev, fn) { (this.listeners[ev] = this.listeners[ev] || []).push(fn); }
  emit(ev, ...a) { (this.listeners[ev] || []).forEach((f) => f(...a)); }

  reset() {
    const r = this.ram;
    r.fill(0);
    r[0] = 0x2f; r[1] = 0x37;
    r[0x2b] = 0x01; r[0x2c] = 0x08; // BASIC start
    r[0x37] = 0x00; r[0x38] = 0xa0; // top of BASIC
    r[0x0286] = 14; // text colour
    r[0x0288] = 4; // screen page
    r[0x0289] = 10; // keyboard buffer size
    r[0x028a] = 0; // key repeat
    r[0x0314] = 0x31; r[0x0315] = 0xea;
    r[0x0316] = 0x66; r[0x0317] = 0xfe;
    r[0x0318] = 0x47; r[0x0319] = 0xfe;
    r[0xfffe] = 0x48; r[0xffff] = 0xff;
    r[0xfffa] = 0x43; r[0xfffb] = 0xfe;
    this.scr = { row: 0, col: 0, rvs: false, quote: false, insert: 0, link: new Array(25).fill(true) };
    this.vic.regs[0x20] = 14; this.vic.regs[0x21] = 6; this.vic.regs[0x18] = 0x15; this.vic.regs[0x11] = 0x1b;
    this.clearScreen();
  }

  // ------------------------------------------------------------------ bus
  ioVisible() { const p = this.ram[1] & 7; return (p & 3) !== 0 && (p & 4) !== 0; }

  read(a) {
    if (a >= 0xd000 && a < 0xe000 && this.ioVisible()) return this.ioRead(a);
    if (a === 1) return this.ram[1];
    return this.ram[a];
  }

  write(a, v) {
    if (a >= 0xd000 && a < 0xe000 && this.ioVisible()) { this.ioWrite(a, v); return; }
    this.ram[a] = v;
  }

  peek(a) { return this.read(a); }
  poke(a, v) { this.write(a, v); }

  ioRead(a) {
    if (a < 0xd400) return this.vic.read(a);
    if (a < 0xd800) {
      const r = a & 0x1f;
      if (r === 0x1b) return (Math.random() * 256) | 0; // osc 3 (random)
      if (r === 0x1c) return 0;
      if (r === 0x19 || r === 0x1a) return 0xff;
      return 0;
    }
    if (a < 0xdc00) return this.colorRam[a & 0x3ff] | 0xf0;
    if (a < 0xdd00) return this.cia1Read(a & 0x0f);
    if (a < 0xde00) {
      const r = a & 0x0f;
      if (r === 0) return this.cia2.pra;
      if (r === 2) return this.cia2.ddra;
      return 0xff;
    }
    return 0xff;
  }

  ioWrite(a, v) {
    if (a < 0xd400) { this.vic.write(a, v); return; }
    if (a < 0xd800) {
      const r = a & 0x1f;
      if (r < 0x19) { this.sidRegs[r] = v; this.sid && this.sid.write(r, v, this.totalCycles); }
      return;
    }
    if (a < 0xdc00) { this.colorRam[a & 0x3ff] = v & 15; return; }
    if (a < 0xdd00) { this.cia1Write(a & 0x0f, v); return; }
    if (a < 0xde00) {
      const r = a & 0x0f;
      if (r === 0) this.cia2.pra = v;
      if (r === 2) this.cia2.ddra = v;
    }
  }

  cia2PortA() { return this.cia2.pra | (~this.cia2.ddra & 0xff); }

  cia1Read(r) {
    const c = this.cia1;
    switch (r) {
      case 0: return 0xff;
      case 1: return this.keyMatrixRead();
      case 4: return c.counterA & 0xff;
      case 5: return c.counterA >> 8;
      case 6: return c.counterB & 0xff;
      case 7: return c.counterB >> 8;
      case 0x0d: { const v = c.icr | (c.icr & c.mask ? 0x80 : 0); c.icr = 0; return v; }
      case 0x0e: return c.cra;
      case 0x0f: return c.crb;
    }
    return 0;
  }

  cia1Write(r, v) {
    const c = this.cia1;
    switch (r) {
      case 4: c.latchA = (c.latchA & 0xff00) | v; break;
      case 5: c.latchA = (c.latchA & 0xff) | (v << 8); if (!(c.cra & 1)) c.counterA = c.latchA; break;
      case 6: c.latchB = (c.latchB & 0xff00) | v; break;
      case 7: c.latchB = (c.latchB & 0xff) | (v << 8); break;
      case 0x0d: if (v & 0x80) c.mask |= v & 0x1f; else c.mask &= ~v & 0x1f; break;
      case 0x0e: c.cra = v & 0xef; if (v & 0x10) c.counterA = c.latchA; break;
      case 0x0f: c.crb = v & 0xef; break;
    }
  }

  keyMatrixRead() { return 0xff; }

  rasterLine() { return Math.min(RASTER_LINES - 1, Math.floor(this.frameCycle / CYCLES_PER_LINE)); }

  // advance timers; returns true if an IRQ is pending
  tick(cycles) {
    this.totalCycles += cycles;
    this.frameCycle += cycles;
    const c = this.cia1;
    if (c.cra & 1) {
      c.counterA -= cycles;
      while (c.counterA < 0) { c.counterA += (c.latchA || 0xffff) + 1; c.icr |= 1; }
    }
    // raster compare
    const line = this.rasterLine();
    while (this.renderedLine <= line && this.renderedLine < RASTER_LINES) {
      this.vic.renderLine(this.renderedLine);
      if (this.renderedLine === this.vic.rasterCompare()) this.vic.irqStatus |= 1;
      this.renderedLine++;
    }
  }

  irqPending() {
    return ((this.cia1.icr & this.cia1.mask) !== 0) || ((this.vic.irqStatus & this.vic.regs[0x1a] & 0x0f) !== 0);
  }

  // ------------------------------------------------------------------ kernal traps
  trap(pc, cpu) {
    switch (pc) {
      case TRAP_SYS_RETURN:
        if (this.cpuReason === 'sys') { this.cpuDone(); return true; }
        return false;
      case TRAP_IRQ_RETURN:
        if (this.cpuReason === 'irq') { this.cpuDone(); return true; }
        return false;
      case 0xff48: { // hardware IRQ entry
        cpu.push(cpu.a); cpu.push(cpu.x); cpu.push(cpu.y);
        cpu.pc = this.ram[0x0314] | (this.ram[0x0315] << 8);
        cpu.cycles += 29;
        return true;
      }
      case 0xea31: case 0xea7e: // kernal IRQ handler
        if (pc === 0xea31) this.kernalIrq();
        this.cia1.icr = 0;
        // fall through to EA81
      case 0xea81: case 0xfebc: {
        cpu.y = cpu.pop(); cpu.x = cpu.pop(); cpu.a = cpu.pop();
        cpu.p = (cpu.pop() | 0x20) & ~0x10;
        const l = cpu.pop(), h = cpu.pop();
        cpu.pc = (h << 8) | l;
        cpu.cycles += 30;
        return true;
      }
      case 0xf1ca: case 0xffd2: case 0xe716:
        this.chrout(cpu.a);
        cpu.p &= ~1;
        this.rts(cpu, 120);
        return true;
      case 0xffe4: case 0xf13e: { const k = this.getKey(); cpu.a = k < 0 ? 0 : k; cpu.setNZ(cpu.a); cpu.p &= ~1; this.rts(cpu, 40); return true; }
      case 0xe544: this.chrout(0x93); this.rts(cpu, 2000); return true;
      case 0xe566: this.chrout(0x13); this.rts(cpu, 40); return true;
      case 0xfda3: case 0xff84: // IOINIT
        this.cia1.latchA = 0x4025; this.cia1.cra = 0x11; this.cia1.mask = 0x01;
        this.rts(cpu, 200); return true;
      case 0xe56c: // set cursor from $D6/$D3
        this.scr.row = this.ram[0xd6] % 25; this.scr.col = this.ram[0xd3] % 40; this.syncCursorZp(); this.rts(cpu, 60); return true;
      case 0xfff0: // PLOT
        if (cpu.p & 1) { cpu.x = this.scr.row; cpu.y = this.scr.col; } else { this.scr.row = cpu.x % 25; this.scr.col = cpu.y % 40; this.syncCursorZp(); }
        this.rts(cpu, 40); return true;
      case 0xfe66: case 0xfe47: case 0xfe43: // BRK / NMI -> ignore, return to BASIC
        console.warn('BRK/NMI reached'); this.cpuDone(); return true;
    }
    return false;
  }

  rts(cpu, cyc) {
    const l = cpu.pop(), h = cpu.pop();
    cpu.pc = (((h << 8) | l) + 1) & 0xffff;
    cpu.cycles += cyc;
  }

  kernalIrq() {
    // jiffy clock
    let t = this.ram[0xa2] | (this.ram[0xa1] << 8) | (this.ram[0xa0] << 16);
    t++;
    if (t >= 0x4f1a01) t = 0;
    this.ram[0xa2] = t & 0xff; this.ram[0xa1] = (t >> 8) & 0xff; this.ram[0xa0] = t >> 16;
    // keyboard scan -> buffer
    this.scanKeys();
    // cursor blink (direct mode only)
    if (this.basic.state === 'idle' && this.directKeys) this.blinkCursor();
  }

  scanKeys() {
    while (this.keyQueue.length) {
      const n = this.ram[0xc6];
      if (n >= Math.min(10, this.ram[0x0289] || 10)) break;
      const k = this.keyQueue.shift();
      this.ram[0x0277 + n] = k;
      this.ram[0xc6] = n + 1;
    }
    this.ram[0xc5] = this.keyQueue.length ? 0 : 64; // current key (approx)
  }

  pressKey(petscii) {
    if (this.keyQueue.length < 16) this.keyQueue.push(petscii);
  }

  getKey() {
    const n = this.ram[0xc6];
    if (!n) return -1;
    const k = this.ram[0x0277];
    for (let i = 0; i < 9; i++) this.ram[0x0277 + i] = this.ram[0x0278 + i];
    this.ram[0xc6] = n - 1;
    return k;
  }

  ti() { return this.ram[0xa2] | (this.ram[0xa1] << 8) | (this.ram[0xa0] << 16); }
  setTi$(s) {
    const v = parseInt(s.slice(0, 2)) * 216000 + parseInt(s.slice(2, 4)) * 3600 + parseInt(s.slice(4, 6)) * 60;
    this.ram[0xa2] = v & 0xff; this.ram[0xa1] = (v >> 8) & 0xff; this.ram[0xa0] = (v >> 16) & 0xff;
  }

  // ------------------------------------------------------------------ screen editor
  screenBase() { return this.ram[0x0288] << 8; }

  syncCursorZp() {
    const s = this.scr;
    this.ram[0xd6] = s.row;
    this.ram[0xd3] = s.col + (s.link[s.row] ? 0 : 40);
    const lineStart = s.link[s.row] ? s.row : s.row - 1;
    const p = this.screenBase() + lineStart * 40;
    this.ram[0xd1] = p & 0xff; this.ram[0xd2] = p >> 8;
    this.ram[0xc7] = s.rvs ? 0x12 : 0;
    this.ram[0xd4] = s.quote ? 1 : 0;
  }

  cursorCol() { const s = this.scr; return s.col + (s.link[s.row] ? 0 : 40); }

  clearScreen() {
    const b = this.screenBase();
    for (let i = 0; i < 1000; i++) { this.ram[b + i] = 0x20; this.colorRam[i] = this.ram[0x0286] & 15; }
    this.scr.link.fill(true);
    this.scr.row = 0; this.scr.col = 0;
  }

  scrollUp() {
    const b = this.screenBase(), s = this.scr;
    // scroll by the size of the top logical line
    let n = 1;
    if (!s.link[1]) n = 2;
    for (let k = 0; k < n; k++) {
      this.ram.copyWithin(b, b + 40, b + 1000);
      this.colorRam.copyWithin(0, 40, 1000);
      for (let i = 960; i < 1000; i++) { this.ram[b + i] = 0x20; this.colorRam[i] = this.ram[0x0286] & 15; }
      s.link.shift(); s.link.push(true);
      s.row--;
    }
    if (s.row < 0) s.row = 0;
    this.basic.cycles += 20000;
  }

  insertLineAfter(row) {
    // open a blank line below 'row' (rows below move down)
    const b = this.screenBase(), s = this.scr;
    const from = (row + 1) * 40;
    this.ram.copyWithin(b + from + 40, b + from, b + 960);
    this.colorRam.copyWithin(from + 40, from, 960);
    for (let i = 0; i < 40; i++) { this.ram[b + from + i] = 0x20; this.colorRam[from + i] = this.ram[0x0286] & 15; }
    s.link.splice(row + 1, 0, false); s.link.length = 25;
    this.basic.cycles += 8000;
  }

  putChar(sc) {
    const s = this.scr, b = this.screenBase();
    const off = s.row * 40 + s.col;
    this.ram[b + off] = sc;
    this.colorRam[off] = this.ram[0x0286] & 15;
    s.col++;
    if (s.col >= 40) {
      s.col = 0;
      if (s.link[s.row]) {
        // first row of a logical line: extend it to two rows
        if (s.row === 24) { this.scrollUp(); s.row++; s.link[s.row] = false; }
        else if (s.link[s.row + 1]) { this.insertLineAfter(s.row); s.row++; }
        else s.row++;
      } else {
        s.row++;
        if (s.row > 24) { s.row = 24; this.scrollUp(); s.row = 24; s.link[24] = true; }
      }
    }
  }

  newline() {
    const s = this.scr;
    let r = s.row;
    while (r + 1 < 25 && !s.link[r + 1]) r++;
    r++;
    s.col = 0;
    if (r > 24) { s.row = 24; this.scrollUp(); s.row = 24; while (!s.link[s.row] && s.row > 0) s.row--; s.row = 24; }
    else s.row = r;
    s.quote = false; s.rvs = false; s.insert = 0;
  }

  chrout(c) {
    const s = this.scr;
    this.hideCursor();
    if (c === 0x0d || c === 0x8d) { this.newline(); this.syncCursorZp(); return; }
    const isCtrl = c < 0x20 || (c >= 0x80 && c < 0xa0);
    if (isCtrl && (s.quote || s.insert > 0) && c !== 0x14) {
      // reversed control glyph
      const sc = c < 0x20 ? (c | 0x80) : (((c - 0x40) & 0x7f) | 0x80);
      this.putChar(sc ^ (s.rvs ? 0 : 0));
      if (s.insert > 0) s.insert--;
      this.syncCursorZp();
      return;
    }
    if (isCtrl) {
      if (c in COLOR_CODES) { this.ram[0x0286] = COLOR_CODES[c]; return; }
      switch (c) {
        case 0x11: s.row++; if (s.row > 24) { s.row = 24; this.scrollUp(); s.row = 24; } break;
        case 0x91: if (s.row > 0) s.row--; break;
        case 0x1d: s.col++; if (s.col >= 40) { s.col = 0; s.row++; if (s.row > 24) { s.row = 24; this.scrollUp(); s.row = 24; } } break;
        case 0x9d: if (s.col > 0) s.col--; else if (s.row > 0) { s.row--; s.col = 39; } break;
        case 0x12: s.rvs = true; break;
        case 0x92: s.rvs = false; break;
        case 0x13: s.row = 0; s.col = 0; break;
        case 0x93: this.clearScreen(); break;
        case 0x14: this.deleteChar(); break;
        case 0x94: this.insertChar(); break;
        case 0x0e: this.vic.regs[0x18] |= 2; break;
        case 0x8e: this.vic.regs[0x18] &= ~2; break;
      }
      this.syncCursorZp();
      return;
    }
    if (c === 0x22) s.quote = !s.quote;
    let sc = petsciiToScreen(c);
    if (s.rvs) sc |= 0x80;
    this.putChar(sc);
    if (s.insert > 0) s.insert--;
    this.syncCursorZp();
  }

  logicalLineRange(row) {
    const s = this.scr;
    let start = row;
    while (start > 0 && !s.link[start]) start--;
    let end = start;
    while (end + 1 < 25 && !s.link[end + 1]) end++;
    return [start, end];
  }

  deleteChar() {
    const s = this.scr, b = this.screenBase();
    if (s.col === 0 && s.link[s.row]) return;
    if (s.col > 0) s.col--; else { s.row--; s.col = 39; }
    const [, end] = this.logicalLineRange(s.row);
    const from = s.row * 40 + s.col, last = end * 40 + 39;
    for (let i = from; i < last; i++) { this.ram[b + i] = this.ram[b + i + 1]; this.colorRam[i] = this.colorRam[i + 1]; }
    this.ram[b + last] = 0x20;
  }

  insertChar() {
    const s = this.scr, b = this.screenBase();
    const [, end] = this.logicalLineRange(s.row);
    const from = s.row * 40 + s.col, last = end * 40 + 39;
    for (let i = last; i > from; i--) { this.ram[b + i] = this.ram[b + i - 1]; this.colorRam[i] = this.colorRam[i - 1]; }
    this.ram[b + from] = 0x20;
    s.insert++;
  }

  printStr(str) {
    for (let i = 0; i < str.length; i++) this.chrout(str.charCodeAt(i) & 0xff);
    this.basic.cycles += 170 * str.length;
  }

  hideCursor() {
    if (this.blink.on) {
      const off = this.scr.row * 40 + this.scr.col;
      this.ram[this.screenBase() + off] = this.blink.under;
      this.colorRam[off] = this.blink.color;
      this.blink.on = false;
    }
  }

  blinkCursor() {
    if (--this.blink.count > 0) return;
    this.blink.count = 20;
    const off = this.scr.row * 40 + this.scr.col, b = this.screenBase();
    if (!this.blink.on) {
      this.blink.under = this.ram[b + off]; this.blink.color = this.colorRam[off];
      this.ram[b + off] ^= 0x80; this.colorRam[off] = this.ram[0x0286] & 15;
      this.blink.on = true;
    } else this.hideCursor();
  }

  // ------------------------------------------------------------------ BASIC hooks
  ready() {
    this.printStr('\rREADY.\r');
    this.directKeys = true;
    this.emit('ready');
  }

  directDone() { this.ready(); }

  onRun() { this.directKeys = false; this.emit('run'); }

  // Called every slice while BASIC is idle: process keys like the screen editor.
  directMode() {
    const k = this.getKey();
    if (k < 0) return false;
    this.hideCursor();
    if (k === 0x0d) {
      const [start, end] = this.logicalLineRange(this.scr.row);
      const b = this.screenBase();
      const bytes = [];
      for (let i = start * 40; i < end * 40 + 40; i++) bytes.push(screenToPetscii(this.ram[b + i]));
      while (bytes.length && bytes[bytes.length - 1] === 0x20) bytes.pop();
      this.scr.row = end;
      this.chrout(0x0d);
      this.executeDirect(bytes);
      return true;
    }
    this.chrout(k);
    return true;
  }

  executeDirect(bytes) {
    let i = 0;
    while (bytes[i] === 0x20) i++;
    bytes = bytes.slice(i);
    if (!bytes.length) return;
    if (bytes[0] >= 0x30 && bytes[0] <= 0x39) {
      // program line entry
      let n = 0, j = 0;
      while (bytes[j] >= 0x30 && bytes[j] <= 0x39) n = n * 10 + bytes[j++] - 0x30;
      const code = Uint8Array.from(crunch(bytes.slice(j)));
      const lines = this.basic.lines.filter((l) => l.num !== n);
      if (code.length) lines.push({ num: n, code });
      lines.sort((a, b) => a.num - b.num);
      this.basic.setProgram(lines);
      return;
    }
    const code = Uint8Array.from(crunch(bytes));
    this.directKeys = false;
    const B = this.basic;
    B.direct = true; B.code = code; B.pos = 0; B.state = 'run';
  }

  // ------------------------------------------------------------------ SYS / CPU
  sys(addr) {
    const cpu = this.cpu;
    cpu.a = this.ram[0x030c]; cpu.x = this.ram[0x030d]; cpu.y = this.ram[0x030e];
    cpu.p = (this.ram[0x030f] | 0x20) & ~0x04 & ~0x10;
    cpu.s = 0xfa;
    cpu.pushReturn(TRAP_SYS_RETURN);
    cpu.pc = addr;
    this.mode = 'cpu'; this.cpuReason = 'sys';
  }

  cpuDone() {
    const cpu = this.cpu;
    if (this.cpuReason === 'sys') {
      this.ram[0x030c] = cpu.a; this.ram[0x030d] = cpu.x; this.ram[0x030e] = cpu.y; this.ram[0x030f] = cpu.p;
      this.mode = 'basic'; this.cpuReason = null;
      this.basic.resume();
    } else if (this.cpuReason === 'irq') {
      this.mode = 'basic'; this.cpuReason = this.savedReason || null;
    }
  }

  // run the IRQ handler while BASIC is executing (CPU idle)
  startIrqFromBasic() {
    const cpu = this.cpu;
    cpu.s = 0xf0;
    cpu.pc = TRAP_IRQ_RETURN;
    cpu.p &= ~0x04;
    cpu.irq();
    this.mode = 'cpu'; this.cpuReason = 'irq';
  }

  // ------------------------------------------------------------------ disk
  matchName(pattern, name) {
    const re = new RegExp('^' + pattern.replace(/[.+^${}()|[\]\\]/g, '\\$&').replace(/\*/g, '.*').replace(/\?/g, '.') + (pattern.includes('*') ? '' : '$'));
    return re.test(name);
  }

  load(name, dev, sa, direct) {
    const nameAscii = petsciiName(name);
    if (dev !== 8) return 'nodevice';
    if (direct) this.printStr('\rSEARCHING FOR ' + name);
    const f = this.disk.find(nameAscii, this.ram[2]);
    if (!f) { this.st = 0x42; return 'notfound'; }
    if (direct) this.printStr('\rLOADING');
    this.st = 0x40;
    this.emit('load', f.name);
    if (f.basic && sa === 0) {
      const lines = f.basic();
      return { program: lines };
    }
    const data = f.data;
    let addr = data[0] | (data[1] << 8);
    if (sa === 0) addr = this.ram[0x2b] | (this.ram[0x2c] << 8);
    for (let i = 2; i < data.length; i++) this.ram[(addr + i - 2) & 0xffff] = data[i];
    const end = addr + data.length - 2;
    this.ram[0xae] = end & 0xff; this.ram[0xaf] = end >> 8;
    this.basic.cycles += data.length * 40; // rough fast-loader speed
    if (f.basic) return { program: f.basic() };
    return 'ok';
  }

  openFile(lfn, dev, sa, name) {
    if (this.files.has(lfn)) return 'open';
    const n = petsciiName(name);
    const f = { dev, sa, name: n, data: [] };
    this.files.set(lfn, f);
    if (dev === 8 && sa === 15 && n) this.diskCommand(n);
    return 'ok';
  }

  diskCommand(cmd) {
    const m = /^s\d?:(.*)$/.exec(cmd);
    if (m) this.disk.scratch(m[1]);
  }

  writeFile(lfn, s) {
    const f = this.files.get(lfn);
    if (!f) return false;
    for (let i = 0; i < s.length; i++) f.data.push(s.charCodeAt(i) & 0xff);
    return true;
  }

  closeFile(lfn) {
    const f = this.files.get(lfn);
    if (!f) return;
    this.files.delete(lfn);
    if (f.dev === 8 && f.sa !== 15 && f.data.length) {
      const name = f.name.split(',')[0].replace(/^@?\d?:/, '');
      this.disk.save(name, Uint8Array.from(f.data));
      this.emit('save', name);
    }
  }

  // ------------------------------------------------------------------ scheduler
  // Run one PAL frame of emulation.
  runFrame() {
    if (this.halted) return;
    try {
      while (this.frameCycle < CYCLES_PER_FRAME) this.slice();
    } catch (e) {
      this.halted = e;
      console.error(e);
      this.emit('halt', e);
      return;
    }
    this.frameCycle -= CYCLES_PER_FRAME;
    this.renderedLine = 0;
    this.frameCount++;
    this.sid && this.sid.frame && this.sid.frame(this.totalCycles);
  }

  slice() {
    if (this.mode === 'cpu') {
      const cpu = this.cpu;
      let n = 0;
      while (this.mode === 'cpu' && n < 400) {
        if (!(cpu.p & 0x04) && this.irqPending()) {
          if (this.cpuReason === 'sys' || this.cpuReason === 'irq') { cpu.irq(); this.cia1.icr &= ~1; }
        }
        const c = cpu.step();
        n += c;
        this.tick(c);
      }
      return;
    }
    // BASIC (CPU idle, interrupts enabled)
    if (this.irqPending()) {
      this.cia1.icr &= ~1;
      if (this.vic.irqStatus & this.vic.regs[0x1a]) { /* raster irq: handler acks */ }
      this.startIrqFromBasic();
      return;
    }
    const B = this.basic;
    let used;
    if (B.state === 'run') {
      used = B.step(Math.min(2000, CYCLES_PER_FRAME - this.frameCycle + 1));
      if (used === 0) used = 50;
    } else if (B.state === 'wait') {
      B.checkWait();
      used = 200;
    } else if (B.state === 'idle') {
      this.directMode();
      used = 500;
    } else {
      used = 100;
    }
    this.tick(used);
  }

  // Start the game the same way the boot loader does.
  boot(firstProgram = 'ddd.dbas') {
    this.reset();
    const f = this.disk.find(firstProgram, 0);
    this.basic.setProgram(f.basic());
    this.basic.run();
  }

  // inject text into keyboard buffer (debug helper)
  typeText(s) { for (const ch of s) this.pressKey(ch === '\n' ? 13 : textToPetscii(ch)[0]); }
}

export function petsciiName(s) {
  let o = '';
  for (let i = 0; i < s.length; i++) {
    const c = s.charCodeAt(i);
    if (c >= 0x41 && c <= 0x5a) o += String.fromCharCode(c + 0x20);
    else if (c >= 0xc1 && c <= 0xda) o += String.fromCharCode(c - 0x80 + 0x20);
    else o += String.fromCharCode(c);
  }
  return o;
}
