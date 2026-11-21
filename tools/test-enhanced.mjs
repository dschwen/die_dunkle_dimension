#!/usr/bin/env node
// Compares the regular and the enhanced edition on the overworld:
//  1. encounter rate: how often the monster spawn check of ddd.asmb passes per move
//  2. rewards: a goblin is placed next to the (strong) hero again and again; every experience and
//     gold change is recorded (positive: kill rewards / loot, negative: flee penalty)
//   node tools/test-enhanced.mjs [frames] [lang]
import { createMachine, runScript } from './headless.mjs';

const frames = +(process.argv[2] || 40000);
const lang = process.argv[3] || 'de';
const KEYS = [0x91, 0x11, 0x9d, 0x1d];
const GOBLIN = 52;

async function play(edition, inject) {
  const m = await createMachine({ lang, edition });
  m.boot();
  await runScript(m, '@400 @300 @200 @1500n@100held\r@100j@200s@300l@400a@200j', 4200);
  const B = m.basic;
  // a strong hero: strength/dexterity/attack/defence 18 and the magic axe
  for (const a of [0xc048, 0xc049, 0xc04c, 0xc04d]) m.ram[a] = 18;
  m.ram[0xc06f] = 1; m.ram[0xc05e] = 16;
  let seed = 7;
  const rnd = (n) => { seed = (seed * 1103515245 + 12345) & 0x7fffffff; return (seed >>> 16) % n; };
  let checks = 0, passes = 0;
  const trap = m.trap.bind(m);
  m.trap = (pc, cpu) => {
    if (pc === 0x16a6) { checks++; if (cpu.a === 0) passes++; } // after "and #mask"
    return trap(pc, cpu);
  };
  let ef = B.vars.get('EF') || 0, gp = B.vars.get('GP') || 0;
  const xp = [], gold = [];
  for (let f = 0; f < frames; f++) {
    const line = B.lines[B.li] ? B.lines[B.li].num : 0;
    const fighting = line >= 57 && line <= 255;
    if (inject && !fighting && f % 200 === 0 && line < 40) {
      m.ram[0xc010] = GOBLIN; m.ram[0xc024] = 1; m.ram[0xc02e] = 0; // right next to the hero
    }
    if (f % 9 === 0 && m.ram[0xc6] === 0) {
      let key = KEYS[rnd(4)];
      const M = B.arrays.get('M'), X = B.arrays.get('X'), Y = B.arrays.get('Y');
      if (fighting && M && X && Y && rnd(4)) { // mostly walk towards the nearest monster and attack
        const hx = B.vars.get('X'), hy = B.vars.get('Y');
        let best = null;
        for (let i = 0; i < M.data.length; i++) {
          if (M.data[i] >= 99 || (M.data[i] === 0 && i > 0)) continue;
          const d = Math.abs(X.data[i] - hx) + Math.abs(Y.data[i] - hy);
          if (d > 0 && (!best || d < best.d)) best = { d, dx: X.data[i] - hx, dy: Y.data[i] - hy };
        }
        if (best) {
          key = Math.abs(best.dx) >= Math.abs(best.dy) ? (best.dx > 0 ? 0x1d : 0x9d) : (best.dy > 0 ? 0x11 : 0x91);
          if (best.d === 1) m.pressKey(0x41); // next to it: "a" (attack) + direction
        }
      }
      m.pressKey(key);
    }
    if (B.vars.has('HP') && B.vars.get('HP') < 40) { B.vars.set('HP', 99); m.ram[0xc04e] = 99; m.ram[0xc04f] = 0; }
    m.ram[0xc05c] = 200; // food
    m.ram[0xc05d] = 0; // poison
    m.runFrame();
    if (m.halted) throw m.halted;
    const e = B.vars.get('EF'), g = B.vars.get('GP');
    if (e !== undefined && e !== ef) { xp.push(e - ef); ef = e; }
    if (g !== undefined && g !== gp) { gold.push(g - gp); gp = g; }
  }
  return { checks, passes, xp, gold };
}

for (const edition of ['regular', 'enhanced']) {
  const a = await play(edition, false);
  console.log(`${edition}: spawn check passed ${a.passes} of ${a.checks} moves (${(100 * a.passes / a.checks).toFixed(1)}%)`);
  const b = await play(edition, true);
  console.log(`  goblin fights - experience changes: ${b.xp.join(' ') || '-'}`);
  console.log(`  goblin fights - gold changes:       ${b.gold.join(' ') || '-'}`);
}
