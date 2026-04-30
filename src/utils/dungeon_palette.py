"""
Shared colour palette for dungeon visualisations.

The palette assigns a vivid RGB tuple to the tile identifiers that show up in
the 3D dungeon data (both the 12x12 floor maps and the column-record maps).
"""

from __future__ import annotations

from typing import Dict, Tuple

TileColour = Tuple[int, int, int]

_COLOURS: Dict[int, TileColour] = {
    0: (250, 242, 200),  # empty corridor
    1: (138, 43, 226),   # solid wall
    2: (255, 140, 0),    # closed door
    3: (220, 20, 60),    # ladder up / exit branch
    4: (255, 105, 180),  # ladder down / default climb branch
    5: (64, 224, 208),   # locked gate / magical barrier
    6: (0, 128, 128),
    7: (65, 105, 225),
    8: (34, 139, 34),
    9: (255, 215, 0),
    10: (205, 133, 63),
    11: (72, 209, 204),
    12: (176, 196, 222),
    13: (238, 130, 238),
    14: (154, 205, 50),
    15: (255, 255, 255),
    16: (240, 128, 128),
    17: (173, 216, 230),
    18: (218, 112, 214),
    19: (255, 182, 193),
    20: (127, 255, 212),
    21: (255, 160, 122),
    23: (175, 238, 238),
    24: (0, 191, 255),
    26: (255, 99, 71),
    28: (199, 21, 133),
    30: (244, 164, 96),
    34: (176, 224, 230),
    51: (64, 244, 184),
    86: (0, 206, 209),
    87: (144, 238, 144),
    89: (255, 127, 80),
    90: (186, 85, 211),
    91: (255, 165, 0),
    92: (135, 206, 250),
    94: (0, 255, 200),
    95: (255, 69, 0),
    96: (102, 205, 170),
    98: (233, 150, 122),
    102: (30, 144, 255),
    103: (255, 20, 147),
    104: (0, 255, 127),
    105: (255, 105, 97),
    113: (199, 244, 100),
    115: (255, 228, 196),
    119: (255, 248, 220),
    120: (210, 180, 140),
}

_DEFAULT_COLOUR: TileColour = (40, 40, 40)


def colour_for(tile: int) -> TileColour:
    """Return the RGB colour to use for a given tile id."""
    return _COLOURS.get(tile, _DEFAULT_COLOUR)


def colour_for_optional(tile: int | None) -> TileColour:
    """Return a colour for a tile or a dim background for empty cells."""
    if tile is None:
        return (10, 10, 15)
    return colour_for(tile)
