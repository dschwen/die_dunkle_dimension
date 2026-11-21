// Gameplay changes of the enhanced edition (the regular edition runs the original game).
//
// Fewer fights, bigger rewards: random encounters are ENCOUNTER_FACTOR times less likely, experience and
// gold won in combat are REWARD_FACTOR times higher. The experience lost when fleeing is unchanged (it is
// computed from the monsters' base values on separate lines that are not patched).
//
// BASIC patches replace code (never text) inside a line, so they work for every translation;
// a patch that does not match is an error (make test checks all languages).

export const REWARD_FACTOR = 10;
export const ENCOUNTER_FACTOR = 2; // integer 1..128

const R = REWARD_FACTOR, E = ENCOUNTER_FACTOR;
// probability literal for BASIC: rarer(.1) -> ".05" for E = 2
const rarer = (p) => String(+(p / E).toPrecision(6)).replace(/^0\./, '.');

// file -> [line, original code, replacement]
export const BASIC_PATCHES = {
  // ---- overworld
  'ddd.twna': [
    // terrain ambushes: bog wights (swamp 10%), bridge trolls (20%), woodwoses (forest 5%)
    [10, 'ifrnd(ti)<.1goto493', `ifrnd(ti)<${rarer(0.1)}goto493`],
    [11, 'ifrnd(ti)<.2goto490', `ifrnd(ti)<${rarer(0.2)}goto490`],
    [12, 'ifrnd(ti)<.05goto492', `ifrnd(ti)<${rarer(0.05)}goto492`],
    // gold of the defeated monsters (paid out in line 256)
    [70, 'theng=1+fnr(20+peek(49241)*(1+mz/16))', `theng=${R}*(1+fnr(20+peek(49241)*(1+mz/16)))`],
    // experience for a monster killed in combat (z2=2: killed by poison, half the points)
    [535, 'l=int((peek(50634+m(i))+.5)/z2)', `l=${R}*int((peek(50634+m(i))+.5)/z2)`],
    // experience for monsters killed by spells (ban undead / magic bomb)
    [334, 'l=peek(50634+j)', `l=${R}*peek(50634+j)`],
    [619, 'l=peek(50634+m(i))', `l=${R}*peek(50634+m(i))`],
  ],
  // ---- dragon cave (12x12 first person dungeon)
  'ddd.twnm': [
    [240, 'iffnr(4)=1thenm=fnr(32)-1', `iffnr(${4 * E})=1thenm=fnr(32)-1`],
    [1710, 'g=fnr(int((p-6178)/144)*4)+1', `g=${R}*(fnr(int((p-6178)/144)*4)+1)`],
    [13110, 'l=int((peek(50596+m)+.5)/z2)', `l=${R}*int((peek(50596+m)+.5)/z2)`],
  ],
  // ---- vampire count (20x20 first person dungeon)
  'ddd.twnp': [
    [240, 'iffnr(5)=1thenm=fnr(32)-1', `iffnr(${5 * E})=1thenm=fnr(32)-1`],
    [1710, 'g=fnr(int((p-6178)/144)*4)+1', `g=${R}*(fnr(int((p-6178)/144)*4)+1)`],
    [13110, 'l=int((peek(50596+m)+.5)/z2)', `l=${R}*int((peek(50596+m)+.5)/z2)`],
  ],
  // ---- skull keep: phantoms / golems ambush on floor tiles
  'ddd.twnq': [
    [102, 'ifq0=11andfnr(21)=7goto400', `ifq0=11andfnr(${21 * E})=7goto400`],
    [13110, 'l=8+ma*2', `l=${R}*(8+ma*2)`],
  ],
  // ---- dragon lair: the dragon is a fixed fight, only the reward changes
  'ddd.twnn': [
    [13140, 'ef=ef+300', `ef=ef+${300 * R}`],
  ],
};

// Machine code: on every overworld move ddd.asmb tests the CIA timer (at $16A1: lda $DC04 /
// and #mask / bne no-spawn). The mask is POKEd into the operand at $16A5 (5797) by ddd.twna lines 1-2
// depending on the game progress (`su`): $80 = 1 in 2 ... more bits = rarer. The load is redirected to
// a helper in the free bytes after ddd.asmb ($17E6-$17FF) that applies the same mask and then only lets
// every ENCOUNTER_FACTOR-th success pass, so the original progression of the encounter rate is kept.
export const BINARY_PATCHES = {
  'ddd.asmb': [
    { addr: 0x16a1, expect: [0xad, 0x04, 0xdc], bytes: [0x20, 0xe7, 0x17] }, // jsr $17E7
    {
      addr: 0x17e7,
      bytes: [
        0xad, 0x04, 0xdc, //       lda $DC04       original random test ...
        0x2d, 0xa5, 0x16, //       and $16A5       ... with the mask the game POKEd
        0xd0, 0x0d, //             bne no
        0xce, 0xff, 0x17, //       dec count
        0x10, 0x08, //             bpl no          only every E-th success spawns
        0xa9, E - 1, //            lda #E-1
        0x8d, 0xff, 0x17, //       sta count
        0xa9, 0x00, //             lda #0          -> and #mask / bne falls through: spawn
        0x60, //                   rts
        0xa9, 0xff, //       no:   lda #$FF        -> no spawn
        0x60, //                   rts
        E - 1, //            count ($17FF)
      ],
    },
  ],
};

export function patchBasicText(name, text) {
  const patches = BASIC_PATCHES[name];
  if (!patches) return text;
  const lines = text.split('\n');
  for (const [num, from, to] of patches) {
    const i = lines.findIndex((l) => l.startsWith(num + ' '));
    if (i < 0 || !lines[i].includes(from)) throw new Error(`enhanced edition: ${name} line ${num} does not contain "${from}"`);
    lines[i] = lines[i].replace(from, to);
  }
  return lines.join('\n');
}

export function patchBinary(name, data) {
  const patches = BINARY_PATCHES[name];
  if (!patches) return data;
  const load = data[0] | (data[1] << 8);
  const end = Math.max(data.length, ...patches.map((p) => p.addr - load + 2 + p.bytes.length));
  const out = new Uint8Array(end);
  out.set(data);
  for (const p of patches) {
    const off = p.addr - load + 2;
    if (p.expect && p.expect.some((b, i) => out[off + i] !== b)) throw new Error(`enhanced edition: unexpected bytes in ${name} at $${p.addr.toString(16)}`);
    out.set(p.bytes, off);
  }
  return out;
}
