// Commodore BASIC V2 tokenizer / detokenizer and the editable text format.
//
// Text format (one BASIC line per text line):  "<linenumber> <code>"
//  - keywords are lower case ("print", "goto" ...)
//  - PETSCII $41-$5A (unshifted letters, lower case on screen) are written a-z
//  - PETSCII $C1-$DA (shifted letters) are written A-Z
//  - the game's charset shows $5B/$5C/$5D as ä/ö/ü; they are written as ä ö ü
//  - $5E -> ^ , $5F -> _
//  - everything else is written as {name} (e.g. {clr} {wht} {rvon}) or {$xx}
// This keeps all German texts directly editable for a translation.

export const KEYWORDS = [
  'end', 'for', 'next', 'data', 'input#', 'input', 'dim', 'read', 'let', 'goto', 'run', 'if', 'restore', 'gosub', 'return',
  'rem', 'stop', 'on', 'wait', 'load', 'save', 'verify', 'def', 'poke', 'print#', 'print', 'cont', 'list', 'clr', 'cmd', 'sys',
  'open', 'close', 'get', 'new', 'tab(', 'to', 'fn', 'spc(', 'then', 'not', 'step', '+', '-', '*', '/', '^', 'and', 'or', '>',
  '=', '<', 'sgn', 'int', 'abs', 'usr', 'fre', 'pos', 'sqr', 'rnd', 'log', 'exp', 'cos', 'sin', 'tan', 'atn', 'peek', 'len',
  'str$', 'val', 'asc', 'chr$', 'left$', 'right$', 'mid$', 'go',
];

export const T = {};
KEYWORDS.forEach((k, i) => { T[k.replace(/[($#]/g, (c) => ({ '(': '_', '$': 's', '#': 'h' })[c])] = 0x80 + i; });
// convenient names: T.print, T.prinths (print#), T.tab_ , T.spc_, T.strs ...
T.plus = 0xaa; T.minus = 0xab; T.mul = 0xac; T.div = 0xad; T.pow = 0xae; T.gt = 0xb1; T.eq = 0xb2; T.lt = 0xb3; T.pi = 0xff;

// keyword table as PETSCII bytes (last char | 0x80) for crunching
const KW_BYTES = KEYWORDS.map((k) => {
  const b = [...k].map((c) => asciiToPetsciiPlain(c));
  b[b.length - 1] |= 0x80;
  return b;
});

function asciiToPetsciiPlain(c) {
  const o = c.charCodeAt(0);
  if (o >= 0x61 && o <= 0x7a) return o - 0x20; // a-z -> $41-$5A
  return o;
}

const CTRL_NAMES = {
  0x03: 'stop', 0x05: 'wht', 0x08: 'dish', 0x09: 'ensh', 0x0a: 'lf', 0x0d: 'cr', 0x0e: 'swlc', 0x11: 'down', 0x12: 'rvon',
  0x13: 'home', 0x14: 'del', 0x1c: 'red', 0x1d: 'rght', 0x1e: 'grn', 0x1f: 'blu', 0x81: 'orng', 0x85: 'f1', 0x86: 'f3',
  0x87: 'f5', 0x88: 'f7', 0x89: 'f2', 0x8a: 'f4', 0x8b: 'f6', 0x8c: 'f8', 0x8d: 'sret', 0x8e: 'swuc', 0x90: 'blk', 0x91: 'up',
  0x92: 'rvof', 0x93: 'clr', 0x94: 'inst', 0x95: 'brn', 0x96: 'lred', 0x97: 'gry1', 0x98: 'gry2', 0x99: 'lgrn', 0x9a: 'lblu',
  0x9b: 'gry3', 0x9c: 'pur', 0x9d: 'left', 0x9e: 'yel', 0x9f: 'cyn', 0xa0: 'sspc',
};
const NAME_CTRL = {};
for (const [k, v] of Object.entries(CTRL_NAMES)) NAME_CTRL[v] = +k;

// PETSCII byte -> text fragment (used inside strings/REM/DATA and for raw bytes)
export function petsciiToText(b) {
  if (b >= 0x41 && b <= 0x5a) return String.fromCharCode(b + 0x20);
  if (b >= 0xc1 && b <= 0xda) return String.fromCharCode(b - 0x80);
  if (b === 0x5b) return 'ä';
  if (b === 0x5c) return 'ö';
  if (b === 0x5d) return 'ü';
  if (b === 0x5e) return '^';
  if (b === 0x5f) return '_';
  if (b >= 0x20 && b <= 0x40) return String.fromCharCode(b);
  if (CTRL_NAMES[b]) return '{' + CTRL_NAMES[b] + '}';
  return '{$' + b.toString(16).padStart(2, '0') + '}';
}

// text -> PETSCII bytes (no tokenizing)
export function textToPetscii(s) {
  const out = [];
  for (let i = 0; i < s.length; i++) {
    const c = s[i];
    if (c === '{') {
      const j = s.indexOf('}', i);
      if (j < 0) throw new Error('unterminated { in ' + s);
      const name = s.slice(i + 1, j);
      let rep = 1, nm = name;
      const m = /^(\d+)\s+(.*)$/.exec(name); // {3 down} repeat syntax
      if (m) { rep = +m[1]; nm = m[2]; }
      let code;
      if (nm[0] === '$') code = parseInt(nm.slice(1), 16);
      else if (nm in NAME_CTRL) code = NAME_CTRL[nm];
      else throw new Error('unknown escape {' + name + '}');
      for (let r = 0; r < rep; r++) out.push(code);
      i = j;
      continue;
    }
    const o = c.charCodeAt(0);
    if (o >= 0x61 && o <= 0x7a) out.push(o - 0x20);
    else if (o >= 0x41 && o <= 0x5a) out.push(o + 0x80);
    else if (c === 'ä') out.push(0x5b);
    else if (c === 'ö') out.push(0x5c);
    else if (c === 'ü') out.push(0x5d);
    else if (c === '^') out.push(0x5e);
    else if (c === '_') out.push(0x5f);
    else if (o >= 0x20 && o <= 0x40) out.push(o);
    else throw new Error(`character '${c}' (${o}) not representable in: ${s}`);
  }
  return out;
}

// Crunch PETSCII line bytes into tokenized form (faithful to the C64 ROM algorithm)
export function crunch(bytes) {
  const out = [];
  let i = 0, quote = false, data = false;
  while (i < bytes.length) {
    const c = bytes[i];
    if (quote) { out.push(c); if (c === 0x22) quote = false; i++; continue; }
    if (c === 0x22) { quote = true; out.push(c); i++; continue; }
    if (data) { out.push(c); if (c === 0x3a) data = false; i++; continue; }
    if (c >= 0x80) { out.push(c); i++; continue; }
    if (c === 0x20) { out.push(c); i++; continue; }
    if (c === 0x3f) { out.push(T.print); i++; continue; } // '?'
    if (c >= 0x30 && c < 0x3c) { out.push(c); i++; continue; }
    // try keywords
    let tok = -1, len = 0;
    for (let k = 0; k < KW_BYTES.length && tok < 0; k++) {
      const kw = KW_BYTES[k];
      let j = 0;
      for (;;) {
        if (i + j >= bytes.length) break;
        const d = (bytes[i + j] - kw[j]) & 0xff;
        if (d === 0) { j++; if (j >= kw.length) break; continue; }
        if (d === 0x80) { tok = 0x80 + k; len = j + 1; }
        break;
      }
    }
    if (tok < 0) { out.push(c); i++; continue; }
    out.push(tok);
    i += len;
    if (tok === T.rem) { while (i < bytes.length) out.push(bytes[i++]); }
    if (tok === T.data) data = true;
  }
  return out;
}

// Detokenize line bytes into the text format
export function detokenizeLine(bytes) {
  let s = '', quote = false, raw = false, data = false;
  for (const b of bytes) {
    if (raw) { s += petsciiToText(b); continue; }
    if (quote) { s += petsciiToText(b); if (b === 0x22) quote = false; continue; }
    if (b === 0x22) { quote = true; s += '"'; continue; }
    if (data) { s += petsciiToText(b); if (b === 0x3a) data = false; continue; }
    if (b >= 0x80 && b <= 0xcb) {
      s += KEYWORDS[b - 0x80];
      if (b === T.rem) raw = true;
      if (b === T.data) data = true;
      continue;
    }
    if (b === 0xff) { s += '{$ff}'; continue; }
    s += petsciiToText(b);
  }
  return s;
}

// Parse a tokenized PRG (with 2-byte load address) into [{num, code:Uint8Array}]
export function parsePrg(bytes) {
  const start = bytes[0] | (bytes[1] << 8);
  const lines = [];
  let p = 2;
  for (;;) {
    if (p + 1 >= bytes.length) break;
    const link = bytes[p] | (bytes[p + 1] << 8);
    if (link === 0) break;
    const num = bytes[p + 2] | (bytes[p + 3] << 8);
    let e = p + 4;
    while (e < bytes.length && bytes[e] !== 0) e++;
    lines.push({ num, code: Uint8Array.from(bytes.slice(p + 4, e)) });
    p = e + 1;
  }
  return { start, lines };
}

export function prgToText(bytes) {
  return parsePrg(bytes).lines.map((l) => `${l.num} ${detokenizeLine(l.code)}`).join('\n') + '\n';
}

// Parse text source into lines [{num, code}] (tokenized)
export function textToLines(text) {
  const lines = [];
  for (const raw of text.split(/\r?\n/)) {
    if (!raw.trim()) continue;
    if (raw.startsWith('#')) continue; // comment lines (not part of the program)
    const m = /^\s*(\d+) ?(.*)$/.exec(raw);
    if (!m) throw new Error('bad line: ' + raw);
    lines.push({ num: +m[1], code: Uint8Array.from(crunch(textToPetscii(m[2]))) });
  }
  lines.sort((a, b) => a.num - b.num);
  return lines;
}

// Build PRG bytes for given lines at a load address (to place the program into C64 RAM)
export function linesToPrgBody(lines, start) {
  const out = [];
  let addr = start;
  for (const l of lines) {
    const len = 4 + l.code.length + 1;
    const next = addr + len;
    out.push(next & 0xff, next >> 8, l.num & 0xff, l.num >> 8, ...l.code, 0);
    addr = next;
  }
  out.push(0, 0);
  return out;
}
