#!/usr/bin/env python3
"""
Split a first-person dungeon PRG into per-floor JSON and PNG dumps.

The known 3D dungeon files contain a short machine-code stub followed by raw
tile rows. The dragon cave (ddd.mapm) is 12x12 per floor; the vampire-count
dungeon (ddd.mapp) is 20x20 per floor.
"""

import argparse
import json
from pathlib import Path

import png

from utils.dungeon_palette import colour_for


KNOWN_LAYOUTS = {
    "ddd.mapm": (12, 12),
    "ddd.mapp": (20, 20),
}


def parse_args():
    parser = argparse.ArgumentParser(
        description="Split dungeon map PRGs into per-floor JSON/PNG files."
    )
    parser.add_argument(
        "prg",
        nargs="+",
        help="Path(s) to dungeon PRGs (e.g. c64/DDD3/ddd.mapm c64/DDD3/ddd.mapp)",
    )
    parser.add_argument(
        "--stub-bytes",
        type=lambda value: int(value, 0),
        default=0x00B3,
        help="Number of bytes to skip after the load address (default: 0x00B3)",
    )
    parser.add_argument(
        "--width",
        type=int,
        default=None,
        help="Tiles per row (default: inferred for known files, otherwise 12)",
    )
    parser.add_argument(
        "--height",
        type=int,
        default=None,
        help="Rows per full floor (default: same as width)",
    )
    parser.add_argument(
        "--output",
        default="res/dungeons",
        help="Directory for generated files (default: res/dungeons)",
    )
    return parser.parse_args()


def ensure_output_dir(path: Path) -> None:
    path.mkdir(parents=True, exist_ok=True)


def load_payload(prg_path: Path, stub_bytes: int) -> bytes:
    data = prg_path.read_bytes()
    if len(data) <= 2:
        raise RuntimeError(f"{prg_path} does not look like a PRG file.")
    load_address = data[0] | (data[1] << 8)
    if len(data) <= 2 + stub_bytes:
        raise RuntimeError(
            f"{prg_path} only contains {len(data)} bytes but needs more than header + stub."
        )
    payload = data[2 + stub_bytes :]
    if not payload:
        raise RuntimeError(f"{prg_path} has no tile payload after skipping the stub.")
    return load_address, payload


def infer_dimensions(
    prg_path: Path, width: int | None, height: int | None
) -> tuple[int, int]:
    known_width, known_height = KNOWN_LAYOUTS.get(prg_path.name, (12, 12))
    resolved_width = width if width is not None else known_width
    resolved_height = height if height is not None else known_height
    return resolved_width, resolved_height


def chunk_rows(payload: bytes, width: int):
    _, remainder = divmod(len(payload), width)
    if remainder:
        # Ignore trailing partial data but warn the caller.
        print(
            f"Warning: payload size {len(payload)} is not a multiple of row width {width}. "
            f"Ignoring last {remainder} byte(s)."
        )
        payload = payload[: len(payload) - remainder]
    rows = [
        list(payload[row_start : row_start + width])
        for row_start in range(0, len(payload), width)
    ]
    return rows


def write_json(path: Path, rows):
    with path.open("w", encoding="utf-8") as handle:
        json.dump(rows, handle)


def write_png(path: Path, rows, width: int):
    pixel_rows = []
    for row in rows:
        pixel_row = []
        for tile in row:
            r, g, b = colour_for(tile)
            pixel_row.extend((r, g, b))
        pixel_rows.append(pixel_row)
    writer = png.Writer(width, len(rows), greyscale=False, bitdepth=8)
    with path.open("wb") as handle:
        writer.write(handle, pixel_rows)


def split_file(
    prg_path: Path,
    stub_bytes: int,
    width_arg: int | None,
    height_arg: int | None,
    output_dir: Path,
) -> None:
    ensure_output_dir(output_dir)

    width, floor_height = infer_dimensions(prg_path, width_arg, height_arg)
    load_address, payload = load_payload(prg_path, stub_bytes)
    rows = chunk_rows(payload, width)

    if not rows:
        raise RuntimeError(f"{prg_path} did not produce any tile rows.")

    floor_index = 0
    row_cursor = 0
    outputs = []

    stem = prg_path.name.replace(".", "_")

    while row_cursor < len(rows):
        floor_rows = rows[row_cursor : row_cursor + floor_height]
        if not floor_rows:
            break
        label = f"{floor_index:02d}"
        if len(floor_rows) < floor_height:
            label = f"{floor_index:02d}_rows{len(floor_rows):02d}"
        base_name = f"{stem}_{label}"
        json_path = output_dir / f"{base_name}.json"
        png_path = output_dir / f"{base_name}.png"

        write_json(json_path, floor_rows)
        write_png(png_path, floor_rows, width)
        outputs.append((json_path, png_path, len(floor_rows)))

        floor_index += 1
        row_cursor += (
            floor_height if len(floor_rows) == floor_height else len(floor_rows)
        )

    print(
        f"Processed {prg_path} (load address ${load_address:04X}, "
        f"{width}x{floor_height} floors)."
    )
    for json_path, png_path, height in outputs:
        print(f"  wrote {json_path.name} and {png_path.name} ({height} row(s))")


def main():
    args = parse_args()
    output_dir = Path(args.output)
    for file_name in args.prg:
        split_file(
            Path(file_name),
            stub_bytes=args.stub_bytes,
            width_arg=args.width,
            height_arg=args.height,
            output_dir=output_dir,
        )


if __name__ == "__main__":
    main()
