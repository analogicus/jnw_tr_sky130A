#!/usr/bin/env python3
"""
Generate resistors_uniform.json with widened RES2/4/8/16 cells.

The hand-curated abstract patterns in resistors.json grow column count
per variant via inherit + copyColumns at runtime. This generator
simulates the same copyColumns chain in Python to get the per-variant
runtime pattern, then dash-pads each layer symmetrically so the cell
widths approximately match multiples of the rey_atr transistor unit
(~88 800 nm): RES2/RES4 ~ 1x, RES8 ~ 2x, RES16 ~ 3x. The output cells
are concrete (no inherit, no copyColumns).

Pad counts are estimates based on the ~3 600 nm per added base column
observed in the previous build. Adjust if the rebuilt widths drift too
far from target.
"""
import json
import os

CIC_DIR = os.path.dirname(os.path.abspath(__file__))
SRC_PATH = os.path.join(CIC_DIR, "resistors.json")
OUT_PATH = os.path.join(CIC_DIR, "resistors_uniform.json")

# RES2's own copyColumns chain (always applied first).
RES2_OWN_OPS = [
    {"count": 1, "offset": 1, "length": 1},
    {"count": 1, "offset": 4, "length": 1},
    {"count": 1, "offset": 7, "length": 1},
]

# Per-variant: extra copyColumns on top of RES2_OWN_OPS, plus pad count
# (number of dashes added across both sides combined).
VARIANTS = [
    ("RES2",  [],                                                  10),
    ("RES4",  [{"count": 1, "offset": 1, "length": 6}],             4),
    ("RES8",  [{"count": 3, "offset": 1, "length": 6}],            17),
    ("RES16", [{"count": 7, "offset": 1, "length": 6}],            18),
]


def apply_copy_columns(s, ops):
    """Apply ciccreator-style copyColumns to a pattern row.

    Each op: extract substring s[offset:offset+length] once, then insert
    it at position (default = offset) count times. Matches the reference
    implementation in ciccreator/cic-core/src/core/patterntile.cpp.
    """
    for op in ops:
        offset = op["offset"]
        length = op["length"]
        position = op.get("position", offset)
        count = op["count"]
        if offset > len(s):
            continue  # ciccreator warns and skips
        block = s[offset:offset + length]
        for _ in range(count):
            s = s[:position] + block + s[position:]
    return s


def pad_row(row, pad_left, pad_right):
    """Symmetric dash-pad. Bulk substrate everywhere on the new edges.

    Note: 'N' / 'P' port markers and 'X' DMYPO edge markers stay at
    their original position, which means after padding they sit just
    inside the new cell edge rather than on it. If routing or DRC
    complains about that, switch to a marker-aware pad here.
    """
    return "-" * pad_left + row + "-" * pad_right


def expand_layer(layer_entry, ops, pad):
    layer = layer_entry[0]
    pad_left = pad // 2
    pad_right = pad - pad_left
    rows = [pad_row(apply_copy_columns(r, ops), pad_left, pad_right)
            for r in layer_entry[1:]]
    return [layer] + rows


def build_concrete(name, base_cell, variant_ops, pad):
    cell = {"name": name}
    for f in ("class", "yoffset", "xoffset", "polyWidthAdjust", "beforePlace"):
        if f in base_cell:
            cell[f] = base_cell[f]

    src_after = base_cell.get("afterNew", {})
    new_after = {}
    for f in ("horizontalGridMultiplier", "verticalGridMultiplier"):
        if f in src_after:
            new_after[f] = src_after[f]
    if new_after:
        cell["afterNew"] = new_after

    all_ops = RES2_OWN_OPS + variant_ops
    cell["fillCoordinatesFromStrings"] = [
        expand_layer(le, all_ops, pad)
        for le in base_cell["fillCoordinatesFromStrings"]
    ]
    return cell


def main():
    with open(SRC_PATH) as f:
        src = json.load(f)
    cells = {c["name"]: c for c in src["cells"] if isinstance(c, dict) and "name" in c}
    res2_base = cells["RES2"]

    out_cells = []
    for name, variant_ops, pad in VARIANTS:
        out_cells.append(build_concrete(name, res2_base, variant_ops, pad))

    # Carry RPPO* cells through unchanged - they wrap the RES* cells via SPICE.
    for c in src["cells"]:
        if isinstance(c, dict) and c.get("name", "").startswith("RPPO"):
            out_cells.append(c)

    with open(OUT_PATH, "w") as f:
        json.dump({"cells": out_cells}, f, indent=2)


if __name__ == "__main__":
    main()
