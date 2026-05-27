import argparse
import json
import time
import urllib.parse
import uuid
from pathlib import Path

import requests
from PIL import Image, ImageDraw


SERVER = "http://localhost:8188"
CHECKPOINT = "waiIllustriousSDXL_v170.safetensors"
EXPRESSIONS = {
    "angry": "angry annoyed expression, furrowed brows, sharp intense eyes, tense closed mouth",
    "sad": "sad vulnerable expression, lowered eyebrows, soft worried eyes, small downturned mouth",
    "surprised": "surprised expression, widened eyes, raised eyebrows, small open mouth, startled reaction",
    "blush": "embarrassed blushing expression, shy eyes, flushed cheeks, bashful small smile, flustered attitude",
    "smile": "gentle confident smile, upturned mouth, happy eyes, charming expression",
    "crying": "crying expression, tearful eyes, visible tears, distressed but beautiful face",
    "flustered": "flustered embarrassed expression, nervous eyes, flushed cheeks, uneasy small mouth",
}


def find_base(char, stage):
    for suffix in ("default_v2", "default", "", "neutral"):
        name = f"{char}_{stage}{'_' + suffix if suffix else ''}.png"
        path = Path("game/public/assets/characters") / name
        if path.exists():
            return path
    return None


def post_prompt(prompt, client_id):
    response = requests.post(
        f"{SERVER}/prompt",
        json={"prompt": prompt, "client_id": client_id},
        timeout=60,
    )
    response.raise_for_status()
    return response.json()["prompt_id"]


def wait_history(prompt_id):
    for _ in range(240):
        time.sleep(1)
        response = requests.get(f"{SERVER}/history/{prompt_id}", timeout=30)
        response.raise_for_status()
        data = response.json()
        if prompt_id in data:
            return data[prompt_id]
    raise TimeoutError(f"{prompt_id}: ComfyUI prompt did not finish")


def save_output(history, out_path, original):
    if history.get("status", {}).get("status_str") != "success":
        print(json.dumps(history.get("status"), ensure_ascii=False, indent=2))
        raise RuntimeError("ComfyUI prompt failed")

    image_info = history["outputs"]["7"]["images"][0]
    params = urllib.parse.urlencode(
        {
            "filename": image_info["filename"],
            "subfolder": image_info.get("subfolder", ""),
            "type": image_info.get("type", "output"),
        }
    )
    tmp_path = out_path.with_suffix(".tmp.png")
    tmp_path.write_bytes(requests.get(f"{SERVER}/view?{params}", timeout=60).content)

    generated = Image.open(tmp_path).convert("RGBA")
    if generated.size != original.size:
        generated = generated.resize(original.size, Image.Resampling.LANCZOS)
    generated.putalpha(original.getchannel("A"))
    generated.save(out_path)
    tmp_path.unlink(missing_ok=True)


def upload_image(path):
    upload_name = f"codex_{path.name}"
    with path.open("rb") as file:
        response = requests.post(
            f"{SERVER}/upload/image",
            files={"image": (upload_name, file, "image/png")},
            data={"overwrite": "true", "type": "input"},
            timeout=60,
        )
    response.raise_for_status()
    return response.json().get("name", upload_name)


def build_prompt(char, stage, uploaded, expression, expression_prompt, seed):
    positive = (
        f"anime visual novel character sprite, same {char} {stage} character, preserve exact identity, "
        "same hairstyle, same hair color, same eyes, same outfit, same accessories, same muscular body, "
        "same hands, same pose, same full body framing, only edit the face, high quality anime line art, "
        "clean detailed eyes, "
        + expression_prompt
    )
    negative = (
        "different character, different hairstyle, different clothes, changed body, changed pose, changed hands, "
        "changed accessories, changed muscles, extra limbs, deformed face, bad eyes, asymmetrical eyes, "
        "low quality, blurry, cropped, background, shadow, watermark, text"
    )
    return {
        "1": {"class_type": "LoadImage", "inputs": {"image": uploaded}},
        "2": {"class_type": "CheckpointLoaderSimple", "inputs": {"ckpt_name": CHECKPOINT}},
        "3": {"class_type": "CLIPTextEncode", "inputs": {"clip": ["2", 1], "text": positive}},
        "4": {"class_type": "CLIPTextEncode", "inputs": {"clip": ["2", 1], "text": negative}},
        "5": {"class_type": "UltralyticsDetectorProvider", "inputs": {"model_name": "bbox/face_yolov8m.pt"}},
        "6": {
            "class_type": "FaceDetailer",
            "inputs": {
                "image": ["1", 0],
                "model": ["2", 0],
                "clip": ["2", 1],
                "vae": ["2", 2],
                "guide_size": 640,
                "guide_size_for": True,
                "max_size": 1024,
                "seed": seed,
                "steps": 24,
                "cfg": 6.8,
                "sampler_name": "dpmpp_2m_sde_gpu",
                "scheduler": "karras",
                "positive": ["3", 0],
                "negative": ["4", 0],
                "denoise": 0.42,
                "feather": 10,
                "noise_mask": True,
                "force_inpaint": True,
                "bbox_threshold": 0.30,
                "bbox_dilation": 18,
                "bbox_crop_factor": 2.1,
                "sam_detection_hint": "center-1",
                "sam_dilation": 0,
                "sam_threshold": 0.93,
                "sam_bbox_expansion": 0,
                "sam_mask_hint_threshold": 0.7,
                "sam_mask_hint_use_negative": "False",
                "drop_size": 10,
                "bbox_detector": ["5", 0],
                "wildcard": "",
                "cycle": 1,
                "inpaint_model": False,
                "noise_mask_feather": 20,
                "tiled_encode": False,
                "tiled_decode": False,
            },
        },
        "7": {
            "class_type": "SaveImage",
            "inputs": {"images": ["6", 0], "filename_prefix": f"codex_{char}_{stage}_fd_{expression}"},
        },
    }


def write_contact_sheet(char, stage):
    files = [
        Path(f"game/public/assets/characters/{char}_{stage}_fd_{expression}.png")
        for expression in EXPRESSIONS
    ]
    files = [path for path in files if path.exists()]
    if not files:
        return

    thumbs = []
    for path in files:
        image = Image.open(path).convert("RGBA")
        bg = Image.new("RGBA", image.size, (0, 255, 0, 255))
        bg.alpha_composite(image)
        bg.thumbnail((192, 288), Image.Resampling.LANCZOS)
        canvas = Image.new("RGBA", (192, 324), (24, 24, 24, 255))
        canvas.alpha_composite(bg, ((192 - bg.width) // 2, 0))
        draw = ImageDraw.Draw(canvas)
        draw.text((8, 300), path.stem.replace(f"{char}_{stage}_fd_", ""), fill=(255, 255, 255, 255))
        thumbs.append(canvas)

    sheet = Image.new("RGBA", (192 * len(thumbs), 324), (24, 24, 24, 255))
    for index, thumb in enumerate(thumbs):
        sheet.alpha_composite(thumb, (index * 192, 0))
    sheet.save(Path(f"game/public/assets/characters/{char}_{stage}_fd_contact.png"))


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--char", required=True)
    parser.add_argument("--stages", nargs="+", default=["neutral", "stage1", "stage2"])
    args = parser.parse_args()

    client_id = str(uuid.uuid4())
    char_index_seed = sum(ord(c) for c in args.char) * 1000

    for stage_index, stage in enumerate(args.stages):
        base = find_base(args.char, stage)
        if not base:
            print(f"missing base: {args.char} {stage}", flush=True)
            continue

        uploaded = upload_image(base.resolve())
        original = Image.open(base).convert("RGBA")
        for expression_index, (expression, expression_prompt) in enumerate(EXPRESSIONS.items()):
            out_path = Path(f"game/public/assets/characters/{args.char}_{stage}_fd_{expression}.png").resolve()
            if out_path.exists():
                print(f"skip {out_path.name}", flush=True)
                continue

            seed = 1779890000 + char_index_seed + stage_index * 100 + expression_index
            prompt = build_prompt(args.char, stage, uploaded, expression, expression_prompt, seed)
            prompt_id = post_prompt(prompt, client_id)
            print(f"{args.char} {stage} {expression} {prompt_id}", flush=True)
            history = wait_history(prompt_id)
            save_output(history, out_path, original)
            print(f"saved {out_path}", flush=True)

        write_contact_sheet(args.char, stage)


if __name__ == "__main__":
    main()
