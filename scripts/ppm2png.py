#!/usr/bin/env python3
"""Convert the text PPM frames written by tb_la_top to PNG.

usage: python3 scripts/ppm2png.py frame_overview.ppm [more.ppm ...]
Needs Pillow (pip install pillow).
"""
import sys
from PIL import Image


def convert(path):
    with open(path) as f:
        tokens = f.read().split()
    assert tokens[0] == "P3", "not a text PPM"
    w, h, maxval = int(tokens[1]), int(tokens[2]), int(tokens[3])
    vals = [int(t) * 255 // maxval for t in tokens[4:4 + w * h * 3]]
    img = Image.frombytes("RGB", (w, h), bytes(vals))
    out = path.rsplit(".", 1)[0] + ".png"
    img.save(out)
    print("wrote", out)


if __name__ == "__main__":
    for p in sys.argv[1:]:
        convert(p)
