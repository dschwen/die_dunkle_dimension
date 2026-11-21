// PNG (320x200 or 160x200, C64 palette) -> Koala multicolor PRG, for the edited title pictures in art/.
// Mirrors tools/koala.py; only the PNG variants written by PIL / typical editors are supported
// (8 bit RGB/RGBA or palette, non-interlaced).
import zlib from 'zlib';

const PAL = [[0, 0, 0], [255, 255, 255], [104, 55, 43], [112, 164, 178], [111, 61, 134], [88, 141, 67], [53, 40, 121],
  [184, 199, 111], [111, 79, 37], [67, 57, 0], [154, 103, 89], [68, 68, 68], [108, 108, 108], [154, 210, 132], [108, 94, 181],
  [149, 149, 149]];

export function decodePng(buf) {
  if (buf.readUInt32BE(0) !== 0x89504e47) throw new Error('not a PNG');
  let p = 8, w, h, depth, ctype, interlace, plte = null;
  const idat = [];
  while (p < buf.length) {
    const len = buf.readUInt32BE(p), type = buf.toString('ascii', p + 4, p + 8), d = buf.subarray(p + 8, p + 8 + len);
    if (type === 'IHDR') { w = d.readUInt32BE(0); h = d.readUInt32BE(4); depth = d[8]; ctype = d[9]; interlace = d[12]; }
    else if (type === 'PLTE') plte = d;
    else if (type === 'IDAT') idat.push(d);
    else if (type === 'IEND') break;
    p += 12 + len;
  }
  if (depth !== 8 || interlace) throw new Error('unsupported PNG (need 8 bit, non-interlaced)');
  const bpp = { 2: 3, 6: 4, 3: 1, 0: 1, 4: 2 }[ctype];
  const raw = zlib.inflateSync(Buffer.concat(idat));
  const stride = w * bpp, out = Buffer.alloc(h * stride);
  for (let y = 0; y < h; y++) {
    const f = raw[y * (stride + 1)], src = raw.subarray(y * (stride + 1) + 1, (y + 1) * (stride + 1));
    for (let x = 0; x < stride; x++) {
      const a = x >= bpp ? out[y * stride + x - bpp] : 0, b = y ? out[(y - 1) * stride + x] : 0, c = x >= bpp && y ? out[(y - 1) * stride + x - bpp] : 0;
      let v = src[x];
      if (f === 1) v += a; else if (f === 2) v += b; else if (f === 3) v += (a + b) >> 1;
      else if (f === 4) { const pa = Math.abs(b - c), pb = Math.abs(a - c), pc = Math.abs(a + b - 2 * c); v += pa <= pb && pa <= pc ? a : pb <= pc ? b : c; }
      out[y * stride + x] = v & 255;
    }
  }
  const rgb = (x, y) => {
    const o = y * stride + x * bpp;
    if (ctype === 3) return [plte[out[o] * 3], plte[out[o] * 3 + 1], plte[out[o] * 3 + 2]];
    if (ctype === 0 || ctype === 4) return [out[o], out[o], out[o]];
    return [out[o], out[o + 1], out[o + 2]];
  };
  return { w, h, rgb };
}

function nearest([r, g, b]) {
  let best = 0, bd = Infinity;
  PAL.forEach(([R, G, B], i) => { const d = (r - R) ** 2 + (g - G) ** 2 + (b - B) ** 2; if (d < bd) { bd = d; best = i; } });
  return best;
}

// returns { prg: Uint8Array, errors: [] }
export function pngToKoala(buf, addr = 0x6000) {
  const { w, h, rgb } = decodePng(buf);
  if (h !== 200 || (w !== 320 && w !== 160)) throw new Error('picture must be 320x200 or 160x200');
  const step = w / 160;
  const px = [];
  for (let y = 0; y < 200; y++) { const row = []; for (let x = 0; x < 160; x++) row.push(nearest(rgb(x * step, y))); px.push(row); }
  const count = new Array(16).fill(0);
  px.forEach((r) => r.forEach((c) => count[c]++));
  const bg = count.indexOf(Math.max(...count));
  const bm = new Uint8Array(8000), scr = new Uint8Array(1000), col = new Uint8Array(1000), errors = [];
  for (let cy = 0; cy < 25; cy++) {
    for (let cx = 0; cx < 40; cx++) {
      const c = cy * 40 + cx, cnt = new Map();
      for (let l = 0; l < 8; l++) for (let i = 0; i < 4; i++) { const v = px[cy * 8 + l][cx * 4 + i]; cnt.set(v, (cnt.get(v) || 0) + 1); }
      const others = [...cnt.entries()].filter(([k]) => k !== bg).sort((a, b) => b[1] - a[1]).map(([k]) => k);
      if (others.length > 3) errors.push(`cell ${cx},${cy} has ${others.length} colours besides the background`);
      while (others.length < 3) others.push(0);
      const [a, b, d] = others;
      scr[c] = (a << 4) | b; col[c] = d;
      const m = new Map([[bg, 0], [a, 1], [b, 2], [d, 3]]);
      for (let l = 0; l < 8; l++) {
        let v = 0;
        for (let i = 0; i < 4; i++) v |= (m.get(px[cy * 8 + l][cx * 4 + i]) ?? 0) << (6 - 2 * i);
        bm[c * 8 + l] = v;
      }
    }
  }
  const prg = new Uint8Array(10003);
  prg[0] = addr & 255; prg[1] = addr >> 8;
  prg.set(bm, 2); prg.set(scr, 8002); prg.set(col, 9002); prg[10002] = bg;
  return { prg, errors };
}
