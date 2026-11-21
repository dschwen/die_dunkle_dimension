// Commodore BASIC V2 interpreter executing tokenized lines.
// The interpreter is driven in slices by the machine (step(budget)), so it can
// cooperate with the 6502 core (SYS), IRQs, the VIC renderer and SID timing.

import { T, crunch, KEYWORDS } from './basictext.js';

const ERR = {
  NEXT_WITHOUT_FOR: 'next without for', SYNTAX: 'syntax', RETURN_WITHOUT_GOSUB: 'return without gosub',
  OUT_OF_DATA: 'out of data', ILLEGAL_QUANTITY: 'illegal quantity', OVERFLOW: 'overflow', OUT_OF_MEMORY: 'out of memory',
  UNDEFD_STATEMENT: "undef'd statement", BAD_SUBSCRIPT: 'bad subscript', REDIMD_ARRAY: "redim'd array",
  DIVISION_BY_ZERO: 'division by zero', ILLEGAL_DIRECT: 'illegal direct', TYPE_MISMATCH: 'type mismatch',
  STRING_TOO_LONG: 'string too long', FILE_NOT_FOUND: 'file not found', UNDEFD_FUNCTION: "undef'd function",
  FILE_OPEN: 'file open', FILE_NOT_OPEN: 'file not open', NOT_INPUT_FILE: 'not input file', NOT_OUTPUT_FILE: 'not output file',
  CANT_CONTINUE: "can't continue", MISSING_FILENAME: 'missing file name', DEVICE_NOT_PRESENT: 'device not present',
};

export class BasicError extends Error {
  constructor(code) { super(code); this.code = code; }
}
const err = (c) => { throw new BasicError(c); };

// approximate C64 cycle costs (tuned so an empty FOR/NEXT iteration ~ 1 ms)
const COST_STMT = 450;
const COST_BYTE = 30;
const COST_OP = 420;
const COST_LINE_SEARCH = 12;

const isLetter = (c) => c >= 0x41 && c <= 0x5a;
const isDigit = (c) => c >= 0x30 && c <= 0x39;

// ---- C64 style number formatting ----
export function formatNumber(n) {
  if (n === 0) return ' 0';
  let s;
  const a = Math.abs(n);
  if (a >= 1e9 || a < 0.01) {
    let e = Math.floor(Math.log10(a));
    let m = a / Math.pow(10, e);
    m = +m.toPrecision(9);
    if (m >= 10) { m /= 10; e++; }
    let ms = String(m);
    s = ms + 'E' + (e < 0 ? '-' : '+') + String(Math.abs(e)).padStart(2, '0');
  } else {
    s = String(+a.toPrecision(9));
    if (s.startsWith('0.')) s = s.slice(1);
  }
  return (n < 0 ? '-' : ' ') + s;
}

function toAscii(s) { // petscii string -> printable-ish (for debugging)
  return [...s].map((c) => { const o = c.charCodeAt(0); return (o >= 0x41 && o <= 0x5a) ? String.fromCharCode(o + 32) : (o >= 0x20 && o < 0x60 ? c : '·'); }).join('');
}

export class Basic {
  constructor(m) {
    this.m = m; // machine interface
    this.lines = [];
    this.index = new Map();
    this.vars = new Map();
    this.arrays = new Map();
    this.fns = new Map();
    this.stack = [];
    this.state = 'idle'; // idle | run | sys | wait | direct
    this.li = 0; this.pos = 0; this.code = null; this.direct = false;
    this.dataLi = 0; this.dataPos = -1;
    this.rndSeed = 0x3ecf; this.rndState = Math.random();
    this.cycles = 0; // cost accumulator for current slice
    this.contLi = -1;
  }

  // ---------------------------------------------------------------- program
  setProgram(lines) {
    this.lines = lines;
    this.index = new Map();
    lines.forEach((l, i) => this.index.set(l.num, i));
  }

  clr() {
    this.vars = new Map();
    this.arrays = new Map();
    this.fns = new Map();
    this.stack = [];
    this.dataLi = 0; this.dataPos = -1;
  }

  run(lineNum) {
    this.clr();
    this.m.onRun && this.m.onRun();
    if (!this.lines.length) { this.state = 'idle'; return; }
    let li = 0;
    if (lineNum != null) {
      li = this.index.get(lineNum);
      if (li == null) err(ERR.UNDEFD_STATEMENT);
    }
    this.gotoLine(li);
    this.state = 'run';
  }

  gotoLine(li) {
    this.direct = false;
    this.li = li; this.code = this.lines[li].code; this.pos = 0;
  }

  findLine(num) {
    const li = this.index.get(num);
    if (li == null) err(ERR.UNDEFD_STATEMENT);
    // emulate linear search cost
    const from = (num > (this.direct ? -1 : this.lines[this.li].num)) && !this.direct ? this.li : 0;
    this.cycles += Math.abs(li - from) * COST_LINE_SEARCH;
    return li;
  }

  // ---------------------------------------------------------------- char scan
  peekc() {
    while (this.pos < this.code.length && this.code[this.pos] === 0x20) this.pos++;
    return this.pos < this.code.length ? this.code[this.pos] : 0;
  }
  getc() { const c = this.peekc(); if (c) this.pos++; this.cycles += COST_BYTE; return c; }
  expect(c) { if (this.getc() !== c) err(ERR.SYNTAX); }
  atEnd() { const c = this.peekc(); return c === 0 || c === 0x3a; }

  // ---------------------------------------------------------------- execution
  // Execute statements until the cycle budget is used or execution blocks.
  step(budget) {
    this.cycles = 0;
    while (this.cycles < budget && (this.state === 'run')) {
      try {
        this.execStatement();
      } catch (e) {
        if (e instanceof BasicError) { this.error(e.code); break; }
        throw e;
      }
    }
    return this.cycles;
  }

  error(code) {
    const where = this.direct ? '' : ' in ' + this.lines[this.li].num;
    console.warn('BASIC error:', code, where, this.debugLine());
    this.m.onError && this.m.onError(code, where);
    this.state = 'idle';
    this.m.printStr('\r?' + code.toUpperCase() + '  ERROR' + where.toUpperCase());
    this.m.ready();
  }

  debugLine() {
    if (!this.code) return '';
    return toAscii(String.fromCharCode(...this.code));
  }

  nextStatement() {
    // advance to the next statement; returns false when program ended
    const c = this.peekc();
    if (c === 0x3a) { this.pos++; return true; }
    if (c !== 0) err(ERR.SYNTAX);
    if (this.direct) { this.state = 'idle'; this.m.directDone(); return false; }
    if (this.li + 1 >= this.lines.length) { this.end(); return false; }
    this.gotoLine(this.li + 1);
    this.m.onLine && this.m.onLine(this.lines[this.li].num);
    return true;
  }

  end() {
    this.state = 'idle';
    this.contLi = this.li;
    this.m.ready();
  }

  execStatement() {
    this.cycles += COST_STMT;
    let c = this.peekc();
    if (c === 0x3a) { this.pos++; return; }
    if (c === 0) { this.nextStatement(); return; }
    this.pos++;
    if (c >= 0x80) {
      const handled = this.exec(c);
      if (handled === 'jump') return;
    } else {
      this.pos--;
      this.let();
    }
    if (this.state === 'run' || this.state === 'sys' || this.state === 'wait') this.nextStatementIfDone();
  }

  nextStatementIfDone() {
    const c = this.peekc();
    if (c === 0x3a) { this.pos++; return; }
    if (c === 0) {
      if (this.state !== 'run') { this.pendingNext = true; return; }
      this.nextStatement();
      return;
    }
    err(ERR.SYNTAX);
  }

  // called by machine when SYS returns / WAIT finished
  resume() {
    this.state = 'run';
    if (this.pendingNext) { this.pendingNext = false; try { this.nextStatement(); } catch (e) { if (e instanceof BasicError) this.error(e.code); else throw e; } }
  }

  exec(tok) {
    switch (tok) {
      case T.end: this.end(); return 'jump';
      case T.stop: this.state = 'idle'; this.m.printStr('\rBREAK' + (this.direct ? '' : ' IN ' + this.lines[this.li].num)); this.m.ready(); return 'jump';
      case T.rem: this.pos = this.code.length; return;
      case T.data: this.skipData(); return;
      case T.let: this.let(); return;
      case T.print: this.print(); return;
      case T.printh: this.printFile(); return;
      case T.goto: this.doGoto(this.lineNumber()); return 'jump';
      case T.go: this.expect(T.to); this.doGoto(this.lineNumber()); return 'jump';
      case T.gosub: { const n = this.lineNumber(); this.pushGosub(); this.doGoto(n); return 'jump'; }
      case T.return: this.doReturn(); return;
      case T.if: return this.doIf();
      case T.for: this.doFor(); return;
      case T.next: return this.doNext();
      case T.on: return this.doOn();
      case T.dim: this.doDim(); return;
      case T.read: this.doRead(); return;
      case T.restore: this.dataLi = 0; this.dataPos = -1; return;
      case T.poke: { const a = this.evalInt16u(); this.expect(0x2c); const v = this.evalByte(); this.m.poke(a, v); return; }
      case T.sys: { const a = this.evalInt16u(); this.state = 'sys'; this.m.sys(a); return; }
      case T.wait: return this.doWait();
      case T.get: this.doGet(); return;
      case T.def: this.doDef(); return;
      case T.run: {
        const c = this.peekc();
        if (isDigit(c)) this.run(this.lineNumber()); else this.run();
        return 'jump';
      }
      case T.clr: this.clr(); return;
      case T.new: this.lines = []; this.index = new Map(); this.clr(); this.state = 'idle'; this.m.ready(); return 'jump';
      case T.load: return this.doLoad();
      case T.open: this.doOpen(); return;
      case T.close: { const n = this.evalByte(); this.m.closeFile(n); return; }
      case T.cont: if (this.contLi < 0) err(ERR.CANT_CONTINUE); this.gotoLine(this.contLi + 1 < this.lines.length ? this.contLi + 1 : this.contLi); this.state = 'run'; return 'jump';
      case T.list: this.doList(); return;
      case T.input: case T.inputh: return this.doInput(tok);
      case T.save: case T.verify: case T.cmd: this.pos = this.code.length; return;
      default: err(ERR.SYNTAX);
    }
  }

  doList() {
    this.pos = this.code.length;
    for (const l of this.lines) {
      let s = l.num + ' ';
      let q = false;
      for (const b of l.code) {
        if (b === 0x22) q = !q;
        if (!q && b >= 0x80 && b <= 0xcb) s += KEYWORDS[b - 0x80].toUpperCase().replace(/[A-Z]/g, (ch) => String.fromCharCode(ch.charCodeAt(0))); else s += String.fromCharCode(b);
      }
      this.m.printStr(s + '\r');
    }
  }

  lineNumber() {
    let n = 0, any = false;
    while (isDigit(this.peekc())) { n = n * 10 + (this.code[this.pos++] - 0x30); any = true; }
    if (!any) return 0;
    return n;
  }

  doGoto(n) {
    const li = this.findLine(n);
    this.gotoLine(li);
    if (this.state === 'idle') this.state = 'run';
  }

  pushGosub() {
    this.stack.push({ type: 'gosub', li: this.li, pos: this.pos, direct: this.direct, code: this.code });
  }

  doReturn() {
    while (this.stack.length && this.stack[this.stack.length - 1].type !== 'gosub') this.stack.pop();
    const f = this.stack.pop();
    if (!f) err(ERR.RETURN_WITHOUT_GOSUB);
    this.li = f.li; this.direct = f.direct; this.code = f.code; this.pos = f.pos;
    // skip rest of the GOSUB statement (line number already consumed)
    while (!this.atEnd()) this.pos++;
  }

  doIf() {
    const v = this.evalExpr();
    const t = this.peekc();
    let cond = typeof v === 'string' ? v.length > 0 : v !== 0;
    if (t === T.then) this.pos++;
    else if (t !== T.goto) err(ERR.SYNTAX);
    if (!cond) {
      // skip to next line
      this.pos = this.code.length;
      return;
    }
    const c = this.peekc();
    if (t === T.goto) { this.pos++; this.doGoto(this.lineNumber()); return 'jump'; }
    if (isDigit(c)) { this.doGoto(this.lineNumber()); return 'jump'; }
    // execute statement after THEN directly (no ':' needed)
    return 'jump';
  }

  doFor() {
    const name = this.varName();
    if (name.type !== 'n') err(ERR.TYPE_MISMATCH);
    this.expect(T.eq);
    const start = this.evalNum();
    this.setVar(name, start);
    this.expect(T.to);
    const limit = this.evalNum();
    let step = 1;
    if (this.peekc() === T.step) { this.pos++; step = this.evalNum(); }
    // remove existing FOR frame for same var (and everything above it)
    for (let i = this.stack.length - 1; i >= 0; i--) {
      const f = this.stack[i];
      if (f.type === 'gosub') break;
      if (f.type === 'for' && f.key === name.key) { this.stack.length = i; break; }
    }
    this.stack.push({ type: 'for', key: name.key, name, limit, step, li: this.li, pos: this.pos, direct: this.direct, code: this.code });
  }

  doNext() {
    for (;;) {
      let key = null;
      const c = this.peekc();
      if (isLetter(c)) key = this.varName().key;
      // find frame
      let fi = -1;
      for (let i = this.stack.length - 1; i >= 0; i--) {
        const f = this.stack[i];
        if (f.type === 'gosub') break;
        if (f.type === 'for' && (key === null || f.key === key)) { fi = i; break; }
      }
      if (fi < 0) err(ERR.NEXT_WITHOUT_FOR);
      this.stack.length = fi + 1;
      const f = this.stack[fi];
      const v = this.getVarByKey(f.name) + f.step;
      this.setVar(f.name, v);
      this.cycles += 600;
      const done = f.step >= 0 ? v > f.limit : v < f.limit;
      if (!done) {
        this.li = f.li; this.pos = f.pos; this.direct = f.direct; this.code = f.code;
        return;
      }
      this.stack.length = fi;
      if (this.peekc() === 0x2c) { this.pos++; continue; }
      return;
    }
  }

  doOn() {
    const v = Math.floor(this.evalNum());
    if (v < 0 || v > 255) err(ERR.ILLEGAL_QUANTITY);
    const t = this.getc();
    if (t !== T.goto && t !== T.gosub) err(ERR.SYNTAX);
    let i = 1, target = -1;
    for (;;) {
      const n = this.lineNumber();
      if (i === v) target = n;
      if (this.peekc() === 0x2c) { this.pos++; i++; continue; }
      break;
    }
    if (target < 0) return;
    if (t === T.gosub) this.pushGosub();
    this.doGoto(target);
    return 'jump';
  }

  doDim() {
    for (;;) {
      const name = this.varName(true);
      if (this.getc() !== 0x28) err(ERR.SYNTAX);
      const dims = [];
      for (;;) { dims.push(this.evalIndex()); if (this.peekc() === 0x2c) { this.pos++; continue; } break; }
      this.expect(0x29);
      if (this.arrays.has(name.key)) err(ERR.REDIMD_ARRAY);
      this.createArray(name, dims);
      if (this.peekc() === 0x2c) { this.pos++; continue; }
      break;
    }
  }

  createArray(name, dims) {
    const size = dims.reduce((a, d) => a * (d + 1), 1);
    const arr = { dims, data: new Array(size).fill(name.type === 's' ? '' : 0) };
    this.arrays.set(name.key, arr);
    return arr;
  }

  skipData() {
    let q = false;
    while (this.pos < this.code.length) {
      const c = this.code[this.pos];
      if (c === 0x22) q = !q;
      if (!q && c === 0x3a) break;
      this.pos++;
    }
  }

  // read next DATA item as raw string
  nextDataItem() {
    for (;;) {
      if (this.dataPos < 0) {
        // find next DATA token starting from dataLi
        let found = false;
        while (this.dataLi < this.lines.length) {
          const code = this.lines[this.dataLi].code;
          let q = false;
          for (let p = this.dataScan || 0; p < code.length; p++) {
            const c = code[p];
            if (c === 0x22) q = !q;
            if (!q && c === T.data) { this.dataPos = p + 1; found = true; break; }
            if (!q && c === T.rem) break;
          }
          this.dataScan = 0;
          if (found) break;
          this.dataLi++;
        }
        if (!found) err(ERR.OUT_OF_DATA);
      }
      const code = this.lines[this.dataLi].code;
      let p = this.dataPos;
      while (p < code.length && code[p] === 0x20) p++;
      let s = '';
      if (code[p] === 0x22) {
        p++;
        while (p < code.length && code[p] !== 0x22) s += String.fromCharCode(code[p++]);
        if (code[p] === 0x22) p++;
        while (p < code.length && code[p] !== 0x2c && code[p] !== 0x3a) p++;
      } else {
        while (p < code.length && code[p] !== 0x2c && code[p] !== 0x3a) s += String.fromCharCode(code[p++]);
        s = s.replace(/ +$/, '');
      }
      if (code[p] === 0x2c) { this.dataPos = p + 1; }
      else { // end of this DATA statement: continue scanning this line after it
        this.dataPos = -1; this.dataScan = p; if (p >= code.length) { this.dataLi++; this.dataScan = 0; }
      }
      return s;
    }
  }

  doRead() {
    for (;;) {
      const ref = this.lvalue();
      const s = this.nextDataItem();
      if (ref.name.type === 's') this.assign(ref, s);
      else {
        const v = s === '' ? 0 : this.parseNumberString(s, true);
        this.assign(ref, v);
      }
      if (this.peekc() === 0x2c) { this.pos++; continue; }
      break;
    }
  }

  parseNumberString(s, strict) {
    // C64 VAL semantics (strict: syntax error on garbage for READ)
    const t = s.replace(/ /g, '');
    const m = /^[+-]?(\d*\.?\d*)(E[+-]?\d+)?/.exec(t);
    if (!m || !m[0] || m[0] === '+' || m[0] === '-' || m[0] === '.') {
      if (strict && t.length) err(ERR.SYNTAX);
      return 0;
    }
    if (strict && m[0].length !== t.length) err(ERR.SYNTAX);
    const v = parseFloat(m[0]);
    return isNaN(v) ? 0 : v;
  }

  doWait() {
    const a = this.evalInt16u(); this.expect(0x2c);
    const mask = this.evalByte();
    let x = 0;
    if (this.peekc() === 0x2c) { this.pos++; x = this.evalByte(); }
    this.waitSpec = { a, mask, x };
    if ((this.m.peek(a) ^ x) & mask) return;
    this.state = 'wait';
  }

  checkWait() {
    const w = this.waitSpec;
    if ((this.m.peek(w.a) ^ w.x) & w.mask) this.resume();
  }

  doGet() {
    const ref = this.lvalue();
    const k = this.m.getKey(); // number or -1
    if (ref.name.type === 's') this.assign(ref, k < 0 ? '' : String.fromCharCode(k));
    else {
      if (k >= 0 && !(isDigit(k))) err(ERR.SYNTAX);
      this.assign(ref, k < 0 ? 0 : k - 0x30);
    }
    if (this.peekc() === 0x2c) { this.pos++; this.doGet(); }
  }

  doInput(tok) {
    // minimal INPUT support: not used by the game, treated as reading an empty answer
    if (tok === T.inputh) { this.evalByte(); this.expect(0x2c); }
    if (this.peekc() === 0x22) { this.evalExpr(); this.expect(0x3b); }
    for (;;) {
      const ref = this.lvalue();
      this.assign(ref, ref.name.type === 's' ? '' : 0);
      if (this.peekc() === 0x2c) { this.pos++; continue; }
      break;
    }
  }

  doDef() {
    this.expect(T.fn);
    const name = this.varName(true);
    this.expect(0x28);
    const param = this.varName();
    this.expect(0x29);
    this.expect(T.eq);
    if (this.direct) err(ERR.ILLEGAL_DIRECT);
    this.fns.set(name.key, { param, code: this.code, pos: this.pos });
    // skip expression
    while (!this.atEnd()) { if (this.code[this.pos] === 0x22) { this.pos++; while (this.pos < this.code.length && this.code[this.pos] !== 0x22) this.pos++; } this.pos++; }
  }

  doLoad() {
    let name = '', dev = 1, sa = 0;
    if (!this.atEnd()) {
      name = this.evalStr();
      if (this.peekc() === 0x2c) { this.pos++; dev = this.evalByte(); }
      if (this.peekc() === 0x2c) { this.pos++; sa = this.evalByte(); }
    }
    const res = this.m.load(name, dev, sa, this.direct);
    if (res === 'notfound') err(ERR.FILE_NOT_FOUND);
    if (res === 'nodevice') err(ERR.DEVICE_NOT_PRESENT);
    if (res && res.program) {
      // BASIC program loaded (relocated)
      this.setProgram(res.program);
      if (this.direct) { this.state = 'idle'; this.m.ready(); return 'jump'; }
      this.stack = [];
      this.gotoLine(0);
      return 'jump';
    }
    if (this.direct) { this.state = 'idle'; this.m.ready(); return 'jump'; }
    // program mode: restart program from beginning, variables kept
    this.stack = [];
    if (!this.lines.length) { this.end(); return 'jump'; }
    this.gotoLine(0);
    return 'jump';
  }

  doOpen() {
    const lfn = this.evalByte();
    let dev = 1, sa = 0, name = '';
    if (this.peekc() === 0x2c) { this.pos++; dev = this.evalByte(); }
    if (this.peekc() === 0x2c) { this.pos++; sa = this.evalByte(); }
    if (this.peekc() === 0x2c) { this.pos++; name = this.evalStr(); }
    const r = this.m.openFile(lfn, dev, sa, name);
    if (r === 'open') err(ERR.FILE_OPEN);
  }

  printFile() {
    const lfn = this.evalByte();
    const out = (s) => { if (!this.m.writeFile(lfn, s)) err(ERR.FILE_NOT_OPEN); };
    if (this.atEnd()) { out('\r'); return; }
    this.expect(0x2c);
    this.printItems(out);
  }

  print() { this.printItems((s) => this.m.printStr(s), true); }

  printItems(out, screen) {
    let newline = true;
    for (;;) {
      const c = this.peekc();
      if (c === 0 || c === 0x3a) break;
      newline = true;
      if (c === 0x3b) { this.pos++; newline = false; continue; }
      if (c === 0x2c) {
        this.pos++; newline = false;
        if (screen) { const col = this.m.cursorCol() % 40; const n = 10 - (col % 10); out('\x1d'.repeat(n)); }
        else out('\x1d');
        continue;
      }
      if (c === T.spc_ || c === T.tab_) {
        this.pos++;
        const n = this.evalByte(); this.expect(0x29);
        if (c === T.spc_) out((screen ? '\x1d' : ' ').repeat(n));
        else { const col = screen ? this.m.cursorCol() : 0; if (n > col) out((screen ? '\x1d' : ' ').repeat(n - col)); }
        newline = false;
        continue;
      }
      const v = this.evalExpr();
      if (typeof v === 'string') out(v);
      else out(formatNumber(v) + (screen ? '\x1d' : ' '));
      this.cycles += 100;
      const n2 = this.peekc();
      if (n2 === 0 || n2 === 0x3a) break;
      newline = true;
    }
    if (newline) out('\r');
  }

  // ---------------------------------------------------------------- variables
  varName(noArray) {
    let c = this.getc();
    if (!isLetter(c)) err(ERR.SYNTAX);
    let n = String.fromCharCode(c);
    let c2 = this.code[this.pos];
    if (c2 !== undefined && (isLetter(c2) || isDigit(c2))) { n += String.fromCharCode(c2); this.pos++; }
    while (this.pos < this.code.length && (isLetter(this.code[this.pos]) || isDigit(this.code[this.pos]))) this.pos++;
    let type = 'n';
    const t = this.code[this.pos];
    if (t === 0x24) { type = 's'; this.pos++; }
    else if (t === 0x25) { type = 'i'; this.pos++; }
    return { key: n + (type === 's' ? '$' : type === 'i' ? '%' : ''), type, base: n };
  }

  lvalue() {
    const name = this.varName();
    if (this.code[this.pos] === 0x28) {
      this.pos++;
      const idx = [];
      for (;;) { idx.push(this.evalIndex()); if (this.peekc() === 0x2c) { this.pos++; continue; } break; }
      this.expect(0x29);
      return { name, idx };
    }
    return { name };
  }

  assign(ref, v) {
    if (ref.name.type === 's') { if (typeof v !== 'string') err(ERR.TYPE_MISMATCH); if (v.length > 255) err(ERR.STRING_TOO_LONG); }
    else {
      if (typeof v === 'string') err(ERR.TYPE_MISMATCH);
      if (ref.name.type === 'i') { v = Math.floor(v); if (v < -32768 || v > 32767) err(ERR.ILLEGAL_QUANTITY); }
    }
    if (ref.idx) {
      const a = this.getArray(ref.name, ref.idx.length);
      a.data[this.arrayOffset(a, ref.idx)] = v;
    } else this.setVar(ref.name, v);
  }

  setVar(name, v) {
    if (name.key === 'TI$') { this.m.setTi$(v); return; }
    if (name.type === 'i') v = Math.floor(v);
    this.vars.set(name.key, v);
  }

  getVarByKey(name) {
    const k = name.key;
    if (k === 'TI') return this.m.ti();
    if (k === 'ST') return this.m.st();
    if (k === 'TI$') { const t = Math.floor(this.m.ti() / 60); return String(Math.floor(t / 3600) % 24).padStart(2, '0') + String(Math.floor(t / 60) % 60).padStart(2, '0') + String(t % 60).padStart(2, '0'); }
    const v = this.vars.get(k);
    if (v === undefined) return name.type === 's' ? '' : 0;
    return v;
  }

  getArray(name, ndims) {
    let a = this.arrays.get(name.key);
    if (!a) a = this.createArray(name, new Array(ndims).fill(10));
    if (a.dims.length !== ndims) err(ERR.BAD_SUBSCRIPT);
    return a;
  }

  arrayOffset(a, idx) {
    let off = 0;
    for (let i = 0; i < idx.length; i++) {
      if (idx[i] > a.dims[i]) err(ERR.BAD_SUBSCRIPT);
      off = off * (a.dims[i] + 1) + idx[i];
    }
    return off;
  }

  let() {
    const ref = this.lvalue();
    this.expect(T.eq);
    const v = this.evalExpr();
    this.assign(ref, v);
  }

  // ---------------------------------------------------------------- expressions
  evalNum() { const v = this.evalExpr(); if (typeof v !== 'number') err(ERR.TYPE_MISMATCH); return v; }
  evalStr() { const v = this.evalExpr(); if (typeof v !== 'string') err(ERR.TYPE_MISMATCH); return v; }
  evalByte() { const v = Math.floor(this.evalNum()); if (v < 0 || v > 255) err(ERR.ILLEGAL_QUANTITY); return v; }
  evalInt16u() { const v = Math.floor(this.evalNum()); if (v < 0 || v > 65535) err(ERR.ILLEGAL_QUANTITY); return v; }
  evalIndex() { const v = Math.floor(this.evalNum()); if (v < 0 || v > 32767) err(ERR.ILLEGAL_QUANTITY); return v; }

  evalExpr() { return this.evOr(); }

  toInt16(v) {
    if (typeof v !== 'number') err(ERR.TYPE_MISMATCH);
    v = Math.floor(v);
    if (v < -32768 || v > 32767) err(ERR.ILLEGAL_QUANTITY);
    return v;
  }

  evOr() {
    let a = this.evAnd();
    while (this.peekc() === T.or) { this.pos++; const b = this.evAnd(); a = this.toInt16(a) | this.toInt16(b); this.cycles += COST_OP; }
    return a;
  }
  evAnd() {
    let a = this.evNot();
    while (this.peekc() === T.and) { this.pos++; const b = this.evNot(); a = this.toInt16(a) & this.toInt16(b); this.cycles += COST_OP; }
    return a;
  }
  evNot() {
    if (this.peekc() === T.not) { this.pos++; const v = this.evNot(); return ~this.toInt16(v); }
    return this.evRel();
  }
  evRel() {
    let a = this.evAdd();
    for (;;) {
      let op = 0;
      for (;;) {
        const c = this.peekc();
        if (c === T.gt) op |= 1; else if (c === T.eq) op |= 2; else if (c === T.lt) op |= 4; else break;
        this.pos++;
      }
      if (!op) return a;
      const b = this.evAdd();
      if (typeof a !== typeof b) err(ERR.TYPE_MISMATCH);
      let cmp;
      if (typeof a === 'string') cmp = a < b ? -1 : a > b ? 1 : 0;
      else cmp = a < b ? -1 : a > b ? 1 : 0;
      const r = (cmp > 0 && (op & 1)) || (cmp === 0 && (op & 2)) || (cmp < 0 && (op & 4));
      a = r ? -1 : 0;
      this.cycles += COST_OP;
    }
  }
  evAdd() {
    let a = this.evMul();
    for (;;) {
      const c = this.peekc();
      if (c === T.plus) {
        this.pos++; const b = this.evMul();
        if (typeof a !== typeof b) err(ERR.TYPE_MISMATCH);
        if (typeof a === 'string') { a = a + b; if (a.length > 255) err(ERR.STRING_TOO_LONG); } else a = a + b;
        this.cycles += COST_OP;
      } else if (c === T.minus) {
        this.pos++; const b = this.evMul();
        if (typeof a !== 'number' || typeof b !== 'number') err(ERR.TYPE_MISMATCH);
        a = a - b; this.cycles += COST_OP;
      } else return a;
    }
  }
  evMul() {
    let a = this.evUnary();
    for (;;) {
      const c = this.peekc();
      if (c === T.mul || c === T.div) {
        this.pos++; const b = this.evUnary();
        if (typeof a !== 'number' || typeof b !== 'number') err(ERR.TYPE_MISMATCH);
        if (c === T.mul) a = a * b; else { if (b === 0) err(ERR.DIVISION_BY_ZERO); a = a / b; }
        this.cycles += COST_OP * 2;
        if (!isFinite(a)) err(ERR.OVERFLOW);
      } else return a;
    }
  }
  evUnary() {
    const c = this.peekc();
    if (c === T.minus) { this.pos++; const v = this.evUnary(); if (typeof v !== 'number') err(ERR.TYPE_MISMATCH); return -v; }
    if (c === T.plus) { this.pos++; return this.evUnary(); }
    return this.evPow();
  }
  evPow() {
    let a = this.evAtom();
    while (this.peekc() === T.pow) {
      this.pos++;
      let b;
      if (this.peekc() === T.minus) { this.pos++; b = -this.evAtomNum(); } else b = this.evAtom();
      if (typeof a !== 'number' || typeof b !== 'number') err(ERR.TYPE_MISMATCH);
      a = Math.pow(a, b); this.cycles += COST_OP * 6;
      if (!isFinite(a)) err(ERR.OVERFLOW);
    }
    return a;
  }
  evAtomNum() { const v = this.evAtom(); if (typeof v !== 'number') err(ERR.TYPE_MISMATCH); return v; }

  parseNumberLiteral() {
    let s = '';
    let c = this.code[this.pos];
    while (isDigit(c) || c === 0x2e || c === 0x20) { if (c !== 0x20) s += String.fromCharCode(c); this.pos++; c = this.code[this.pos]; }
    if (c === 0x45) { // E
      let save = this.pos;
      this.pos++;
      let e = 'e';
      let d = this.code[this.pos];
      if (d === T.minus || d === 0x2d) { e += '-'; this.pos++; } else if (d === T.plus || d === 0x2b) { this.pos++; }
      let any = false;
      while (isDigit(this.code[this.pos])) { e += String.fromCharCode(this.code[this.pos++]); any = true; }
      if (any) s += e; else this.pos = save + 1;
    }
    this.cycles += 150;
    if (s === '.' || s === '') return 0;
    return parseFloat(s);
  }

  evAtom() {
    const c = this.peekc();
    if (isDigit(c) || c === 0x2e) return this.parseNumberLiteral();
    if (c === 0x22) {
      this.pos++;
      let s = '';
      while (this.pos < this.code.length && this.code[this.pos] !== 0x22) s += String.fromCharCode(this.code[this.pos++]);
      if (this.code[this.pos] === 0x22) this.pos++;
      return s;
    }
    if (c === 0x28) { this.pos++; const v = this.evalExpr(); this.expect(0x29); return v; }
    if (c === T.pi) { this.pos++; return Math.PI; }
    if (isLetter(c)) {
      const name = this.varName();
      if (this.code[this.pos] === 0x28) {
        this.pos++;
        const idx = [];
        for (;;) { idx.push(this.evalIndex()); if (this.peekc() === 0x2c) { this.pos++; continue; } break; }
        this.expect(0x29);
        const a = this.getArray(name, idx.length);
        this.cycles += 200;
        return a.data[this.arrayOffset(a, idx)];
      }
      this.cycles += 160;
      return this.getVarByKey(name);
    }
    if (c === T.fn) {
      this.pos++;
      const name = this.varName(true);
      const f = this.fns.get(name.key);
      if (!f) err(ERR.UNDEFD_FUNCTION);
      this.expect(0x28);
      const arg = this.evalExpr();
      this.expect(0x29);
      const saved = this.vars.get(f.param.key);
      this.vars.set(f.param.key, arg);
      const sc = this.code, sp = this.pos;
      this.code = f.code; this.pos = f.pos;
      const v = this.evalExpr();
      this.code = sc; this.pos = sp;
      if (saved === undefined) this.vars.delete(f.param.key); else this.vars.set(f.param.key, saved);
      return v;
    }
    if (c >= T.sgn && c <= T.mids) { this.pos++; this.cycles += COST_OP; return this.func(c); }
    if (c === T.not || c === T.minus) return this.evUnary();
    err(ERR.SYNTAX);
  }

  func(t) {
    const arg1 = () => { this.expect(0x28); const v = this.evalExpr(); this.expect(0x29); return v; };
    const num = () => { const v = arg1(); if (typeof v !== 'number') err(ERR.TYPE_MISMATCH); return v; };
    const str = () => { const v = arg1(); if (typeof v !== 'string') err(ERR.TYPE_MISMATCH); return v; };
    switch (t) {
      case T.sgn: return Math.sign(num());
      case T.int: return Math.floor(num());
      case T.abs: return Math.abs(num());
      case T.usr: num(); return 0;
      case T.fre: arg1(); return 12345;
      case T.pos: arg1(); return this.m.cursorCol() % 40;
      case T.sqr: { const v = num(); if (v < 0) err(ERR.ILLEGAL_QUANTITY); return Math.sqrt(v); }
      case T.rnd: return this.rnd(num());
      case T.log: { const v = num(); if (v <= 0) err(ERR.ILLEGAL_QUANTITY); return Math.log(v); }
      case T.exp: return Math.exp(num());
      case T.cos: return Math.cos(num());
      case T.sin: return Math.sin(num());
      case T.tan: return Math.tan(num());
      case T.atn: return Math.atan(num());
      case T.peek: { const a = Math.floor(num()); if (a < 0 || a > 65535) err(ERR.ILLEGAL_QUANTITY); return this.m.peek(a); }
      case T.len: return str().length;
      case T.strs: return formatNumber(num());
      case T.val: return this.parseNumberString(str(), false);
      case T.asc: { const s = str(); if (!s.length) err(ERR.ILLEGAL_QUANTITY); return s.charCodeAt(0); }
      case T.chrs: { const v = Math.floor(num()); if (v < 0 || v > 255) err(ERR.ILLEGAL_QUANTITY); return String.fromCharCode(v); }
      case T.lefts: case T.rights: {
        this.expect(0x28); const s = this.evalStr(); this.expect(0x2c); const n = this.evalByte(); this.expect(0x29);
        return t === T.lefts ? s.slice(0, n) : (n >= s.length ? s : s.slice(s.length - n));
      }
      case T.mids: {
        this.expect(0x28); const s = this.evalStr(); this.expect(0x2c); const st = this.evalByte();
        if (st === 0) err(ERR.ILLEGAL_QUANTITY);
        let n = 255;
        if (this.peekc() === 0x2c) { this.pos++; n = this.evalByte(); }
        this.expect(0x29);
        return s.substr(st - 1, n);
      }
    }
    err(ERR.SYNTAX);
  }

  rnd(x) {
    // C64-like behaviour: negative seeds, zero uses timers, positive -> next value
    if (x < 0) {
      // deterministic seed from the float bits like the C64 does
      let s = Math.abs(x) * 0x1000;
      this.rndState = ((s * 9301 + 49297) % 233280) / 233280;
      return this.rndState;
    }
    if (x === 0) { this.rndState = (this.m.ti() * 0.00137 + Math.random()) % 1; return this.rndState; }
    // simple LCG based on JS Math.random mixed with state
    this.rndState = (this.rndState * 11 + Math.random()) % 1;
    return this.rndState;
  }
}
