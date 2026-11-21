// VIC-II renderer: renders the 320x200 display window line by line from the
// current register state (so mid-frame register changes are honoured).

export const PALETTE = [
  [0, 0, 0], [255, 255, 255], [104, 55, 43], [112, 164, 178], [111, 61, 134], [88, 141, 67], [53, 40, 121], [184, 199, 111],
  [111, 79, 37], [67, 57, 0], [154, 103, 89], [68, 68, 68], [108, 108, 108], [154, 210, 132], [108, 94, 181], [149, 149, 149],
];
const PAL32 = PALETTE.map(([r, g, b]) => (255 << 24) | (b << 16) | (g << 8) | r); // little endian RGBA

export const RASTER_LINES = 312;
export const CYCLES_PER_LINE = 63;
export const FIRST_LINE = 51; // first raster line of the 200-line display window

export class VIC {
  constructor(machine) {
    this.m = machine;
    this.regs = new Uint8Array(64);
    this.fb = new Uint32Array(320 * 200);
    this.lineBuf = new Uint8Array(320 + 64); // colour indices
    this.prio = new Uint8Array(320 + 64);     // foreground mask for sprite priority
    this.regs[0x11] = 0x1b; this.regs[0x16] = 0xc8; this.regs[0x18] = 0x15;
    this.regs[0x20] = 14; this.regs[0x21] = 6;
    this.irqStatus = 0;
  }

  read(r) {
    r &= 0x3f;
    const raster = this.m.rasterLine();
    if (r === 0x11) return (this.regs[0x11] & 0x7f) | ((raster & 0x100) >> 1);
    if (r === 0x12) return raster & 0xff;
    if (r === 0x19) return this.irqStatus | (this.irqStatus & this.regs[0x1a] ? 0x80 : 0) | 0x70;
    if (r === 0x1a) return this.regs[0x1a] | 0xf0;
    if (r === 0x1e || r === 0x1f) { return 0; }
    if (r >= 0x20 && r <= 0x2e) return this.regs[r] | 0xf0;
    if (r > 0x2e) return 0xff;
    return this.regs[r];
  }

  write(r, v) {
    r &= 0x3f;
    if (r === 0x19) { this.irqStatus &= ~v & 0x0f; return; }
    this.regs[r] = v;
  }

  rasterCompare() { return this.regs[0x12] | ((this.regs[0x11] & 0x80) << 1); }

  bank() { return (3 - (this.m.cia2PortA() & 3)) * 0x4000; }

  // read memory as the VIC sees it (14-bit address within bank)
  vread(a) {
    const bank = this.bank();
    if ((bank === 0 || bank === 0x8000) && (a & 0x3000) === 0x1000) return this.m.charRom[a & 0x0fff];
    return this.m.ram[bank + (a & 0x3fff)];
  }

  renderLine(raster) {
    const y = raster - FIRST_LINE;
    if (y < 0 || y >= 200) return;
    const R = this.regs;
    const d011 = R[0x11], d016 = R[0x16], d018 = R[0x18];
    const border = R[0x20] & 15, bg0 = R[0x21] & 15;
    const out = this.fb;
    const o = y * 320;
    const lb = this.lineBuf, pr = this.prio;
    if (!(d011 & 0x10)) { // display disabled
      for (let x = 0; x < 320; x++) out[o + x] = PAL32[border];
      return;
    }
    const yscroll = d011 & 7, xscroll = d016 & 7;
    const cy = raster - (0x30 + yscroll);
    const bmm = d011 & 0x20, ecm = d011 & 0x40, mcm = d016 & 0x10;
    const screenBase = (d018 >> 4) * 0x400;
    const ram = this.m.ram, color = this.m.colorRam;
    lb.fill(bg0); pr.fill(0);
    if (cy >= 0 && cy < 200) {
      const row = cy >> 3, line = cy & 7;
      if (bmm) {
        const bmBase = (d018 & 8) ? 0x2000 : 0;
        for (let cx = 0; cx < 40; cx++) {
          const sc = this.vread(screenBase + row * 40 + cx);
          const bits = this.vread(bmBase + (row * 40 + cx) * 8 + line);
          const px = cx * 8 + xscroll;
          if (mcm) {
            const cols = [bg0, sc >> 4, sc & 15, color[row * 40 + cx] & 15];
            for (let i = 0; i < 4; i++) {
              const v = (bits >> (6 - i * 2)) & 3;
              lb[px + i * 2] = lb[px + i * 2 + 1] = cols[v];
              pr[px + i * 2] = pr[px + i * 2 + 1] = v >= 2 ? 1 : 0;
            }
          } else {
            const fg = sc >> 4, bgc = sc & 15;
            for (let i = 0; i < 8; i++) { const v = (bits >> (7 - i)) & 1; lb[px + i] = v ? fg : bgc; pr[px + i] = v; }
          }
        }
      } else {
        const charBase = ((d018 >> 1) & 7) * 0x800;
        const bgs = [bg0, R[0x22] & 15, R[0x23] & 15, R[0x24] & 15];
        for (let cx = 0; cx < 40; cx++) {
          let ch = this.vread(screenBase + row * 40 + cx);
          const col = color[row * 40 + cx] & 15;
          let bgc = bg0;
          if (ecm) { bgc = bgs[ch >> 6]; ch &= 0x3f; }
          const bits = this.vread(charBase + ch * 8 + line);
          const px = cx * 8 + xscroll;
          if (mcm && (col & 8) && !ecm) {
            const cols = [bg0, bgs[1], bgs[2], col & 7];
            for (let i = 0; i < 4; i++) {
              const v = (bits >> (6 - i * 2)) & 3;
              lb[px + i * 2] = lb[px + i * 2 + 1] = cols[v];
              pr[px + i * 2] = pr[px + i * 2 + 1] = v >= 2 ? 1 : 0;
            }
          } else {
            for (let i = 0; i < 8; i++) { const v = (bits >> (7 - i)) & 1; lb[px + i] = v ? col : bgc; pr[px + i] = v; }
          }
        }
      }
    }
    // sprites
    const en = R[0x15];
    if (en) {
      for (let s = 7; s >= 0; s--) {
        if (!(en & (1 << s))) continue;
        const sy = R[1 + s * 2];
        const yexp = (R[0x17] >> s) & 1;
        let sl = raster - (sy + 1);
        if (sl < 0) continue;
        if (yexp) sl >>= 1;
        if (sl >= 21) continue;
        const sx = R[s * 2] | (((R[0x10] >> s) & 1) << 8);
        const xexp = (R[0x1d] >> s) & 1;
        const mc = (R[0x1c] >> s) & 1;
        const behind = (R[0x1b] >> s) & 1;
        const ptr = this.vread(screenBase + 0x3f8 + s) * 64;
        const scol = R[0x27 + s] & 15;
        const mc0 = R[0x25] & 15, mc1 = R[0x26] & 15;
        const data = (this.vread(ptr + sl * 3) << 16) | (this.vread(ptr + sl * 3 + 1) << 8) | this.vread(ptr + sl * 3 + 2);
        const w = xexp ? 2 : 1;
        for (let i = 0; i < 24; i++) {
          let c = -1;
          if (mc) {
            const v = (data >> (22 - (i & ~1))) & 3;
            if (v === 1) c = mc0; else if (v === 2) c = scol; else if (v === 3) c = mc1;
          } else if ((data >> (23 - i)) & 1) c = scol;
          if (c < 0) continue;
          for (let k = 0; k < w; k++) {
            const x = sx - 24 + i * w + k;
            if (x < 0 || x >= 320) continue;
            if (behind && pr[x]) continue;
            lb[x] = c;
          }
        }
      }
    }
    // narrow display (38 columns / 24 rows) shows border colour
    const csel = d016 & 8, rsel = d011 & 8;
    for (let x = 0; x < 320; x++) out[o + x] = PAL32[lb[x]];
    if (!csel) { for (let x = 0; x < 7; x++) out[o + x] = PAL32[border]; for (let x = 311; x < 320; x++) out[o + x] = PAL32[border]; }
    if (!rsel && (y < 4 || y >= 196)) for (let x = 0; x < 320; x++) out[o + x] = PAL32[border];
  }
}
