#!/usr/bin/env python3
"""
Experimental column-record inspection.

This was used to test a hypothesis that ddd.mapo / ddd.mapq contained packed
first-person dungeon columns. That hypothesis does not currently hold: those
files are 35x43 top-down maps. Keep this tool only as a scratch analyzer for
unknown byte streams, not as a confirmed dungeon decoder.
"""

from __future__ import annotations

import argparse
import json
from collections import Counter, defaultdict
from dataclasses import dataclass
from pathlib import Path
from typing import Iterable, List, Tuple

import png

from utils.dungeon_palette import colour_for_optional


@dataclass
class Record:
    tile: int
    payload: bytes

    def as_dict(self) -> dict:
        return {
            "tile": self.tile,
            "count": len(self.payload),
            "values": [
                {"raw": value, "hi": value >> 4, "lo": value & 0x0F}
                for value in self.payload
            ],
        }


def parse_records(body: bytes) -> Tuple[List[Record], bytes]:
    ptr = 0
    records: List[Record] = []
    while ptr + 1 < len(body):
        tile = body[ptr]
        length = body[ptr + 1]
        ptr += 2
        if ptr + length > len(body):
            # Ran off the end; return what we have and expose the tail.
            return records, body[ptr - 2 :]
        payload = body[ptr : ptr + length]
        ptr += length
        records.append(Record(tile, payload))
    tail = body[ptr:]
    return records, tail


def summarise(records: Iterable[Record]) -> dict:
    tile_counts = Counter()
    nibble_hist_hi = Counter()
    nibble_hist_lo = Counter()
    for record in records:
        tile_counts[record.tile] += len(record.payload)
        for value in record.payload:
            nibble_hist_hi[value >> 4] += 1
            nibble_hist_lo[value & 0x0F] += 1
    return {
        "tiles": tile_counts,
        "hi_nibbles": nibble_hist_hi,
        "lo_nibbles": nibble_hist_lo,
    }


def build_grid(records: Iterable[Record], width: int, depth: int) -> Tuple[List[List[int | None]], float]:
    grid_counts: List[List[Counter]] = [
        [Counter() for _ in range(width)] for _ in range(depth)
    ]
    for record in records:
        tile = record.tile
        for value in record.payload:
            hi = value >> 4
            lo = value & 0x0F
            if hi < depth and lo < width:
                grid_counts[hi][lo][tile] += 1
    populated = 0
    grid: List[List[int | None]] = []
    for hi in range(depth):
        row: List[int | None] = []
        for lo in range(width):
            if grid_counts[hi][lo]:
                tile, _ = grid_counts[hi][lo].most_common(1)[0]
                row.append(tile)
                populated += 1
            else:
                row.append(None)
        grid.append(row)
    coverage = populated / (width * depth)
    return grid, coverage


def convert(path: Path) -> None:
    data = path.read_bytes()
    if len(data) < 2:
        raise RuntimeError(f"{path} is too short to be a PRG.")
    load_address = data[0] | (data[1] << 8)
    records, tail = parse_records(data[2:])

    output_dir = Path("res") / "dungeons"
    output_dir.mkdir(parents=True, exist_ok=True)

    stem = path.name.replace(".", "_")
    json_path = output_dir / f"{stem}.columns.json"
    grid_json_path = output_dir / f"{stem}.grid.json"
    grid_png_path = output_dir / f"{stem}.grid.png"

    with json_path.open("w", encoding="utf-8") as handle:
        json.dump([record.as_dict() for record in records], handle, indent=2)

    summary = summarise(records)

    grid, coverage = build_grid(records, width=16, depth=8)
    with grid_json_path.open("w", encoding="utf-8") as handle:
        json.dump(grid, handle)

    png_rows = []
    for row in grid:
        pixel_row = []
        for tile in row:
            r, g, b = colour_for_optional(tile)
            pixel_row.extend((r, g, b))
        png_rows.append(pixel_row)

    writer = png.Writer(len(png_rows[0]) // 3, len(png_rows), greyscale=False, bitdepth=8)
    with grid_png_path.open("wb") as handle:
        writer.write(handle, png_rows)

    print(f"{path}: load=${load_address:04X}")
    print(f"  records: {len(records)}")
    print(f"  output:  {json_path}")
    print(f"  grid:    {grid_json_path} ({coverage*100:.1f}% cells populated)")
    print(f"  tile totals:")
    for tile, occurrences in summary["tiles"].most_common():
        print(f"    tile {tile}: {occurrences}")
    if tail:
        print(f"  trailing {len(tail)} byte(s) not parsed: {tail[:16]!r}")


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Experimentally inspect [tile, count, values...] byte streams."
    )
    parser.add_argument("files", nargs="+", help="PRG files to decode")
    args = parser.parse_args()

    for file_name in args.files:
        convert(Path(file_name))


if __name__ == "__main__":
    main()
