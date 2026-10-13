; route: 格闘技部（虎谷響）
; 第3話の一週間後から。強くなった響は、誰とも戦えなくなっている。
*start
[jump target="kakutogi_01"]

; ================================================================================
; 第1話「出場停止」
; ================================================================================
*kakutogi_01
[chara_hide_all]
[bg storage="dojo_night.webp" time="1000"]
[playbgm storage="bgm_isolation.mp3"]

Night. The martial arts club dojo.[l][er]

"Need to talk. Come to the dojo."—That was the whole message from Hibiki.[l][er]

[chara_show name="kakutogi" face="default" pos="center" time="1000"]

Hibiki was standing in front of the sandbag.[l][er]
She wasn't hitting it.[l][er]

#kakutogi
You came.[l][er]

#protagonist
What's wrong? At this hour?[l][er]

#kakutogi
...Today, the coach told me.[l][er]

#kakutogi
"For the time being, no sparring with club members."[l][er]

#kakutogi
And next month's prefectural tournament. The federation said, "Please refrain from competing until the health concerns are confirmed."[l][er]

#protagonist
...[l][er]

#kakutogi
Of course. If I grappled with anyone right now, their bones would break.[l][er]

#kakutogi
I checked yesterday. I meant to throw lightly, and the mat tore.[l][er]

In the corner of the dojo, a mat patched with tape was leaning against the wall.[l][er]

[chara_show name="kakutogi" face="sad" pos="center" time="500"]

#kakutogi
It's funny, isn't it.[l][er]

#kakutogi
I was told I could be "strong right now," so I drank it. So I'd never lose in front of you again.[l][er]

#kakutogi
...I got strong. I won't lose to anyone.[l][er]

#kakutogi
And in exchange, I can't fight anyone.[l][er]

#protagonist
...[l][er]

#kakutogi
So I have a favor to ask.[l][er]

#kakutogi
Hold the mitts for me.[l][er]

#protagonist
...Me?[l][er]

#kakutogi
The others in the club have the same body I do. I'd lose track of how hard to hit.[l][er]

#kakutogi
If someone with a normal body like yours holds them, I'll never forget to hold back.[l][er]

#kakutogi
...Breaking you is the one thing I'd rather die than do.[l][er]

[glink target="kakutogi_01_a" text="”Okay. I'll hold them.”"]
[glink target="kakutogi_01_b" text="”...I'm scared. I'll pass.”"]
[s]

*kakutogi_01_a
[eval exp="f.kakutogi_mitt = true"]

#protagonist
Okay. I'll hold them.[l][er]

[chara_show name="kakutogi" face="surprised" pos="center" time="500"]

#kakutogi
...Are you sure?[l][er]

#protagonist
You said you'd hold back. I believe you.[l][er]

#kakutogi
...![l][er]

[chara_show name="kakutogi" face="default" pos="center" time="500"]

I held up the mitts with both hands.[l][er]

Hibiki's fist came.[l][er]

—Pff.[l][er]
A ridiculous little sound.[l][er]
Like a feather had hit the mitt.[l][er]

#protagonist
...Huh?[l][er]

#kakutogi
...I held back.[l][er]

#protagonist
Way too much.[l][er]

#kakutogi
Shut up. It's the first day.[l][er]

Hibiki threw a second punch.[l][er]
This time, it made a bit of a sound.[l][er]
With every punch, the sound got a tiny bit louder.[l][er]
—Like she was relearning how to hold back from scratch.[l][er]

[jump target="kakutogi_01_end"]

*kakutogi_01_b
#protagonist
...I'm scared. I'll pass.[l][er]

[chara_show name="kakutogi" face="sad" pos="center" time="500"]

#kakutogi
...I see.[l][er]

#kakutogi
That's right. You're right.[l][er]

#kakutogi
Even I'm scared of me.[l][er]

Hibiki put the mitts back on the shelf.[l][er]
Then she turned back to the sandbag—and didn't hit it.[l][er]
She lowered her fist, still clenched.[l][er]

#kakutogi
...You can go home. Sorry for calling you out here.[l][er]

#protagonist
...No. I'll watch. From here.[l][er]

#kakutogi
...Suit yourself.[l][er]

[jump target="kakutogi_01_end"]

*kakutogi_01_end
#悪魔の声
—Redoing all that hard work, with a body that skipped it?[l][er]

It felt like something laughed outside the dojo window.[l][er]
When I turned around, there was nothing there.[l][er]

[jump target="kakutogi_02"]

; ================================================================================
; 第2話「意味のない練習」
; ================================================================================
*kakutogi_02
[chara_hide_all]
[bg storage="dojo.webp" time="1000"]
[playbgm storage="bgm_sadness.mp3"]

One week later. The dojo, early morning.[l][er]

[chara_show name="kakutogi" face="default" pos="center" time="1000"]

Every morning from six o'clock, Hibiki runs and does strength training.[l][er]
Apparently she's been doing it since long before she changed.[l][er]

#kakutogi
...A hundred. ...A hundred and one.[l][er]

Push-ups.[l][er]
Not a single drop of sweat.[l][er]

#kakutogi
...Three hundred.[l][er]

She stopped, hands still on the floor.[l][er]

[chara_show name="kakutogi" face="crying" pos="center" time="500"]

#kakutogi
...I don't get tired.[l][er]

#protagonist
...[l][er]

#kakutogi
No matter how much I do, I don't get tired. My muscles don't burn. I don't get any stronger than yesterday.[l][er]

#kakutogi
This is already the ceiling. The devil carried me all the way up to it.[l][er]

#kakutogi
The staircase I was going to climb one step at a time, over three years.[l][er]

#kakutogi
...I don't have a reason to wake up at six every morning anymore.[l][er]

#kakutogi
I cheated.[l][er]

#kakutogi
I always despised "strength without effort."[l][er]

#kakutogi
And now I'm exactly the thing I despised.[l][er]

It was the first time I'd seen Hibiki cry.[l][er]
Even crying, her voice didn't shake.[l][er]
Her body was too strong.[l][er]

[if exp="f.kakutogi_mitt"]
#protagonist
...But you're relearning how to hold back, aren't you?[l][er]

#protagonist
At first it was a feather. Yesterday, my hands actually went numb through the mitts.[l][er]

#protagonist
That's not something the potion gave you. That's something you redid every night.[l][er]

#kakutogi
...[l][er]

#kakutogi
...Holding back isn't strength.[l][er]

#protagonist
Isn't it? Right now, that's the hardest thing for you.[l][er]

#kakutogi
...[l][er]
[else]
#protagonist
...Hibiki.[l][er]

#kakutogi
I don't need comforting.[l][er]

#kakutogi
...You said you'd watch. That's enough.[l][er]
[endif]

[jump target="kakutogi_03"]

; ================================================================================
; 第3話「教えるということ」
; ================================================================================
*kakutogi_03
[chara_hide_all]
[bg storage="gym.webp" time="1000"]
[playbgm storage="bgm_daily.mp3"]

After school. A club day.[l][er]

[chara_show name="osananajimi" face="surprised" pos="left" time="800"]
[chara_show name="imouto" face="flustered" pos="right" time="800"]

#osananajimi
Hibiki, I'm sorry! I tore the mat again...[l][er]

#imouto
I only jumped... I only landed...[l][er]

The others in the club still weren't used to handling their own bodies.[l][er]
Someone bent a stair railing. Someone pulled off a doorknob. Every day, someone broke something.[l][er]

[chara_show name="kakutogi" face="default" pos="center" time="800"]

#kakutogi
...You're landing wrong.[l][er]

#kakutogi
Don't come down with your knees locked. Ankles, knees, hips. Take it with all three.[l][er]

#imouto
All three...?[l][er]

#kakutogi
Watch.[l][er]

Hibiki jumped.[l][er]
From a height that nearly reached the ceiling—she came down without a sound.[l][er]
The mat barely dipped.[l][er]

#osananajimi
...Whoa.[l][er]

#imouto
Like a cat...[l][er]

#kakutogi
It's a breakfall. I've done a thousand a day since elementary school.[l][er]

After she said it, Hibiki looked down at her own feet.[l][er]

#kakutogi
...A thousand a day.[l][er]

That day, Hibiki taught everyone how to break a fall and how to let force escape.[l][er]
By the time we went home, no one was breaking anything.[l][er]

[chara_hide_all]
[bg storage="dojo.webp" time="1000"]
[playbgm storage="bgm_romance.mp3"]

On the way home. Outside the dojo in the evening.[l][er]

[chara_show name="kakutogi" face="default" pos="center" time="1000"]

#kakutogi
...Hey.[l][er]

#protagonist
Hm?[l][er]

#kakutogi
I realized something today.[l][er]

#kakutogi
This body belongs to the devil. The strength, the speed—they're borrowed.[l][er]

#kakutogi
But the breakfalls are mine.[l][er]

#kakutogi
The footwork. The breathing. Where to let the force go. All of it is three years I built myself.[l][er]

#kakutogi
...The potion didn't overwrite any of that.[l][er]

#protagonist
...Yeah.[l][er]

[chara_show name="kakutogi" face="smile" pos="center" time="500"]

#kakutogi
I can't enter sparring at the tournament. But in the "kata" division, there's no opponent.[l][er]

#kakutogi
Kata doesn't score on strength. Only precision, and what you've built up.[l][er]

#kakutogi
...I'll enter. I'll ask the federation.[l][er]

#kakutogi
Not "the strong me"—I want to show you "the me I built."[l][er]

[jump target="kakutogi_04"]

; ================================================================================
; 第4話「二本目」
; ================================================================================
*kakutogi_04
[chara_hide_all]
[bg storage="dojo_night.webp" time="1000"]
[playbgm storage="bgm_tension.mp3"]

The night before the tournament.[l][er]

In the evening, Hibiki sent me a single line.[l][er]
"Didn't work."[l][er]

[chara_show name="kakutogi" face="angry" pos="right" time="1000"]

Hibiki was kneeling formally in the center of the dojo.[l][er]
Her fists were clenched on her knees.[l][er]

#kakutogi
...Even the kata division is a no.[l][er]

#kakutogi
"Psychological impact on other competitors." "No precedent."[l][er]

#kakutogi
...Is it my fault there's no precedent?[l][er]

#protagonist
Hibiki.[l][er]

#kakutogi
It's so frustrating.[l][er]

#kakutogi
Frustrating. Frustrating. Frustrating.[l][er]

#kakutogi
Three years of everything I built, and there isn't even a place to show it.[l][er]

[chara_show name="akuma" face="default" pos="left" time="1000"]
[playbgm storage="bgm_devil.mp3"]

#akuma
Frustration hurts, doesn't it?[l][er]

#kakutogi
...You.[l][er]

#akuma
Here you go.[l][er]

A small bottle in the devil's front paw.[l][er]
The same shape as the first one. Only the color of what was inside was a little darker.[l][er]

#akuma
The second bottle. Drink it, and you won't feel frustrated anymore.[l][er]

#akuma
You won't want to win, or hate to lose. You won't compare yourself to anyone.[l][er]

#akuma
You'll be fine not competing. You'll be fine with no reason to wake up at six every morning.[l][er]

#akuma
—It'll be like "effort" was never necessary in the first place.[l][er]

#kakutogi
...[l][er]

#akuma
You've been torn between "effort" and "strength right now" this whole time, haven't you?[l][er]

#akuma
This will make it easy.[l][er]

The devil set the bottle down on the tatami.[l][er]

#akuma
Whether you drink it is up to you.[l][er]

Hibiki was looking down at the bottle.[l][er]
Her clenched fists slowly began to open.[l][er]

#kakutogi
...If I stop feeling frustrated, I won't have to cry anymore.[l][er]

—I had to say it.[l][er]

[glink target="kakutogi_04_refuse" text="”Stay frustrated. Show me your kata.”"]
[glink target="kakutogi_04_accept" text="”...If it makes things easier for you.”"]
[s]

*kakutogi_04_refuse
#protagonist
Stay frustrated.[l][er]

[chara_show name="kakutogi" face="surprised" pos="right" time="500"]

#protagonist
You're frustrated because you built something.[l][er]

#protagonist
You got up at six every morning for three years. That's why it hurts that there's nowhere to show it.[l][er]

#protagonist
If you drink that, those three years become "unnecessary." The devil just said so.[l][er]

#protagonist
If the tournament won't let you—show it here. To me.[l][er]

#protagonist
There's no referee. There won't be a score. But I'll watch. Properly.[l][er]

#kakutogi
...[l][er]

#kakutogi
...You don't know anything about kata.[l][er]

#protagonist
I don't. So explain as you go.[l][er]

#kakutogi
...![l][er]

[chara_show name="kakutogi" face="crying" pos="right" time="500"]

#kakutogi
...Are you an idiot?[l][er]

Hibiki flicked the bottle with her finger.[l][er]
It rolled across the tatami and stopped at the devil's feet.[l][er]

#kakutogi
I'm giving it back.[l][er]

#kakutogi
The frustration is mine. I'm not giving it to you.[l][er]

[chara_show name="akuma" face="smile" pos="left" time="500"]

#akuma
...Hmm. A return, huh.[l][er]

#akuma
Fine. The game's still going, after all.[l][er]

[chara_hide name="akuma" time="1000"]

The shadow vanished.[l][er]

Hibiki stood up.[l][er]
She wiped her face roughly with her sleeve.[l][er]

#kakutogi
...Sit. Kneel properly.[l][er]

#protagonist
Right now?[l][er]

#kakutogi
Right now. Before I change my mind.[l][er]

[eval exp="f.kakutogi_refused = true"]
[jump target="kakutogi_05"]

*kakutogi_04_accept
#protagonist
...If it makes things easier for you.[l][er]

The instant I said it, I knew I'd gotten it wrong.[l][er]

[chara_show name="kakutogi" face="sad" pos="right" time="500"]

#kakutogi
...I see.[l][er]

#kakutogi
So you think so too. That my three years don't matter anymore.[l][er]

Before I could say no,[l][er]
Hibiki bowed, the way she always did before a match—[l][er]
and took the bottle.[l][er]

#protagonist
—Wait![l][er]

Too late.[l][er]

[jump target="kakutogi_ending_bad"]

; ================================================================================
; 第5話「観客一人の演武」
; ================================================================================
*kakutogi_05
[chara_hide_all]
[bg storage="dojo_night.webp" time="1000"]
[playbgm storage="bgm_fight.mp3"]

The dojo at night.[l][er]

An audience of one. Me.[l][er]

[chara_show name="kakutogi" face="default" pos="center" time="1000"]

#kakutogi
...Kata: "Thirty-Two Movements." Beginning.[l][er]

Hibiki took her stance.[l][er]

#kakutogi
Movement one. Weight on the ball of the front foot. Heel lifted the thickness of a sheet of paper.[l][er]

She moved as she explained.[l][er]
Her voice and her body matched perfectly.[l][er]

#kakutogi
Movement four. The punch comes from your back, not your fist. In fourth grade my master corrected me a thousand times.[l][er]

#kakutogi
Movement eleven. Exhale here. If you don't, the next block comes half a beat late.[l][er]

With that body, I thought.[l][er]
With a back like a wall. Arms like logs.[l][er]
—And still, not a single movement relied on brute force.[l][er]
Every bit of it was precise, like walking along a thin thread.[l][er]

#kakutogi
Movement twenty-six. ...My master has never once praised me on this one.[l][er]

Sweat fell.[l][er]
Sweat that three hundred push-ups couldn't bring out fell in the middle of the kata.[l][er]

#kakutogi
...Movement thirty-two. Zanshin.[l][er]

Hibiki held her stance, motionless.[l][er]
Then, slowly, she bowed.[l][er]

I clapped.[l][er]
A single person's applause echoed through the dojo.[l][er]

[chara_show name="kakutogi" face="smile" pos="center" time="500"]

#kakutogi
...How was it?[l][er]

#protagonist
I don't know. About kata.[l][er]

#protagonist
But you were sweating.[l][er]

#kakutogi
...![l][er]

#kakutogi
...You're right.[l][er]

Hibiki looked at her own palm and smiled.[l][er]
For the first time, she smiled with a face that didn't look about to cry.[l][er]

—Someone cleared their throat at the dojo entrance.[l][er]

#顧問
...That was something to see.[l][er]

#kakutogi
—! Coach...[l][er]

#顧問
Show that kata to the federation people too. I got it on video.[l][er]

#顧問
If there's no precedent, you have to make one. ...That was three years' worth of kata, Toraya.[l][er]

[jump target="kakutogi_06"]

; ================================================================================
; 告白前夜：悪魔の味見
; ================================================================================
*kakutogi_06
[chara_hide_all]
[bg storage="rooftop_night.webp" time="1000"]
[playbgm storage="bgm_devil.mp3"]

That night. The roof.[l][er]

[chara_show name="akuma" face="default" pos="center" time="1000"]

#akuma
Hey there. What do you taste like right now?[l][er]

#protagonist
...Like hands that hurt from clapping too hard.[l][er]

#akuma
Ahaha. Nice.[l][er]

#akuma
...You know, that girl's wish was "to skip the effort and be strong right now."[l][er]

#akuma
I granted it. But all the effort she supposedly skipped was still there, inside that kata.[l][er]

#akuma
Apparently my potion can rewrite a body, but it can't erase three years of "a thousand a day."[l][er]

#protagonist
...Well, obviously.[l][er]

[chara_show name="akuma" face="smile" pos="center" time="500"]

#akuma
And she'll probably challenge you tomorrow.[l][er]

#akuma
Maybe think about what you'll do when you lose?[l][er]

[chara_hide name="akuma" time="1000"]

The shadow vanished.[l][er]

[jump target="kakutogi_07"]

; ================================================================================
; 第6話「腕相撲」
; ================================================================================
*kakutogi_07
[chara_hide_all]
[bg storage="dojo.webp" time="1000"]
[playbgm storage="bgm_romance.mp3"]

One week later. The dojo in the evening.[l][er]

The federation replied. "Participation in the kata division will be permitted starting with the next tournament."[l][er]
Apparently the coach's video had been passed around to dozens of instructors.[l][er]

[chara_show name="kakutogi" face="default" pos="center" time="1000"]

#kakutogi
Fight me.[l][er]

#protagonist
...Huh?[l][er]

#kakutogi
Arm wrestling.[l][er]

#protagonist
There's no way I can win.[l][er]

#kakutogi
I know. I'll win. Holding back, by a hair.[l][er]

#kakutogi
That's the hardest technique I have right now.[l][er]

We lay face down on the tatami.[l][er]
We locked hands.[l][er]
My palm disappeared entirely inside hers.[l][er]

#kakutogi
...Here I go.[l][er]

—She pushed.[l][er]
I pushed back. With everything I had.[l][er]
My arm shook. Only mine.[l][er]

Her arm didn't shake at all. It pushed back with exactly the same force as my full strength.[l][er]
One millimeter at a time. One millimeter at a time.[l][er]

Over thirty seconds, the back of my hand touched the tatami.[l][er]

[chara_show name="kakutogi" face="blush" pos="center" time="500"]

#kakutogi
...I win.[l][er]

#protagonist
...I knew.[l][er]

#kakutogi
...Hey. The first time I lost in front of you—[l][er]

#kakutogi
it didn't hurt because I lost.[l][er]

#kakutogi
It hurt because I thought you'd seen "the weak me."[l][er]

#kakutogi
But you look at me the same way whether I'm weak or strong.[l][er]

#kakutogi
...Whether I'm crying. Whether I'm sweating.[l][er]

Our hands were still locked.[l][er]

#kakutogi
I won, so I'll say it. I love you.[l][er]

#kakutogi
...Give me your answer, loser.[l][er]

[glink target="kakutogi_ending_good" text="Squeeze her hand back: ”I love you too. Next time, I win.”"]
[glink target="kakutogi_ending_normal" text="”...You're the best training partner I could ask for.”"]
[s]

; ================================================================================
; GOOD END「二人の強さ」
; ================================================================================
*kakutogi_ending_good
I squeezed back the hand still locked in mine.[l][er]

#protagonist
I love you too.[l][er]

#protagonist
And—next time, I'm winning.[l][er]

[chara_show name="kakutogi" face="surprised" pos="center" time="500"]

#kakutogi
...That'll take your whole life.[l][er]

#protagonist
Then I'll spend my whole life on it.[l][er]

#kakutogi
...[l][er]

[chara_show name="kakutogi" face="smile" pos="center" time="500"]

#kakutogi
...Your whole life, huh.[l][er]

#kakutogi
I like that. That's a reason to wake up at six every morning.[l][er]

[chara_hide_all]
[bg storage="rooftop_night.webp" time="1000"]
[playbgm storage="bgm_devil.mp3"]

[chara_show name="akuma" face="smile" pos="center" time="1000"]

#akuma
—And that's game. You win. ...Even if you lost the arm wrestling.[l][er]

#akuma
As promised, one bite. A wedding gift.[l][er]

The devil's paw tapped my chest, lightly.[l][er]
Something—just a sliver—was taken.[l][er]
—Probably the edge of the frustration, the moment the back of my hand hit the tatami.[l][er]

#akuma
...Mm. It tastes like sweat. Like a good training session.[l][er]

#akuma
Bye now. I won't be coming back.[l][er]

[chara_hide name="akuma" time="1000"]

[chara_hide_all]
[bg storage="dojo.webp" time="1000"]
[playbgm storage="bgm_ending.mp3"]

A few months later. The prefectural tournament, kata division.[l][er]

Hibiki took second place.[l][er]
Apparently her footing slipped, just slightly, on movement twenty-six.[l][er]

[bg storage="events/kakutogi_handup.webp" time="1500"]

#kakutogi
...It's so frustrating.[l][er]

#protagonist
Yeah?[l][er]

#kakutogi
Frustrating. Really, really frustrating.[l][er]

#kakutogi
—So tomorrow, I'm waking up at six again.[l][er]

The dojo at dusk. Today again, after I lose at arm wrestling, Hibiki holds out her hand.[l][er]
I take it and stand up.[l][er]

Hibiki Toraya.[l][er]
The girl who skipped the effort[l][er]
is climbing the stairs again, one step at a time.[l][er]
—Holding my hand.[l][er]

(GOOD END — "Strength for Two")[l][er]
[s]

; ================================================================================
; NORMAL END「最高の稽古相手」
; ================================================================================
*kakutogi_ending_normal
#protagonist
...You're the best training partner I could ask for.[l][er]

[chara_show name="kakutogi" face="default" pos="center" time="500"]

#kakutogi
...Training partner.[l][er]

#kakutogi
...I see.[l][er]

Hibiki slowly let go of my hand.[l][er]

[chara_show name="kakutogi" face="smile" pos="center" time="500"]

#kakutogi
That's fine. For now, that's fine.[l][er]

#kakutogi
It's like arm wrestling. If you can't win in one go, you do it every day.[l][er]

#kakutogi
...Someday I'll make you lose with a word other than "training partner."[l][er]

[chara_hide_all]
[bg storage="rooftop_night.webp" time="1000"]
[playbgm storage="bgm_devil.mp3"]

[chara_show name="akuma" face="default" pos="center" time="1000"]

#akuma
...On hold, then.[l][er]

#akuma
She didn't drink the second bottle. But you didn't become "the real thing," either.[l][er]

#akuma
I'm still hungry. ...Well, she's persistent. I'll wait.[l][er]

[chara_hide name="akuma" time="1000"]

[chara_hide_all]
[bg storage="dojo.webp" time="1000"]
[playbgm storage="bgm_daily.mp3"]

A few months later.[l][er]

Every morning at six, I'm in the dojo holding the mitts.[l][er]
Hibiki's punches aren't feathers anymore. But my hands have never once gone too numb.[l][er]

[chara_show name="kakutogi" face="smile" pos="center" time="1000"]

#kakutogi
Okay. That's it for today's training.[l][er]

#kakutogi
...Are you coming tomorrow too?[l][er]

#protagonist
I am.[l][er]

#kakutogi
...Good.[l][er]

The same conversation every morning.[l][er]
Even so, every morning Hibiki bows looking just a little happy.[l][er]

(NORMAL END — "The Best Training Partner")[l][er]
[s]

; ================================================================================
; BAD END「天井の上」
; ================================================================================
*kakutogi_ending_bad
[playbgm storage="bgm_despair.mp3"]

She drank it in one gulp.[l][er]

[chara_hide_all]
[bg storage="devil_space.webp" time="1500"]

The sound drained out of the world.[l][er]

The sleeves of her uniform split.[l][er]
Her shoulders, her back, swelled up one more stage, as if pushing up the ceiling.[l][er]

[status stage="stage2"]
[chara_show name="kakutogi" face="default" pos="center" time="2000"]

—And before any of that,[l][er]
the strength drained out of her clenched fists.[l][er]

#kakutogi
...Ah.[l][er]

#kakutogi
I'm not frustrated.[l][er]

#kakutogi
I can't compete, and it doesn't bother me at all. ...That's strange. I was so frustrated.[l][er]

#protagonist
Hibiki...![l][er]

#kakutogi
You can go home. I don't need the mitts anymore.[l][er]

#kakutogi
There's no reason to train.[l][er]

[chara_show name="akuma" face="smile" pos="left" time="1000"]

#akuma
—And that's game.[l][er]

#akuma
Well then, as promised. —Thanks for the meal.[l][er]

The devil's paw touched my chest.[l][er]
The heat drained away.[l][er]
The frustration. The fear. The memory of the nights my hands went numb through the mitts.[l][er]
One by one, they disappeared—[l][er]

[chara_hide_all]
[bg storage="black.webp" time="2000"]

(...)[l][er]

[bg storage="dojo.webp" time="1500"]
[playbgm storage="bgm_isolation.mp3"]

A few months later.[l][er]

Hibiki quit the martial arts club.[l][er]
No one comes to the dojo at six in the morning anymore.[l][er]

When we pass in the hallway, she nods calmly.[l][er]
I nod back.[l][er]

I feel like she used to do something a thousand times every morning.[l][er]
I can't remember what it was anymore.[l][er]

(BAD END — "Above the Ceiling")[l][er]
[s]
