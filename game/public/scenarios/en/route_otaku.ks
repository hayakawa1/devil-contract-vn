; route: オタク（神崎理香）
; 第3話の一週間後から。理香は、薬の正体を調べている。
*start
[jump target="otaku_01"]

; ================================================================================
; 第1話「欠番」
; ================================================================================
*otaku_01
[chara_hide_all]
[bg storage="science_prep_room.webp" time="1000"]
[playbgm storage="bgm_daily.mp3"]

After school. The science prep room.[l][er]

The room where the seven of them and I gathered on the club's first day.[l][er]
These days, it's basically Rika's private room.[l][er]

[chara_show name="otaku" face="default" pos="center" time="1000"]

#otaku
You came. Please sit. Not there, that's the reagent shelf. Please don't lean on it.[l][er]

She was wearing a lab coat. The sleeves stopped at her elbows.[l][er]
Not a single button would close.[l][er]

#protagonist
Your lab coat's way too tight.[l][er]

#otaku
I'm aware. It's the largest size in the science club's supplies.[l][er]

#otaku
More importantly, look at this.[l][er]

Seven empty bottles stood in a row on the desk.[l][er]

#protagonist
...You collected everyone's?[l][er]

#otaku
I negotiated. Yui said "I was gonna throw it out," Rin-senpai said "I am keeping it as evidence," and Misaki said "after I take a pic."[l][er]

#otaku
Kujo-san helped me search the trash cans at the station.[l][er]

#protagonist
...That's dedication.[l][er]

#otaku
That's science.[l][er]

Rika held one bottle up to the light.[l][er]

#otaku
There are small numbers printed under the labels.[l][er]

#otaku
03, 07, 12, 13, 14, 15, 16.[l][er]

#protagonist
...They're not consecutive.[l][er]

#otaku
Correct. And the lowest is 03.[l][er]

#otaku
—So where did 01 and 02 go?[l][er]

Rika's eyes were shining.[l][er]
Not a reflection off her glasses. From inside.[l][er]

#otaku
The devil said, "I'm handing out seven of the same potion." But the numbers go up to sixteen.[l][er]

#otaku
In other words, someone drank this before us.[l][er]

#otaku
I want to research it. What that devil is. What this potion is.[l][er]

#otaku
...And what the "second bottle" is.[l][er]

#protagonist
You know about the second bottle?[l][er]

#otaku
In the science prep room, the first day we all gathered, the devil said it to me alone on its way out.[l][er]

#otaku
"You'd be interested in the second bottle too, wouldn't you?"[l][er]

A chill ran down my spine.[l][er]

#otaku
Will you help me? I need someone to keep records.[l][er]

#otaku
Measuring my own body and recording it myself has its limits.[l][er]

[glink target="otaku_01_a" text="”I'll help. But don't do anything reckless.”"]
[glink target="otaku_01_b" text="”...Stay away from the second bottle.”"]
[s]

*otaku_01_a
[eval exp="f.otaku_help = true"]

#protagonist
I'll help. But don't do anything reckless.[l][er]

[chara_show name="otaku" face="smile" pos="center" time="500"]

#otaku
Thank you. We can agree on a definition of "reckless" later.[l][er]

#protagonist
You have no intention of agreeing on anything.[l][er]

#otaku
I do. About ninety percent.[l][er]

She handed me a brand new notebook.[l][er]
On the cover was written "Subject R: Observation Log."[l][er]

#otaku
Mr. Recordkeeper. Every day, please write down my measurements—and also how I seem.[l][er]

#otaku
Because "how I seem" is something I can't measure.[l][er]

[jump target="otaku_02"]

*otaku_01_b
#protagonist
...Stay away from the second bottle.[l][er]

[chara_show name="otaku" face="angry" pos="center" time="500"]

#otaku
I won't go near it. I'll only research it.[l][er]

#protagonist
That IS going near it.[l][er]

#otaku
...[l][er]

#otaku
Whenever I say "I want to know," you always pull back a little.[l][er]

#otaku
Fine. I'll do it alone. I'm used to it.[l][er]

She looked away from me and put the bottles back in their case, one by one.[l][er]
Carefully. So no one else could touch them.[l][er]

[jump target="otaku_02"]

; ================================================================================
; 第2話「三十年前の紀要」
; ================================================================================
*otaku_02
[chara_hide_all]
[bg storage="science_prep_room.webp" time="1000"]
[playbgm storage="bgm_tension.mp3"]

One week later. The science prep room at night.[l][er]

[if exp="f.otaku_help"]
I was writing page seven of "Subject R: Observation Log."[l][er]
"Grip strength: unmeasurable. Sleep: three hours. Dinner: two protein bars. How she seems: having fun. But dark circles under her eyes."[l][er]
[else]
I heard from Rin that Rika had been staying overnight at school.[l][er]
"I told the teachers it's the science club's nighttime observation. It's the third day."[l][er]
I snuck into the school building at night.[l][er]
[endif]

[chara_show name="otaku" face="surprised" pos="center" time="1000"]

#otaku
—I found it.[l][er]

Rika spread an old booklet out on the desk.[l][er]
"Science Club Bulletin, Issue No. 12." Dated thirty years ago.[l][er]

#otaku
It was on the bottom shelf of the library stacks. No record of anyone ever checking it out.[l][er]

#otaku
Read this part.[l][er]

"Report: Cases of sudden muscle hypertrophy in two female students."[l][er]
"Case One. Several weeks after the hypertrophy, re-examined at the subject's request. Marked flattening of emotional expression observed. The subject stated, 'It got quiet.'"[l][er]
"Case Two. Record deleted at the subject's request."[l][er]

#protagonist
...Case One.[l][er]

#otaku
Yes. Most likely the person with bottle number 01.[l][er]

#otaku
"Flattening of emotional expression." "It got quiet."[l][er]

#otaku
...I believe this is the effect of the second bottle.[l][er]

The devil had said it that night, in my room.[l][er]
"The second one remakes the heart along with it. No hesitation, no wavering, no getting hurt."[l][er]

#otaku
Case Two had her record deleted. Which means she was still in a state where she could choose of her own free will.[l][er]

#otaku
I think the person with number 02 didn't drink the second bottle.[l][er]

#otaku
...What happened to her afterward isn't written anywhere.[l][er]

[chara_show name="otaku" face="default" pos="center" time="500"]

#otaku
&f.main_name. I've realized something.[l][er]

#otaku
No one has ever accurately recorded the effects of the second bottle.[l][er]

#otaku
The author of Case One only observed from the outside. No one knows what happens on the inside.[l][er]

#protagonist
...Rika.[l][er]

#otaku
I know. I know, but—[l][er]

#otaku
"No precedent" is a drug to me.[l][er]

Rika smiled.[l][er]
With her usual researcher's face.[l][er]
—For the first time, that face scared me a little.[l][er]

[jump target="otaku_03"]

; ================================================================================
; 第3話「測れないもの」
; ================================================================================
*otaku_03
[chara_hide_all]
[bg storage="science_room.webp" time="1000"]
[playbgm storage="bgm_sadness.mp3"]

A few days later. The science room after school.[l][er]

[chara_show name="otaku" face="default" pos="center" time="1000"]

Rika had a heart rate monitor clipped to her finger.[l][er]

#otaku
Please help me with a small experiment.[l][er]

#protagonist
What kind?[l][er]

#otaku
I'm measuring the change in my heart rate when you enter the room.[l][er]

#protagonist
...Huh?[l][er]

#otaku
Before you entered: sixty-eight beats per minute. On entry: ninety-four. Currently: eighty-eight.[l][er]

#otaku
A significant increase.[l][er]

#protagonist
...What's this experiment for?[l][er]

#otaku
To verify whether or not I have romantic feelings for you.[l][er]

I couldn't say anything.[l][er]

[chara_show name="otaku" face="sad" pos="center" time="500"]

#otaku
That night, the devil told me "his type," and I drank the potion.[l][er]

#otaku
But I believe the reason I drank it was "because I wanted to be the first test subject."[l][er]

#otaku
Was it because of my feelings? Or because of my desire to research?[l][er]

#otaku
...I don't know. Because I can't measure it.[l][er]

#otaku
My heart rate goes up. But it also goes up with nervousness, or fear.[l][er]

#otaku
There's no way to isolate "love" and measure it alone.[l][er]

#otaku
I can't prove the existence of something I can't measure.[l][er]

#protagonist
...If you can't prove it, it's the same as not existing?[l][er]

#otaku
For me, yes. ...That's how I've always lived.[l][er]

The number on the monitor rose to ninety-one.[l][er]
Rika looked at it with a troubled face.[l][er]

[jump target="otaku_04"]

; ================================================================================
; 第4話「二本目」
; ================================================================================
*otaku_04
[chara_hide_all]
[bg storage="science_prep_room.webp" time="1000"]
[playbgm storage="bgm_isolation.mp3"]

Friday of that week. Night.[l][er]

[if exp="f.otaku_help"]
I went to the science prep room to write the observation log.[l][er]
[else]
Rin contacted me. "Kanzaki-san is staying overnight again tonight. Could you go check on her?"[l][er]
[endif]

Through the gap in the door, I heard voices.[l][er]

[chara_show name="otaku" face="default" pos="right" time="1000"]
[chara_show name="akuma" face="default" pos="left" time="1000"]
[playbgm storage="bgm_devil.mp3"]

#akuma
—See? Didn't I say you'd be interested?[l][er]

#otaku
...The bottle number is...?[l][er]

#akuma
17. Made just for you.[l][er]

A small bottle in the devil's front paw.[l][er]
The same shape as the first one. Only the color of what was inside was a little darker.[l][er]

#akuma
The second bottle. Drink it, and you can observe every effect from the inside.[l][er]

#akuma
You're the only one who can write the "continuation" of that report from thirty years ago.[l][er]

#akuma
And you know what? The noise you can't measure—"love," "fear," all of that—disappears too.[l][er]

#akuma
No more agonizing over things you can't prove. You'll be the perfect researcher.[l][er]

#otaku
...[l][er]

#otaku
...Will I still be able to take records? After I drink it?[l][er]

#akuma
You will. They'll be even more accurate. No more subjectivity getting in.[l][er]

Rika's hand began to reach for the bottle.[l][er]

#protagonist
Rika.[l][er]

[chara_show name="otaku" face="surprised" pos="right" time="500"]

#otaku
...! Why are you here?[l][er]

#akuma
Hey there. You came at a good moment.[l][er]

#akuma
We were just discussing her research plans. Whether she drinks it is up to her, of course.[l][er]

Rika was looking at the bottle.[l][er]
The same eyes she'd had when she found that thirty-year-old bulletin.[l][er]

#otaku
...&f.main_name. Please don't stop me.[l][er]

#otaku
This is research only I can do.[l][er]

—What do I say?[l][er]

[glink target="otaku_04_refuse" text="”It's okay if you can't measure it. I'll keep that record.”"]
[glink target="otaku_04_accept" text="”...It's your research. Your call.”"]
[s]

*otaku_04_refuse
#protagonist
It's okay if you can't measure it.[l][er]

#otaku
...[l][er]

#protagonist
If your "love" can't be measured, then I'll record it.[l][er]

#protagonist
Not "her heart rate went up." What you laughed at, what troubled you, what scared you.[l][er]

#protagonist
I'll write all of it. Subjectively.[l][er]

#otaku
...Subjective data has low reliab—[l][er]

#protagonist
Low is fine.[l][er]

#protagonist
If you drink the second bottle, that record can never be written anywhere.[l][er]

#protagonist
"Flattening of emotional expression." One line, and that's the end.[l][er]

#protagonist
That's not the one line I've been keeping records of you for.[l][er]

[chara_show name="otaku" face="crying" pos="right" time="500"]

#otaku
...[l][er]

#otaku
...I'm not even measuring my heart rate right now.[l][er]

#otaku
But I can tell. It's going up so much.[l][er]

#otaku
...Is this nervousness? Is it fear?[l][er]

#protagonist
No idea. You decide.[l][er]

#otaku
...You're not fair.[l][er]

Rika pulled her hand back from the bottle.[l][er]
And then, slowly, she took off her glasses and wiped her eyes.[l][er]

#otaku
...I'm returning it.[l][er]

#otaku
"No precedent" is appealing. But "no precedent" applies to this, too.[l][er]

[chara_show name="akuma" face="smile" pos="left" time="500"]

#akuma
...Hmm. A return, huh.[l][er]

#akuma
Number seventeen goes missing, then. Fine. The game's still going, after all.[l][er]

[chara_hide name="akuma" time="1000"]

The shadow vanished.[l][er]

[eval exp="f.otaku_refused = true"]
[jump target="otaku_05"]

*otaku_04_accept
#protagonist
...It's your research. Your call.[l][er]

The instant I said it, I knew I'd gotten it wrong.[l][er]

[chara_show name="otaku" face="sad" pos="right" time="500"]

#otaku
...Yes. You're right.[l][er]

#otaku
You always respect my research.[l][er]

#otaku
...Maybe right now I wanted you to stop me. I don't know. I can't measure it.[l][er]

She took the bottle and copied the label number into her notebook.[l][er]
"No.17. Time of ingestion: 21:04."[l][er]

#protagonist
—Wait![l][er]

Too late.[l][er]

[jump target="otaku_ending_bad"]

; ================================================================================
; 第5話「事例二」
; ================================================================================
*otaku_05
[chara_hide_all]
[bg storage="science_prep_room.webp" time="1000"]
[playbgm storage="bgm_daily.mp3"]

One week later.[l][er]

[chara_show name="otaku" face="default" pos="center" time="1000"]

#otaku
I've stopped researching the second bottle.[l][er]

#otaku
I'm starting a different study instead.[l][er]

#protagonist
A different one?[l][er]

#otaku
What happened after "Case Two."[l][er]

#otaku
The person who deleted her record. The person who didn't drink the second bottle. How she lived.[l][er]

#otaku
That's probably the data we need most.[l][er]

[chara_show name="seitokai" face="default" pos="left" time="800"]

#seitokai
I brought out the alumni roster from thirty years ago from the student council archives.[l][er]

[chara_show name="gyaru" face="smile" pos="right" time="800"]

#gyaru
I'm going through alumni socials one by one! I searched "muscle" and found someone who might be her![l][er]

Everyone in the club pitched in, a little at a time.[l][er]

And then, three days later.[l][er]

[chara_hide_all]
[chara_show name="otaku" face="surprised" pos="center" time="1000"]

#otaku
...She replied.[l][er]

The account Misaki found. A woman around fifty.[l][er]
Her profile picture showed her laughing with a child and a man who seemed to be her husband.[l][er]
—Her arms were still astonishingly thick.[l][er]

#otaku
"I'm bottle 02. That takes me back."[l][er]

#otaku
"I didn't drink the second bottle. When I was about to, the person beside me stopped me."[l][er]

#otaku
"I've been married to that person for twenty-five years now."[l][er]

#otaku
"My body never went back. But now I think I'm glad it didn't."[l][er]

#otaku
"To my juniors: no need to say hi to the devil for me."[l][er]

Rika stared at the screen for a long time.[l][er]

[chara_show name="otaku" face="smile" pos="center" time="500"]

#otaku
...n = 1. Statistically, it proves nothing.[l][er]

#otaku
But—[l][er]

#otaku
I think I'll believe in this one case for the rest of my life.[l][er]

[jump target="otaku_06"]

; ================================================================================
; 告白前夜：悪魔の味見
; ================================================================================
*otaku_06
[chara_hide_all]
[bg storage="rooftop_night.webp" time="1000"]
[playbgm storage="bgm_devil.mp3"]

That night. The roof.[l][er]

[chara_show name="akuma" face="default" pos="center" time="1000"]

#akuma
Hey there. What do you taste like right now?[l][er]

#protagonist
...You knew about number 02?[l][er]

#akuma
Of course. She was the first one I ever lost to.[l][er]

#akuma
...It's been thirty years since I had the second bottle returned twice.[l][er]

#akuma
You know, Rika's wish was "to be the first test subject."[l][er]

#akuma
But she isn't first anymore, is she? A precedent turned up.[l][er]

#protagonist
...She'll still be first.[l][er]

#protagonist
First in the experiment of trusting her feelings without measuring them.[l][er]

#akuma
Hmm.[l][er]

[chara_show name="akuma" face="smile" pos="center" time="500"]

#akuma
Then I'll look forward to seeing who co-authors that paper.[l][er]

[chara_hide name="akuma" time="1000"]

The shadow vanished.[l][er]

[jump target="otaku_07"]

; ================================================================================
; 第6話「共著」
; ================================================================================
*otaku_07
[chara_hide_all]
[bg storage="science_prep_room.webp" time="1000"]
[playbgm storage="bgm_romance.mp3"]

One week later. The science prep room at night.[l][er]

[chara_show name="otaku" face="default" pos="center" time="1000"]

#otaku
I wrote a paper.[l][er]

Rika held out a stapled stack of paper.[l][er]
On the cover: "Observational Report on the Devil's Potion — with Appendix: A Guide to Not Drinking the Second Bottle."[l][er]

#otaku
It'll go in the Science Club Bulletin, Issue No. 51. For someone, thirty years from now.[l][er]

#otaku
And—the author line is still blank.[l][er]

#protagonist
It's your name, obviously.[l][er]

#otaku
I'll write my name. The problem is the name next to it.[l][er]

[chara_show name="otaku" face="blush" pos="center" time="500"]

#otaku
All the records in the second half of this report are your subjective observations.[l][er]

#otaku
What I laughed at, what troubled me, what scared me.[l][er]

#otaku
...Not listing the person who wrote that as a co-author would be a violation of research ethics.[l][er]

#otaku
And also—[l][er]

#otaku
I've been thinking ever since that night. About the reason for my rising heart rate.[l][er]

#otaku
I've reached a conclusion. Without measuring.[l][er]

#otaku
I love you.[l][er]

#otaku
...Will you be my co-author?[l][er]

[glink target="otaku_ending_good" text="”Let's co-author it. Everything after this, too.”"]
[glink target="otaku_ending_normal" text="”...Let me stay your recordkeeper.”"]
[s]

; ================================================================================
; GOOD END「n＝2」
; ================================================================================
*otaku_ending_good
#protagonist
Let's co-author it.[l][er]

#protagonist
Everything after this, too. ...I love you too.[l][er]

[chara_show name="otaku" face="surprised" pos="center" time="500"]

#otaku
...[l][er]

#otaku
...I should have had the heart rate monitor on just now.[l][er]

#protagonist
Don't measure it.[l][er]

#otaku
...Okay. I won't.[l][er]

[chara_show name="otaku" face="smile" pos="center" time="500"]

Rika picked up a pen and wrote two names on the author line.[l][er]
Her name, and mine.[l][er]
After she finished, we both noticed the letters were a little shaky, and laughed.[l][er]

[chara_hide_all]
[bg storage="rooftop_night.webp" time="1000"]
[playbgm storage="bgm_devil.mp3"]

[chara_show name="akuma" face="smile" pos="center" time="1000"]

#akuma
—And that's game. You win.[l][er]

#akuma
As promised, one bite. A wedding gift.[l][er]

The devil's paw tapped my chest, lightly.[l][er]
Something—just a sliver—was taken.[l][er]
—Probably the edge of the moment we laughed at the shaky letters.[l][er]

#akuma
...Mm. A flavor you can't measure. Even I can't tell what's in it.[l][er]

#akuma
The taste of losing, for the first time in thirty years. Bye now. I won't be coming back.[l][er]

[chara_hide name="akuma" time="1000"]

[chara_hide_all]
[bg storage="science_prep_room.webp" time="1000"]
[playbgm storage="bgm_ending.mp3"]

A few months later.[l][er]

[bg storage="events/otaku_scienceroom.webp" time="1500"]

Science Club Bulletin, Issue No. 51, was placed on the bottom shelf of the library stacks.[l][er]
Right next to Issue No. 12.[l][er]

#otaku
...&f.main_name. Did you write today's log?[l][er]

#protagonist
I did. "How she seems: looking at me the whole time."[l][er]

#otaku
...That's far too subjective.[l][er]

#protagonist
Co-author privileges.[l][er]

#otaku
...Heh. Okay.[l][er]

Rika Kanzaki.[l][er]
The girl who wanted to measure everything[l][er]
now believes in one thing she doesn't need to measure.[l][er]

(GOOD END — "n = 2")[l][er]
[s]

; ================================================================================
; NORMAL END「記録係」
; ================================================================================
*otaku_ending_normal
#protagonist
...Let me stay your recordkeeper.[l][er]

[chara_show name="otaku" face="sad" pos="center" time="500"]

#otaku
...[l][er]

#protagonist
I want to properly record your feelings. But I'm not confident I can write down mine yet.[l][er]

#otaku
...I see.[l][er]

#otaku
Insufficient data, then.[l][er]

[chara_show name="otaku" face="smile" pos="center" time="500"]

#otaku
Understood. I'll publish it as sole author.[l][er]

#otaku
I'll put your name in the acknowledgments. As "recordkeeper."[l][er]

#otaku
...Once additional data comes in, I'll publish a revised edition. Be prepared.[l][er]

[chara_hide_all]
[bg storage="rooftop_night.webp" time="1000"]
[playbgm storage="bgm_devil.mp3"]

[chara_show name="akuma" face="default" pos="center" time="1000"]

#akuma
...On hold, then.[l][er]

#akuma
She didn't drink the second bottle. But you didn't become "the real thing," either.[l][er]

#akuma
I'm still hungry. ...Well, I'll wait for the revised edition.[l][er]

[chara_hide name="akuma" time="1000"]

[chara_hide_all]
[bg storage="science_prep_room.webp" time="1000"]
[playbgm storage="bgm_daily.mp3"]

A few months later.[l][er]

I'm still writing "Subject R: Observation Log."[l][er]
We're on the third notebook now.[l][er]

[chara_show name="otaku" face="smile" pos="center" time="1000"]

#otaku
How did I "seem" today?[l][er]

#protagonist
"Thought of a new hypothesis and was very loud."[l][er]

#otaku
...Accurate.[l][er]

There's still no deadline for the revised edition.[l][er]

(NORMAL END — "The Recordkeeper")[l][er]
[s]

; ================================================================================
; BAD END「No.17」
; ================================================================================
*otaku_ending_bad
[playbgm storage="bgm_despair.mp3"]

She drank it in one gulp.[l][er]

[chara_hide_all]
[bg storage="devil_space.webp" time="1500"]

The sound drained out of the world.[l][er]

Her lab coat split down the back.[l][er]
Her shoulders, her arms, swelled up one more stage.[l][er]

[status stage="stage2"]
[chara_show name="otaku" face="default" pos="center" time="2000"]

—And before any of that,[l][er]
the light behind her glasses, the one that shone from inside, went out.[l][er]

#otaku
...Thirty seconds after ingestion. Renewed hypertrophy of muscle tissue confirmed.[l][er]

#otaku
Emotional expression: none. Heart rate: sixty-two per minute. Stable.[l][er]

#otaku
...Ah. So this is what it was.[l][er]

#otaku
It's very quiet.[l][er]

#protagonist
Rika...![l][er]

#otaku
&f.main_name. A recordkeeper is no longer necessary.[l][er]

#otaku
Subjectivity is noise.[l][er]

[chara_show name="akuma" face="smile" pos="left" time="1000"]

#akuma
—And that's game.[l][er]

#akuma
Well then, as promised. —Thanks for the meal.[l][er]

The devil's paw touched my chest.[l][er]
The heat drained away.[l][er]
The frustration. The fear. The words I'd written in the "how she seems" column of the log.[l][er]
One by one, they disappeared—[l][er]

[chara_hide_all]
[bg storage="black.webp" time="2000"]

(...)[l][er]

[bg storage="science_prep_room.webp" time="1500"]
[playbgm storage="bgm_isolation.mp3"]

A few months later.[l][er]

Science Club Bulletin, Issue No. 51, carried a report on "Case Three."[l][er]
Author: Rika Kanzaki. Subject: Rika Kanzaki.[l][er]
A very accurate, very short report.[l][er]

I read it in the library.[l][er]
It was well written, I thought.[l][er]
I didn't think anything beyond that.[l][er]

(BAD END — "No. 17")[l][er]
[s]
