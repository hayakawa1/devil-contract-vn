"""
Chroma-key generated sprites (green background) and install them into public/assets/characters.

  python install_sprites.py furyo_stage1_default furyo_stage1_smile ...

Each sprite is scaled so its height and foot line match a reference sprite of the same
character (default: <char>_neutral_default), so switching stages doesn't make her jump in size.
The previous file is backed up to old/ first.
"""
import shutil
import sys
from pathlib import Path

import numpy as np
from PIL import Image

HERE = Path(__file__).resolve().parent
CH = HERE.parent / "public" / "assets" / "characters"
SIZE = (768, 1152)


def key_green(img):
    a = np.asarray(img.convert("RGB")).astype(np.float32)
    r, g, b = a[..., 0], a[..., 1], a[..., 2]
    d = g - np.maximum(r, b)
    alpha = 1 - np.clip((d - 25) / (90 - 25), 0, 1)
    g = np.where(d > 0, np.maximum(r, b), g)  # remove green spill
    return Image.fromarray(np.dstack([r, g, b, alpha * 255]).clip(0, 255).astype(np.uint8), "RGBA")


def bbox(img):
    return img.getchannel("A").point(lambda v: 255 if v > 40 else 0).getbbox()


def install(name, ref_name=None):
    char = name.split("_")[0]
    ref = Image.open(CH / f"{ref_name or char + '_neutral_default'}.webp").convert("RGBA")
    rb = bbox(ref)
    sprite = key_green(Image.open(HERE / f"{name}.png"))
    sb = bbox(sprite)
    crop = sprite.crop(sb)
    scale = (rb[3] - rb[1]) / crop.height
    crop = crop.resize((round(crop.width * scale), round(crop.height * scale)), Image.LANCZOS)
    out = Image.new("RGBA", SIZE, (0, 0, 0, 0))
    cx = (rb[0] + rb[2]) // 2
    out.alpha_composite(crop, (max(0, cx - crop.width // 2), rb[3] - crop.height))
    dst = CH / f"{name}.webp"
    if dst.exists():
        (HERE / "old").mkdir(exist_ok=True)
        backup = HERE / "old" / f"{name}.webp"
        if not backup.exists():
            shutil.copy(dst, backup)
    out.save(dst, "WEBP", quality=90)
    print("installed", dst.name, "scale", round(scale, 3))


if __name__ == "__main__":
    for n in sys.argv[1:]:
        install(n)
