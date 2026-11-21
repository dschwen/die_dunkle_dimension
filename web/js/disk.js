// Virtual 1541 drive containing all three game disks plus a save disk backed by IndexedDB.
// The game normally asks to swap disks; here the right disk is picked automatically
// from the area number the loader stores in zero page address 2.

import { textToLines } from './basictext.js';

// BASIC patches applied on top of the original (or translated) sources.
// Keyed by file name -> { lineNumber: 'replacement text' }.
export const PATCHES = {
  // The manual based copy protection asks for a word from the printed manual
  // and otherwise leaves sys5681 broken. The web version skips the question.
  'ddd.prep': { 2000: 'poke5681,169:return' },
};

export function diskForArea(n) {
  if (n >= 3 && n <= 9) return 2;
  if (n >= 12 && n <= 16) return 3;
  return 1;
}

const DB_NAME = 'die-dunkle-dimension';
const STORE = 'saves';

function openDb() {
  return new Promise((resolve, reject) => {
    if (typeof indexedDB === 'undefined') { resolve(null); return; }
    const req = indexedDB.open(DB_NAME, 1);
    req.onupgradeneeded = () => req.result.createObjectStore(STORE);
    req.onsuccess = () => resolve(req.result);
    req.onerror = () => reject(req.error);
  });
}

export class Disk {
  constructor() {
    this.disks = { 1: new Map(), 2: new Map(), 3: new Map() };
    this.saves = new Map();
    this.artOverrides = new Map();
    this.db = null;
  }

  // load everything: fetchFn(path) -> Promise<ArrayBuffer|string>
  // options.edition: 'regular' (original graphics; only texts translated) or 'enhanced' (new graphics)
  async init(base, lang = 'de', fetchBin, fetchText, options = {}) {
    const manifest = JSON.parse(await fetchText(base + 'manifest.json'));
    const jobs = [];
    const edition = options.edition === 'enhanced' ? 'enhanced' : 'regular';
    const art = ((manifest.art || {})[edition] || {})[lang] || [];
    for (const name of art) {
      jobs.push(fetchBin(`${base}bin/${edition}/${lang}/${name}.prg`).then((buf) => { this.artOverrides.set(name, new Uint8Array(buf)); }));
    }
    for (const d of [1, 2, 3]) {
      for (const name of manifest.disks[d]) {
        jobs.push(fetchBin(`${base}bin/disk${d}/${name}.prg`).then((buf) => {
          this.disks[d].set(name, { name, data: new Uint8Array(buf) });
        }));
      }
      for (const name of manifest.basic[d]) {
        jobs.push(this.fetchBasic(base, lang, d, name, fetchText).then((text) => {
          const patches = PATCHES[name];
          let lines = null;
          const entry = {
            name, text,
            data: null,
            basic: () => {
              if (!lines) {
                lines = textToLines(text);
                if (patches) {
                  const extra = Object.entries(patches).map(([n, t]) => `${n} ${t}`).join('\n');
                  const pl = textToLines(extra);
                  for (const p of pl) {
                    const i = lines.findIndex((l) => l.num === p.num);
                    if (i >= 0) lines[i] = p; else lines.push(p);
                  }
                  lines.sort((a, b) => a.num - b.num);
                }
              }
              return lines;
            },
          };
          this.disks[d].set(name, entry);
        }));
      }
    }
    await Promise.all(jobs);
    for (const [name, data] of this.artOverrides) {
      for (const d of [1, 2, 3]) if (this.disks[d].has(name)) this.disks[d].set(name, { name, data });
    }
    try {
      this.db = await openDb();
      if (this.db) await this.loadSaves();
    } catch (e) { console.warn('IndexedDB unavailable', e); }
  }

  async fetchBasic(base, lang, d, name, fetchText) {
    if (lang !== 'de') {
      try { return await fetchText(`${base}basic/${lang}/disk${d}/${name}.bas`); } catch (e) { /* fall back */ }
    }
    return fetchText(`${base}basic/de/disk${d}/${name}.bas`);
  }

  loadSaves() {
    return new Promise((resolve) => {
      const tx = this.db.transaction(STORE, 'readonly');
      const st = tx.objectStore(STORE);
      const req = st.openCursor();
      req.onsuccess = () => {
        const c = req.result;
        if (c) { this.saves.set(c.key, new Uint8Array(c.value)); c.continue(); } else resolve();
      };
      req.onerror = () => resolve();
    });
  }

  persist(name, data) {
    if (!this.db) return;
    const tx = this.db.transaction(STORE, 'readwrite');
    if (data) tx.objectStore(STORE).put(data, name); else tx.objectStore(STORE).delete(name);
  }

  // find a file; 'area' selects which game disk is "inserted"
  find(pattern, area) {
    const re = new RegExp('^' + pattern.replace(/[.+^${}()|[\]\\]/g, '\\$&').replace(/\*.*$/, '.*').replace(/\?/g, '.') + '$');
    for (const [name, data] of this.saves) if (re.test(name)) return { name, data };
    const pref = diskForArea(area);
    for (const d of [pref, 1, 2, 3]) {
      for (const [name, f] of this.disks[d]) if (re.test(name)) return f;
    }
    return null;
  }

  save(name, data) {
    this.saves.set(name, data);
    this.persist(name, data);
  }

  scratch(name) {
    if (this.saves.delete(name)) this.persist(name, null);
  }

  listSaves() { return [...this.saves.keys()].sort(); }
}
