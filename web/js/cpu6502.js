// MOS 6502/6510 CPU core (documented opcodes) with cycle counting.
// Memory access goes through bus.read(addr) / bus.write(addr, val).
// Traps: bus.trap(pc) is consulted before each instruction; if it returns true
// the trap handler has taken over (it may modify registers / PC).

const C = 1, Z = 2, I = 4, D = 8, B = 16, U = 32, V = 64, N = 128;

export class CPU6502 {
  constructor(bus) {
    this.bus = bus;
    this.a = 0; this.x = 0; this.y = 0; this.s = 0xfd; this.p = U | I; this.pc = 0;
    this.cycles = 0;
    this.halted = false;
    this.buildTables();
  }

  rd(a) { return this.bus.read(a & 0xffff); }
  wr(a, v) { this.bus.write(a & 0xffff, v & 0xff); }
  rdw(a) { return this.rd(a) | (this.rd((a + 1) & 0xffff) << 8); }
  rdwzp(a) { return this.rd(a & 0xff) | (this.rd((a + 1) & 0xff) << 8); }
  push(v) { this.wr(0x100 | this.s, v); this.s = (this.s - 1) & 0xff; }
  pop() { this.s = (this.s + 1) & 0xff; return this.rd(0x100 | this.s); }
  setNZ(v) { this.p = (this.p & ~(N | Z)) | (v & 0x80) | (v ? 0 : Z); return v; }
  getP() { return this.p | U; }

  // Push PC/P and vector through IRQ (no B flag)
  irq() {
    this.push(this.pc >> 8); this.push(this.pc & 0xff);
    this.push((this.p | U) & ~B);
    this.p |= I;
    this.pc = this.rdw(0xfffe);
    this.cycles += 7;
  }

  // Simulate a JSR from "nowhere": push a return address so that RTS lands on retAddr.
  pushReturn(retAddr) {
    const r = (retAddr - 1) & 0xffff;
    this.push(r >> 8); this.push(r & 0xff);
  }

  buildTables() {
    const t = new Array(256).fill(null);
    const self = this;
    // addressing modes return effective address; page cross adds cycle for reads
    const imm = () => self.pc++;
    const zp = () => self.rd(self.pc++);
    const zpx = () => (self.rd(self.pc++) + self.x) & 0xff;
    const zpy = () => (self.rd(self.pc++) + self.y) & 0xff;
    const abs = () => { const a = self.rdw(self.pc); self.pc += 2; return a; };
    const absx = (pen) => () => { const b = self.rdw(self.pc); self.pc += 2; const a = (b + self.x) & 0xffff; if (pen && ((a ^ b) & 0xff00)) self.cycles++; return a; };
    const absy = (pen) => () => { const b = self.rdw(self.pc); self.pc += 2; const a = (b + self.y) & 0xffff; if (pen && ((a ^ b) & 0xff00)) self.cycles++; return a; };
    const indx = () => self.rdwzp(self.rd(self.pc++) + self.x);
    const indy = (pen) => () => { const b = self.rdwzp(self.rd(self.pc++)); const a = (b + self.y) & 0xffff; if (pen && ((a ^ b) & 0xff00)) self.cycles++; return a; };

    const def = (op, cyc, fn) => { t[op] = { cyc, fn }; };
    const rmw = (ops, f) => {
      // ops: [zp, zpx, abs, absx] opcodes, plus accumulator op optional
      const modes = [[zp, 5], [zpx, 6], [abs, 6], [absx(false), 7]];
      ops.forEach((op, i) => { if (op == null) return; const [m, c] = modes[i]; def(op, c, () => { const a = m(); self.wr(a, f(self.rd(a))); }); });
    };
    const load = (ops, set) => {
      const modes = [[imm, 2], [zp, 3], [zpx, 4], [abs, 4], [absx(true), 4], [absy(true), 4], [indx, 6], [indy(true), 5], [zpy, 4]];
      ops.forEach((op, i) => { if (op == null) return; const [m, c] = modes[i]; def(op, c, () => set(self.rd(m()))); });
    };
    const store = (ops, get) => {
      const modes = [[zp, 3], [zpx, 4], [abs, 4], [absx(false), 5], [absy(false), 5], [indx, 6], [indy(false), 6], [zpy, 4]];
      ops.forEach((op, i) => { if (op == null) return; const [m, c] = modes[i]; def(op, c, () => self.wr(m(), get())); });
    };

    const adc = (v) => {
      const a = self.a, c = self.p & C;
      if (self.p & D) {
        let lo = (a & 0x0f) + (v & 0x0f) + c;
        let hi = (a & 0xf0) + (v & 0xf0);
        if (lo > 9) { hi += 0x10; lo += 6; }
        const bin = (a + v + c) & 0xff;
        self.p &= ~(N | V | Z | C);
        if (!bin) self.p |= Z;
        if (hi & 0x80) self.p |= N;
        if (~(a ^ v) & (a ^ hi) & 0x80) self.p |= V;
        if (hi > 0x90) hi += 0x60;
        if (hi > 0xff) self.p |= C;
        self.a = ((hi & 0xf0) | (lo & 0x0f)) & 0xff;
      } else {
        const r = a + v + c;
        self.p &= ~(C | V);
        if (r > 0xff) self.p |= C;
        if (~(a ^ v) & (a ^ r) & 0x80) self.p |= V;
        self.a = self.setNZ(r & 0xff);
      }
    };
    const sbc = (v) => {
      const a = self.a, c = (self.p & C) ? 0 : 1;
      const r = a - v - c;
      if (self.p & D) {
        let lo = (a & 0x0f) - (v & 0x0f) - c;
        let hi = (a & 0xf0) - (v & 0xf0);
        if (lo & 0x10) { lo -= 6; hi -= 0x10; }
        if (hi & 0x100) hi -= 0x60;
        self.p &= ~(C | V);
        if (r >= 0) self.p |= C;
        if ((a ^ v) & (a ^ r) & 0x80) self.p |= V;
        self.setNZ(r & 0xff);
        self.a = ((hi & 0xf0) | (lo & 0x0f)) & 0xff;
      } else {
        self.p &= ~(C | V);
        if (r >= 0) self.p |= C;
        if ((a ^ v) & (a ^ r) & 0x80) self.p |= V;
        self.a = self.setNZ(r & 0xff);
      }
    };
    const cmp = (r, v) => { const d = r - v; self.p = (self.p & ~C) | (d >= 0 ? C : 0); self.setNZ(d & 0xff); };

    // LDA LDX LDY
    load([0xa9, 0xa5, 0xb5, 0xad, 0xbd, 0xb9, 0xa1, 0xb1], (v) => { self.a = self.setNZ(v); });
    load([0xa2, 0xa6, null, 0xae, null, 0xbe, null, null, 0xb6], (v) => { self.x = self.setNZ(v); });
    load([0xa0, 0xa4, 0xb4, 0xac, 0xbc], (v) => { self.y = self.setNZ(v); });
    store([0x85, 0x95, 0x8d, 0x9d, 0x99, 0x81, 0x91], () => self.a);
    store([0x86, null, 0x8e, null, null, null, null, 0x96], () => self.x);
    store([0x84, 0x94, 0x8c], () => self.y);
    load([0x69, 0x65, 0x75, 0x6d, 0x7d, 0x79, 0x61, 0x71], adc);
    load([0xe9, 0xe5, 0xf5, 0xed, 0xfd, 0xf9, 0xe1, 0xf1], sbc);
    load([0x29, 0x25, 0x35, 0x2d, 0x3d, 0x39, 0x21, 0x31], (v) => { self.a = self.setNZ(self.a & v); });
    load([0x09, 0x05, 0x15, 0x0d, 0x1d, 0x19, 0x01, 0x11], (v) => { self.a = self.setNZ(self.a | v); });
    load([0x49, 0x45, 0x55, 0x4d, 0x5d, 0x59, 0x41, 0x51], (v) => { self.a = self.setNZ(self.a ^ v); });
    load([0xc9, 0xc5, 0xd5, 0xcd, 0xdd, 0xd9, 0xc1, 0xd1], (v) => cmp(self.a, v));
    load([0xe0, 0xe4, null, 0xec], (v) => cmp(self.x, v));
    load([0xc0, 0xc4, null, 0xcc], (v) => cmp(self.y, v));
    load([null, 0x24, null, 0x2c], (v) => { self.p = (self.p & ~(N | V | Z)) | (v & (N | V)) | ((self.a & v) ? 0 : Z); });

    const asl = (v) => { self.p = (self.p & ~C) | (v >> 7); return self.setNZ((v << 1) & 0xff); };
    const lsr = (v) => { self.p = (self.p & ~C) | (v & 1); return self.setNZ(v >> 1); };
    const rol = (v) => { const c = self.p & C; self.p = (self.p & ~C) | (v >> 7); return self.setNZ(((v << 1) | c) & 0xff); };
    const ror = (v) => { const c = self.p & C; self.p = (self.p & ~C) | (v & 1); return self.setNZ((v >> 1) | (c << 7)); };
    rmw([0x06, 0x16, 0x0e, 0x1e], asl); def(0x0a, 2, () => { self.a = asl(self.a); });
    rmw([0x46, 0x56, 0x4e, 0x5e], lsr); def(0x4a, 2, () => { self.a = lsr(self.a); });
    rmw([0x26, 0x36, 0x2e, 0x3e], rol); def(0x2a, 2, () => { self.a = rol(self.a); });
    rmw([0x66, 0x76, 0x6e, 0x7e], ror); def(0x6a, 2, () => { self.a = ror(self.a); });
    rmw([0xe6, 0xf6, 0xee, 0xfe], (v) => self.setNZ((v + 1) & 0xff));
    rmw([0xc6, 0xd6, 0xce, 0xde], (v) => self.setNZ((v - 1) & 0xff));

    def(0xe8, 2, () => { self.x = self.setNZ((self.x + 1) & 0xff); });
    def(0xc8, 2, () => { self.y = self.setNZ((self.y + 1) & 0xff); });
    def(0xca, 2, () => { self.x = self.setNZ((self.x - 1) & 0xff); });
    def(0x88, 2, () => { self.y = self.setNZ((self.y - 1) & 0xff); });
    def(0xaa, 2, () => { self.x = self.setNZ(self.a); });
    def(0xa8, 2, () => { self.y = self.setNZ(self.a); });
    def(0x8a, 2, () => { self.a = self.setNZ(self.x); });
    def(0x98, 2, () => { self.a = self.setNZ(self.y); });
    def(0xba, 2, () => { self.x = self.setNZ(self.s); });
    def(0x9a, 2, () => { self.s = self.x; });
    def(0x48, 3, () => self.push(self.a));
    def(0x08, 3, () => self.push(self.p | B | U));
    def(0x68, 4, () => { self.a = self.setNZ(self.pop()); });
    def(0x28, 4, () => { self.p = (self.pop() | U) & ~B; });
    def(0x18, 2, () => { self.p &= ~C; });
    def(0x38, 2, () => { self.p |= C; });
    def(0x58, 2, () => { self.p &= ~I; });
    def(0x78, 2, () => { self.p |= I; });
    def(0xb8, 2, () => { self.p &= ~V; });
    def(0xd8, 2, () => { self.p &= ~D; });
    def(0xf8, 2, () => { self.p |= D; });
    def(0xea, 2, () => {});

    const br = (op, mask, val) => def(op, 2, () => {
      const o = self.rd(self.pc++);
      if (((self.p & mask) !== 0) === val) {
        const t2 = (self.pc + ((o ^ 0x80) - 0x80)) & 0xffff;
        self.cycles += ((t2 ^ self.pc) & 0xff00) ? 2 : 1;
        self.pc = t2;
      }
    });
    br(0x10, N, false); br(0x30, N, true); br(0x50, V, false); br(0x70, V, true);
    br(0x90, C, false); br(0xb0, C, true); br(0xd0, Z, false); br(0xf0, Z, true);

    def(0x4c, 3, () => { self.pc = self.rdw(self.pc); });
    def(0x6c, 5, () => { const a = self.rdw(self.pc); self.pc = self.rd(a) | (self.rd((a & 0xff00) | ((a + 1) & 0xff)) << 8); });
    def(0x20, 6, () => { const a = self.rdw(self.pc); const r = (self.pc + 1) & 0xffff; self.push(r >> 8); self.push(r & 0xff); self.pc = a; });
    def(0x60, 6, () => { const l = self.pop(); const h = self.pop(); self.pc = (((h << 8) | l) + 1) & 0xffff; });
    def(0x40, 6, () => { self.p = (self.pop() | U) & ~B; const l = self.pop(); const h = self.pop(); self.pc = (h << 8) | l; });
    def(0x00, 7, () => {
      const r = (self.pc + 1) & 0xffff; self.push(r >> 8); self.push(r & 0xff);
      self.push(self.p | B | U); self.p |= I; self.pc = self.rdw(0xfffe);
    });
    // a few harmless illegal NOPs
    for (const op of [0x1a, 0x3a, 0x5a, 0x7a, 0xda, 0xfa]) def(op, 2, () => {});
    for (const op of [0x80, 0x82, 0x89, 0xc2, 0xe2]) def(op, 2, () => { self.pc++; });
    for (const op of [0x04, 0x44, 0x64]) def(op, 3, () => { self.pc++; });
    this.ops = t;
  }

  // Execute one instruction. Returns cycles used.
  step() {
    const before = this.cycles;
    if (this.bus.trap && this.bus.trap(this.pc, this)) return this.cycles - before || 6;
    const op = this.rd(this.pc);
    const e = this.ops[op];
    if (!e) {
      this.halted = true;
      throw new Error(`CPU JAM: illegal opcode $${op.toString(16)} at $${this.pc.toString(16)}`);
    }
    this.pc = (this.pc + 1) & 0xffff;
    this.cycles += e.cyc;
    e.fn();
    return this.cycles - before;
  }
}
