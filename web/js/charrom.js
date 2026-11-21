// Stand-in for the Commodore character ROM (which is not redistributable).
// It is assembled from the game's own font in ddd.chrb, which contains the
// letters, digits and punctuation in the usual screen code positions.
// It is only visible during the very short boot phase before the game's own charsets are active.
export function makeCharRom(disk) {
  const rom = new Uint8Array(4096);
  const f = disk.find('ddd.chrb', 0);
  const src = f ? f.data.subarray(2) : new Uint8Array(2048);
  for (let half = 0; half < 2; half++) {
    for (let i = 0; i < 128 * 8; i++) {
      rom[half * 2048 + i] = src[i] || 0;
      rom[half * 2048 + 1024 + i] = (src[i] || 0) ^ 0xff;
    }
  }
  return rom;
}
