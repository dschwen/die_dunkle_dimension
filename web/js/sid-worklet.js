// SID 6581 emulation running in an AudioWorklet.
// Receives timestamped register writes (in C64 CPU cycles) from the main thread.

const CPU_HZ = 985248;
const RATE_PERIOD = [9, 32, 63, 95, 149, 220, 267, 313, 392, 977, 1954, 3126, 3907, 11720, 19532, 31251];

class Voice {
  constructor() {
    this.acc = 0; this.freq = 0; this.pw = 0; this.ctrl = 0; this.ad = 0; this.sr = 0;
    this.noise = 0x7ffff8; this.env = 0; this.state = 3; // 0 attack 1 decay 2 sustain 3 release
    this.rateCnt = 0; this.expCnt = 0; this.msbRose = false; this.prevMsb = 0;
  }
  gate(on) {
    if (on) { this.state = 0; } else if (this.state !== 3) this.state = 3;
  }
  expPeriod() {
    const e = this.env;
    if (e >= 93) return 1; if (e >= 54) return 2; if (e >= 26) return 4; if (e >= 14) return 8; if (e >= 6) return 16; return 30;
  }
  clockEnv(cycles) {
    let period;
    if (this.state === 0) period = RATE_PERIOD[this.ad >> 4];
    else if (this.state === 1) period = RATE_PERIOD[this.ad & 15];
    else if (this.state === 3) period = RATE_PERIOD[this.sr & 15];
    else return;
    this.rateCnt += cycles;
    while (this.rateCnt >= period) {
      this.rateCnt -= period;
      if (this.state === 0) {
        this.env++;
        if (this.env >= 255) { this.env = 255; this.state = 1; }
      } else if (this.state === 1) {
        if (++this.expCnt >= this.expPeriod()) {
          this.expCnt = 0;
          const sus = (this.sr >> 4) * 17;
          if (this.env > sus) this.env--;
          if (this.env <= sus) { this.state = 2; return; }
        }
      } else if (this.state === 3) {
        if (++this.expCnt >= this.expPeriod()) {
          this.expCnt = 0;
          if (this.env > 0) this.env--;
          if (this.env === 0) return;
        }
      }
    }
  }
  clockOsc(cycles) {
    if (this.ctrl & 8) { this.acc = 0; this.msbRose = false; return; }
    const old = this.acc;
    this.acc = (this.acc + this.freq * cycles) % 0x1000000;
    const wrapped = this.acc < old || this.freq * cycles >= 0x1000000;
    this.msbRose = (!(old & 0x800000) && (this.acc & 0x800000)) || (wrapped && (this.acc & 0x800000));
    // noise: clock on bit 19 rising edges
    let steps = Math.floor((old + this.freq * cycles) / 0x100000) - Math.floor(old / 0x100000);
    steps = Math.min(steps, 8);
    for (let i = 0; i < steps; i++) {
      const b = ((this.noise >> 22) ^ (this.noise >> 17)) & 1;
      this.noise = ((this.noise << 1) | b) & 0x7fffff;
    }
  }
  output(ringSrc) {
    const c = this.ctrl;
    let out = 0xfff, any = false;
    if (c & 0x10) { // triangle
      let msb = this.acc & 0x800000;
      if (c & 4) msb ^= ringSrc.acc & 0x800000;
      const t = ((msb ? ~this.acc : this.acc) >> 11) & 0xfff;
      out &= t; any = true;
    }
    if (c & 0x20) { out &= this.acc >> 12; any = true; }
    if (c & 0x40) { out &= ((this.acc >> 12) >= this.pw || (c & 8)) ? 0xfff : 0; any = true; }
    if (c & 0x80) {
      const n = this.noise;
      const v = (((n >> 20) & 1) << 11) | (((n >> 18) & 1) << 10) | (((n >> 14) & 1) << 9) | (((n >> 11) & 1) << 8) |
        (((n >> 9) & 1) << 7) | (((n >> 5) & 1) << 6) | (((n >> 2) & 1) << 5) | ((n & 1) << 4);
      out &= v; any = true;
    }
    if (!any) return 0;
    return (out - 2048) * this.env / 255;
  }
}

class SidProcessor extends AudioWorkletProcessor {
  constructor() {
    super();
    this.v = [new Voice(), new Voice(), new Voice()];
    this.regs = new Uint8Array(32);
    this.queue = [];
    this.clock = -1;
    this.cps = CPU_HZ / sampleRate;
    this.lp = 0; this.bp = 0;
    this.muted = false;
    this.latency = 0.08 * CPU_HZ;
    this.dc = 0;
    this.port.onmessage = (e) => {
      const d = e.data;
      if (d.type === 'writes') {
        for (const w of d.writes) this.queue.push(w);
        const target = d.now - this.latency;
        if (this.clock < 0 || Math.abs(target - this.clock) > 0.25 * CPU_HZ) {
          this.clock = target;
        } else this.clock += (target - this.clock) * 0.02;
      } else if (d.type === 'mute') this.muted = d.value;
      else if (d.type === 'reset') { this.queue = []; this.clock = -1; for (let i = 0; i < 25; i++) this.write(i, 0); }
    };
  }

  write(r, v) {
    this.regs[r] = v;
    const vi = Math.floor(r / 7), vr = r % 7;
    if (r < 21) {
      const voice = this.v[vi];
      switch (vr) {
        case 0: voice.freq = (voice.freq & 0xff00) | v; break;
        case 1: voice.freq = (voice.freq & 0xff) | (v << 8); break;
        case 2: voice.pw = (voice.pw & 0xf00) | v; break;
        case 3: voice.pw = (voice.pw & 0xff) | ((v & 15) << 8); break;
        case 4: {
          const old = voice.ctrl;
          voice.ctrl = v;
          if ((v & 1) && !(old & 1)) voice.gate(true);
          else if (!(v & 1) && (old & 1)) voice.gate(false);
          if (v & 8) { voice.acc = 0; voice.noise = 0x7ffff8; }
          break;
        }
        case 5: voice.ad = v; break;
        case 6: voice.sr = v; break;
      }
    }
  }

  process(inputs, outputs) {
    const out = outputs[0][0];
    if (!out) return true;
    const cps = this.cps;
    const R = this.regs;
    for (let i = 0; i < out.length; i++) {
      if (this.clock >= 0) {
        this.clock += cps;
        while (this.queue.length && this.queue[0][0] <= this.clock) {
          const w = this.queue.shift();
          this.write(w[1], w[2]);
        }
      }
      const [v0, v1, v2] = this.v;
      for (let k = 0; k < 3; k++) { this.v[k].clockOsc(cps); this.v[k].clockEnv(cps); }
      // hard sync
      if ((v0.ctrl & 2) && v2.msbRose) v0.acc = 0;
      if ((v1.ctrl & 2) && v0.msbRose) v1.acc = 0;
      if ((v2.ctrl & 2) && v1.msbRose) v2.acc = 0;
      const o0 = v0.output(v2), o1 = v1.output(v0), o2 = (R[0x18] & 0x80) && !(R[0x17] & 4) ? 0 : v2.output(v1);
      const filt = R[0x17];
      let fin = 0, direct = 0;
      if (filt & 1) fin += o0; else direct += o0;
      if (filt & 2) fin += o1; else direct += o1;
      if (filt & 4) fin += o2; else direct += o2;
      // state variable filter
      const fc = (R[0x15] & 7) | (R[0x16] << 3);
      const fhz = 30 + fc * 5.8;
      const w = Math.min(1.4, 2 * Math.sin(Math.PI * Math.min(fhz, sampleRate / 4) / sampleRate));
      const res = R[0x17] >> 4;
      const q = 1.0 / (0.707 + res * 0.15);
      const hp = fin - this.lp - q * this.bp;
      this.bp += w * hp;
      this.lp += w * this.bp;
      let f = 0;
      const mode = R[0x18];
      if (mode & 0x10) f += this.lp;
      if (mode & 0x20) f += this.bp;
      if (mode & 0x40) f += hp;
      const vol = R[0x18] & 15;
      let s = (f + direct) * vol / 15 / 6144;
      // simple DC blocker
      this.dc += (s - this.dc) * 0.0005;
      s -= this.dc;
      out[i] = this.muted ? 0 : Math.max(-1, Math.min(1, s * 0.9));
    }
    for (let c = 1; c < outputs[0].length; c++) outputs[0][c].set(out);
    return true;
  }
}

registerProcessor('sid-processor', SidProcessor);
