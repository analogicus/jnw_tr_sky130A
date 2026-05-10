#!/usr/bin/env python3
"""
Generate resistors_uniform.json from a unit-based template.

Each variant is a fresh GdsPatternHighResistor cell built around a fixed
unit stripe (constant L x W) so all units have the same resistance per
stripe. Variants compose N units side-by-side with M1 wired for either
series (R = N * R_unit) or parallel (R = R_unit / N).

Generated cells:
  RES1                       - single unit, ports top-left (N), bottom-right (P)
  RES2, RES4, RES8, RES16    - N units in series, both ports at top
  RES_P2, RES_P4, RES_P8,    - N units in parallel
  RES_P16

The existing RPPO* wrappers are carried through unchanged - they wrap
the same RES2 / RES4 / RES8 / RES16 names.

Each unit slot is 4 columns wide. Cell width = 4*N + 1 columns. Stripe
positions are col 2, 6, 10, ... (one stripe per slot). DMYPO sits on
the outer left/right edges only.
"""
import json
import os

CIC_DIR = os.path.dirname(os.path.abspath(__file__))
SRC_PATH = os.path.join(CIC_DIR, "resistors.json")
OUT_PATH = os.path.join(CIC_DIR, "resistors_uniform.json")

ROWS = 12  # vertical extent (same as legacy RES2 base pattern)


def stripe_cols(N):
    """Column index of each stripe in an N-unit cell."""
    return [2 + 4 * i for i in range(N)]


def cell_cols(N):
    return 4 * N + 1


def por_rows(N):
    cols = cell_cols(N)
    out = ["-" * cols, "-" * cols]
    for _ in range(ROWS - 2):
        row = ["-"] * cols
        for sc in stripe_cols(N):
            row[sc] = "X"
        out.append("".join(row))
    return out


def dmypo_rows(N):
    cols = cell_cols(N)
    out = ["-" * cols, "-" * cols]
    for _ in range(ROWS - 2):
        row = ["-"] * cols
        row[0] = "X"
        row[cols - 1] = "X"
        out.append("".join(row))
    return out


def cpoxr_rows(N):
    cols = cell_cols(N)
    out = []
    for r in range(ROWS):
        row = ["-"] * cols
        if r in (2, 3, ROWS - 2, ROWS - 1):
            for sc in stripe_cols(N):
                row[sc] = "X"
        out.append("".join(row))
    return out


def m1_rows(N, mode):
    cols = cell_cols(N)
    sc = stripe_cols(N)
    out = []
    for r in range(ROWS):
        row = ["-"] * cols
        if mode == "P":
            # Parallel: full top trunk (with N port) and full bottom trunk
            # (with P port) shared across every stripe; vertical M1 stubs
            # over the top contacts for via reach.
            if r == 0:
                row = ["X"] * cols
                row[0] = "N"
            elif r in (1, 2, 3):
                for c in sc:
                    row[c] = "X"
            elif r in (ROWS - 2, ROWS - 1):
                row = ["X"] * cols
                row[cols - 1] = "P"
        elif mode == "S":
            # Series: N port at top-left, M1 over s1 top, top trunks
            # joining (s2,s3),(s4,s5),..., M1 over sN top, P port at
            # top-right; bottom trunks join (s1,s2),(s3,s4),... .
            if r == 0:
                # N + M1 covering s1 top
                for c in range(sc[0] + 1):
                    row[c] = "X"
                row[0] = "N"
                # top trunks at odd-indexed pairs (s2-s3, s4-s5, ...)
                for k in range((N - 1) // 2):
                    for c in range(sc[2 * k + 1], sc[2 * k + 2] + 1):
                        row[c] = "X"
                # M1 covering sN top + P port
                for c in range(sc[N - 1], cols):
                    row[c] = "X"
                row[cols - 1] = "P"
            elif r in (1, 2, 3):
                for c in sc:
                    row[c] = "X"
            elif r in (ROWS - 2, ROWS - 1):
                # bottom trunks at even-indexed pairs (s1-s2, s3-s4, ...)
                for k in range(N // 2):
                    for c in range(sc[2 * k], sc[2 * k + 1] + 1):
                        row[c] = "X"
        out.append("".join(row))
    return out


def build_variant(name, N, mode):
    return {
        "name": name,
        "class": "Gds::GdsPatternHighResistor",
        "yoffset": -0.5,
        "xoffset": -0.5,
        "polyWidthAdjust": 0,
        "abstract": 0,
        "afterNew": {
            "horizontalGridMultiplier": 1.2,
            "verticalGridMultiplier": 3,
        },
        "beforePlace": {
            "addEnclosuresByRectangle": [
                ["PO", [0, 2, "width", 6], ["OP"]],
                ["PO", ["self"], ["PWT"]],
            ]
        },
        "fillCoordinatesFromStrings": [
            ["POR"]   + por_rows(N),
            ["DMYPO"] + dmypo_rows(N),
            ["CPOXR"] + cpoxr_rows(N),
            ["M1"]    + m1_rows(N, mode),
        ],
    }


def main():
    with open(SRC_PATH) as f:
        src = json.load(f)

    out_cells = []

    # Single unit (parallel mode handles N=1 cleanly: top trunk + bottom trunk).
    out_cells.append(build_variant("RES1", 1, "P"))

    # Series variants (R = N * R_unit). Names match the legacy cells so
    # RPPO2 / RPPO4 / RPPO8 / RPPO16 keep working.
    for N in (2, 4, 8, 16):
        out_cells.append(build_variant(f"RES{N}", N, "S"))

    # Parallel variants (R = R_unit / N).
    for N in (2, 4, 8, 16):
        out_cells.append(build_variant(f"RES_P{N}", N, "P"))

    # Carry RPPO* cells through unchanged.
    for c in src["cells"]:
        if isinstance(c, dict) and c.get("name", "").startswith("RPPO"):
            out_cells.append(c)

    with open(OUT_PATH, "w") as f:
        json.dump({"cells": out_cells}, f, indent=2)


if __name__ == "__main__":
    main()
