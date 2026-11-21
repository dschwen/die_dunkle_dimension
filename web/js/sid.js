// Main-thread side of the SID emulation: batches timestamped register writes
// and forwards them to the AudioWorklet once per emulated frame.

export class SidAudio {
  constructor() {
    this.pending = [];
    this.node = null;
    this.ctx = null;
    this.muted = false;
    this.enabled = true; // false while running in turbo mode
  }

  async start() {
    if (this.ctx) { if (this.ctx.state !== 'running') await this.ctx.resume(); return; }
    const Ctx = window.AudioContext || window.webkitAudioContext;
    if (!Ctx) return;
    this.ctx = new Ctx({ latencyHint: 'interactive' });
    await this.ctx.audioWorklet.addModule(new URL('./sid-worklet.js', import.meta.url));
    this.node = new AudioWorkletNode(this.ctx, 'sid-processor', { outputChannelCount: [2] });
    const gain = this.ctx.createGain();
    gain.gain.value = 0.6;
    this.node.connect(gain).connect(this.ctx.destination);
    this.node.port.postMessage({ type: 'mute', value: this.muted });
  }

  write(reg, val, cycle) {
    if (this.node && this.enabled) this.pending.push([cycle, reg, val]);
  }

  frame(now) {
    if (!this.node) { this.pending.length = 0; return; }
    this.node.port.postMessage({ type: 'writes', writes: this.pending, now });
    this.pending = [];
  }

  setMuted(m) {
    this.muted = m;
    if (this.node) this.node.port.postMessage({ type: 'mute', value: m });
  }

  setEnabled(on, regs) {
    // when leaving turbo mode, resend the current register state
    this.enabled = on;
    if (on && regs && this.node) this.node.port.postMessage({ type: 'writes', writes: [...regs].slice(0, 25).map((v, r) => [0, r, v]), now: 0 });
    if (!on && this.node) this.node.port.postMessage({ type: 'reset' });
  }
}
