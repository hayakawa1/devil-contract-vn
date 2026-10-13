# Batch-regenerate game art with the Codex CLI image tool. Outputs land in this folder; nothing in public/ is touched.
import subprocess, sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
CODEX = r"C:\Users\hayak\AppData\Local\OpenAI\Codex\bin\2e5e00daee91c61d\codex.exe"
CH = HERE.parent / "public" / "assets" / "characters"
BOY_BACK = "In the foreground left, a high-school boy with short black hair in a dark navy blazer seen from behind (face not visible)."
GREEN = "Background must be a perfectly flat solid pure green (#00FF00) chroma-key color with no shadows, gradients or floor."

JOBS = [
    ("gyaru_stream", ["gyaru_stage1_smile"],
     "Scene: an empty school gym after school, late afternoon light through high windows. A smartphone on a tripod with a ring light in the foreground left. The heroine from the reference (long blonde hair, tanned skin, pink jacket over white blouse with purple bow, purple plaid mini skirt, white loose socks) stands center, very muscular exactly like the reference, doing a confident flexing pose for her livestream with a big bright grin. 16:9 landscape event CG."),
    ("otaku_scienceroom", ["otaku_stage1_default"],
     "Scene: school science prep room at night, shelves of glassware and books, a desk lamp, a whiteboard covered in handwritten formulas and muscle-fiber diagrams. " + BOY_BACK +
     " The heroine from the reference (short messy dark purple hair, glasses, oversized dark gray hoodie jacket with purple stripes, plaid skirt) sits at the desk, very muscular like the reference, writing in a notebook, looking up at him with a small embarrassed smile. A small empty medicine bottle stands on the desk. 16:9 landscape event CG."),
    ("imouto_park", ["imouto_stage1_smile"],
     "Scene: a neighborhood park at sunset, warm orange light, benches and trees. " + BOY_BACK +
     " The heroine from the reference (brown hair in twin tails with pink hair clips, navy blazer, beige vest, purple bow, purple plaid skirt, white socks) runs toward him holding out a small wrapped bag of homemade cookies with both hands, very muscular like the reference, smiling brightly with a blush. 16:9 landscape event CG."),
    ("seitokai_councilroom", ["seitokai_stage1_default"],
     "Scene: student council room at night, long wooden table with stacks of documents, a desk lamp, city lights through the window. " + BOY_BACK +
     " The heroine from the reference (long straight black hair, glasses, dark navy blazer uniform with gold buttons, necktie, pencil skirt, black tights) stands by the window with arms crossed, very muscular like the reference, her stern face softening into a small relieved smile. A red ink stamp and a stamped document lie on the table. 16:9 landscape event CG."),
    ("furyo_station", ["furyo_stage1_default"],
     "Scene: inside a commuter train at sunset, orange light through the windows, blue bench seats. In the foreground left, a high-school boy with short black hair in a dark navy blazer, seated, seen from behind (face not visible). The heroine from the reference (long wavy black hair, dark navy long coat draped over her shoulders with red lining, white shirt, loose red necktie, dark navy trousers) sits right next to him, very muscular like the reference, looking out the window with a quiet shy half-smile, shoulders almost touching. 16:9 landscape event CG."),
    ("kakutogi_handup", ["kakutogi_stage1_smile"],
     "Scene: a martial arts dojo at sunset with tatami floor and wooden walls, warm light through shoji windows. In the foreground left, a boy's hand and forearm in a dark navy blazer sleeve reaching up (first-person view from the floor). The heroine from the reference (brown hair in a high ponytail, tanned skin, black sports top, open black track jacket, white martial arts pants with red side stripe, black belt, hand wraps) is very muscular like the reference and holds out her wrapped hand to help him up, with a proud warm grin. 16:9 landscape event CG."),
    ("harem_gym", ["osananajimi_stage1_smile", "seitokai_stage1_smile", "gyaru_stage1_smile", "otaku_stage1_smile",
                   "kakutogi_stage1_smile", "furyo_stage1_smile", "imouto_stage1_smile"],
     "Scene: a school gym after practice, warm afternoon light. Group shot of exactly seven very muscular high-school girls, each matching one attached reference image (same hair, outfit, skin tone), gathered cheerfully around one ordinary-build boy with short black hair in a dark navy blazer sitting in the middle, facing the viewer with a friendly smile. Left to right: brown side-ponytail girl in white sailor uniform; long black-haired girl in glasses with navy blazer and black tights; blonde tanned girl in pink jacket; short purple-haired girl in glasses and gray hoodie; tanned ponytail girl in black sports top and white martial-arts pants; wavy black-haired girl in long navy coat and red necktie; brown twin-tailed girl in navy blazer and beige vest. Everyone smiling, some flexing playfully. No extra people. 16:9 landscape event CG."),
    ("akuma_neutral", ["akuma_neutral"],
     "Character standing sprite, portrait 2:3. A small cute-but-eerie devil cat creature: round black body, glowing red eyes, small red-tinted horns, bat wings, one long thin tail ending in a heart-shaped tip. Same design as the reference but clean: NO arrows, NO extra lines, only one tail. Floating, centered, full body visible with margin. Sly neutral expression with a thin closed mouth. " + GREEN),
    ("akuma_neutral_smile", ["akuma_neutral"],
     "Character standing sprite, portrait 2:3. The same devil cat creature as the reference (round black body, glowing red eyes, small horns, bat wings, one long thin tail with a heart-shaped tip), same pose and size, but with a wide unsettling grin showing small sharp teeth and narrowed eyes. NO arrows, NO extra lines, only one tail. " + GREEN),
    ("mother_neutral", ["osananajimi_neutral_default"],
     "Character standing sprite, portrait 2:3, full body from head to shoes with margin, centered, same anime art style and line weight as the reference heroine sprite. A gentle Japanese mother in her early forties, ordinary slim build (not muscular), brown hair tied loosely at the nape, brown eyes like the reference girl (her daughter), beige knit cardigan over a cream blouse, long dark gray skirt. Worried, troubled expression, one hand at her chest. " + GREEN),
    ("promo_keyvisual", ["osananajimi_stage1_smile", "seitokai_stage1_default", "gyaru_stage1_smile", "otaku_stage1_default",
                         "kakutogi_stage1_smile", "furyo_stage1_default", "imouto_stage1_smile", "akuma_neutral_smile"],
     "Promotional key visual, 16:9 landscape, dramatic and polished like a game poster. Exactly seven very muscular high-school heroines standing together in a confident group pose, full bodies or from the knees up, each matching one attached heroine reference exactly (same hair, outfit, skin tone): brown side-ponytail girl in white sailor uniform; long black-haired girl in glasses, navy blazer and black tights, arms crossed; blonde tanned girl in pink jacket flexing; short purple-haired girl in glasses and gray hoodie; tanned ponytail girl in black sports top and white martial-arts pants with fists raised; wavy black-haired girl in long navy coat and red necktie; brown twin-tailed girl in navy blazer and beige vest. Above and behind them floats the small black devil cat from the last reference (red eyes, horns, bat wings, one heart-tipped tail) grinning. Background: deep crimson and black magical sky with glowing red contract sigils and a full moon, rim lighting on the girls. No boy, no extra people. Leave the bottom 22 percent of the image as a dark, plain, low-detail area for text overlay. No text, no letters, no logo, no watermark."),
]

HEADER = """Use your built-in image generation tool (not code, not ComfyUI) to create ONE image, then copy it as a PNG file to:
{out}
Do not modify any other files.

Image spec (all-ages, non-sexual, no nudity): anime visual-novel art in the same painterly anime style as the attached reference image(s). Keep each character's face, hair, skin tone and outfit faithful to the references. No text, no watermark.
"""

only = set(sys.argv[1:])
for name, refs, body in JOBS:
    if only and name not in only:
        continue
    out = HERE / f"{name}.png"
    if out.exists():
        print("skip", name, flush=True)
        continue
    prompt = HEADER.format(out=out) + body + "\nWhen done, print the saved file path.\n"
    (HERE / f"prompt_{name}.txt").write_text(prompt, encoding="utf-8")
    cmd = [CODEX, "exec", "--skip-git-repo-check", "-s", "workspace-write", "-C", str(HERE)]
    for r in refs:
        cmd += ["-i", str(CH / f"{r}.webp")]
    cmd.append("-")
    with open(HERE / f"log_{name}.txt", "w", encoding="utf-8") as log:
        rc = subprocess.run(cmd, input=prompt.encode("utf-8"), stdout=log, stderr=subprocess.STDOUT).returncode
    print(name, "exit", rc, "OK" if out.exists() else "MISSING", flush=True)
print("ALLDONE", flush=True)
