; route: 生徒会
*start
[jump target="seitokai_00"]

; 第3話の一週間後から。同好会の承認を、学校側が問題にし始める。
*seitokai_00
; ■ 生徒会ルート - 第1話「校則第17条」

; ================================================================================
*seitokai_00_scene_1
; シーン1：朝／校門前（挨拶運動）
; ================================================================================

[chara_hide_all]
[bg storage="school_gate.webp" time="1000"]
[playbgm storage="bgm_tension.mp3"]

Morning. The school gate.[l][er]

One week since the club was founded.[l][er]
The school still wasn't used to the seven of them.[l][er]
—And yet, this morning too, the student council president was standing at the gate.[l][er]

[chara_show name="seitokai" face="default" pos="center" time="1000"]

#seitokai
Good morning.[l][er]

The greeting campaign. Every Tuesday. Apparently she hadn't missed a single one in three years.[l][er]

Students walked past without returning her greeting, staring up at her.[l][er]
The buttons on her uniform were holding on across her ribcage like a prayer.[l][er]

#seitokai
Good morning.[l][er]

#seitokai
...Good morning, &f.main_name.[l][er]

#protagonist
Morning. ...You're out here today too, huh.[l][er]

#seitokai
It's Tuesday.[l][er]

#seitokai
A change in my physique is no reason to skip the greeting campaign.[l][er]

Just then, I saw someone outside the gate holding up a phone.[l][er]
An adult—someone's parent, by the look of it.[l][er]

#seitokai
...Photographer identified. I'll have the school contact them later.[l][er]

#seitokai
School Rule 17. "Photographing and distributing images of others without permission is prohibited."[l][er]

#protagonist
Do school rules even apply to parents?[l][er]

#seitokai
They do not. That is why I said "the school" will contact them.[l][er]

After saying it firmly, she glanced down at her buttons. Just once.[l][er]
For a split second, her eyes wavered.[l][er]

#seitokai
...&f.main_name. Please come to the student council room after school.[l][er]

#protagonist
Did something happen?[l][er]

#seitokai
The vice principal has summoned me. Regarding the club.[l][er]

#seitokai
"It is procedurally inappropriate for the student council president, as an involved party, to approve an organization she herself belongs to"—or so I am told.[l][er]

#protagonist
...You mean the stamp you put on it a week ago.[l][er]

#seitokai
Yes. Apparently several parents have called asking, "What is that club?"[l][er]

#seitokai
Also—on paper, the club's "founder" is listed under your name.[l][er]

#protagonist
...What?[l][er]

#seitokai
"If someone has to explain, I'll be the one who steps forward." Your words. They are in the minutes.[l][er]

Perfect as ever, I thought.[l][er]
Her "perfect" was about to crumble because of the muscles, and she was clinging to perfection anyway.[l][er]

[chara_hide name="seitokai" time="1000"]

; ================================================================================
*seitokai_00_scene_2
; シーン2：昼休み／廊下（噂の拡散）
; ================================================================================

[chara_hide_all]
[bg storage="hallway.webp" time="1000"]
[playbgm storage="bgm_tension.mp3"]

Lunch break. The hallway.[l][er]

#女子A
Hey, did you hear? The Muscle Club might get shut down.[l][er]

#男子A
Well, duh. The council president made it herself and stamped it herself, right?[l][er]

#女子B
Someone filmed the greeting campaign from outside the gate this morning. It's already online.[l][er]

Outside. Meaning out of the school's control. Once it spreads, there's no stopping it.[l][er]

[chara_show name="seitokai" face="default" pos="center" time="1000"]

The council president was at the center of the rumors, and didn't answer any of them.[l][er]
She walked calmly, worked calmly.[l][er]
Which only made everyone's imaginations run wilder.[l][er]

#protagonist
(...She's going to carry all of it by herself.)[l][er]

I followed her back.[l][er]

[chara_hide name="seitokai" time="1000"]

; ================================================================================
*seitokai_00_scene_3
; シーン3：放課後／生徒会室前（面談の前）
; ================================================================================

[chara_hide_all]
[bg storage="student_council_room.webp" time="1000"]
[playbgm storage="bgm_tension.mp3"]

After school. Waiting outside the student council room.[l][er]

From behind the door: pages turning. A keyboard. Someone sighing.[l][er]

And—my own heartbeat.[l][er]


[chara_show name="seitokai" face="default" pos="center" time="1000"]

#seitokai
...You came.[l][er]

#protagonist
I came. I mean, you're the one who called me.[l][er]

#seitokai
Yes. First, let us divide the situation into "enemies and allies."[l][er]

#protagonist
"Enemies and allies," huh...[l][er]

#seitokai
In this case, our enemies are "the rules" and "the public." Our allies are "procedure" and "time."[l][er]

#protagonist
The public's our enemy? That's rough.[l][er]

#seitokai
..."Rough" is a subjective expression.[l][er]

#protagonist
Then subjective is fine. It's rough.[l][er]

#seitokai
If we're speaking subjectively—[l][er]

She started to say something, then stopped.[l][er]

Just a beat. The air sank.[l][er]

#seitokai
...Very well. It is "rough."[l][er]

She'd just said "rough."[l][er]

That single word dropped like a heavy piece of iron.[l][er]

#protagonist
...The meeting? With the vice principal?[l][er]

#seitokai
Yes. Uniform violations, health status, school order. Any of them can justify "suspension of activities."[l][er]

#protagonist
The Muscle Club just started and it's already ending.[l][er]

#seitokai
To keep it from ending, we rebuild its legitimacy. Purpose, activities, risk management. And we submit it.[l][er]

#protagonist
You're taking this so seriously...[l][er]

#seitokai
Seriousness is the only weapon I have.[l][er]

"The only." It sounded like pride, and also like a weakness.[l][er]

#protagonist
Should I come to the meeting too?[l][er]



; ================================================================================
[glink target="seitokai_00_choice_a" text="I'll go to the meeting too"]
[glink target="seitokai_00_choice_b" text="I'll leave it to you"]
[glink target="seitokai_00_choice_c" text="I'll write the improvement plan and submit it first"]
[s]
[chara_hide name="seitokai" time="1000"]

; ================================================================================
*seitokai_00_scene_4
; シーン4：章末／廊下（悪魔の気配）
; ================================================================================

[chara_hide_all]
[bg storage="hallway.webp" time="1000"]
[playbgm storage="bgm_sadness.mp3"]

The president went back into the student council room.[l][er]

I was left alone in the hallway.[l][er]

Just then—a chill ran down my back.[l][er]


#悪魔の声
"Being right" sure is handy, isn't it?[l][er]

The voice wasn't at my ear. It came from the whole hallway.[l][er]

#悪魔の声
You can pretend you're protecting someone, and cut someone else off.[l][er]

#protagonist
...Who's there?[l][er]

#悪魔の声
Do you still think you haven't cut anyone off?[l][er]

Instead of an answer, I thought I saw a black shadow laughing at the edge of my vision.[l][er]

The next moment, it was gone.[l][er]

[jump target="seitokai_01"]



; ================================================================================

*seitokai_00_choice_a
; ================================================================================
[eval exp="f.seitokai_a = true"]

#protagonist
I'll go too. I'm the founder, right? I don't want to run.[l][er]

#seitokai
...Your attendance is permitted under the rules. However, it may be "an unnecessary provocation."[l][er]

#protagonist
Provocation?[l][er]

#seitokai
When you're involved, it's easy for things to look like "romance," "a joke," or "a stunt."[l][er]

#protagonist
You're saying I have a lightweight personality?[l][er]

#seitokai
...I'm saying it tends to be interpreted that way by people in general.[l][er]

#protagonist
People in general, huh. Then I'll fight people in general.[l][er]

#seitokai
If you're going to fight, bring tactics.[l][er]

With that, she handed me the documents on her desk.[l][er]

#seitokai
We will prepare anticipated questions and answers, right now.[l][er]

#protagonist
Whoa, you're dead serious.[l][er]

#seitokai
If we aren't dead serious, we'll lose.[l][er]

Her hands weren't shaking.[l][er]
But her buttons were shaking. Her uniform was shaking. My heart was shaking.[l][er]

[jump target="seitokai_00_scene_4"]





*seitokai_00_choice_b
; ================================================================================
[eval exp="f.seitokai_b = true"]

#protagonist
...I'll leave it to you. You'll handle it best.[l][er]

#seitokai
That is the optimal solution. No emotions involved.[l][er]

#protagonist
I mean, there are emotions involved, though.[l][er]

#seitokai
If there are, all the more reason to stay away. They cloud judgment.[l][er]

#protagonist
...Okay.[l][er]

I agreed out loud. But my feet wouldn't move.[l][er]

#seitokai
...You're kind, aren't you?[l][er]

#protagonist
Huh?[l][er]

#seitokai
You have the face of someone who doesn't want to run. And yet you followed my instructions.[l][er]

#protagonist
That's not kind. That's just weak.[l][er]

#seitokai
Weakness can be compensated for with procedure.[l][er]

She said it coldly, the way she always did.[l][er]
But the way she said it leaned, just a little, toward "comfort."[l][er]

[jump target="seitokai_00_scene_4"]





*seitokai_00_choice_c
; ================================================================================
[eval exp="f.seitokai_c = true"]

#protagonist
Leave the meeting to you. I'll submit an improvement plan first. I'll build the Muscle Club's "legitimacy."[l][er]

#seitokai
...That's rash.[l][er]

#protagonist
But if we stand still, it's over.[l][er]

#seitokai
To keep from standing still, we need proper order. If we break that order, they'll treat it as "an opening."[l][er]

#protagonist
An opening's fine. As long as we can hit back.[l][er]

#seitokai
..."Hit" is also a subjective expression.[l][er]

#protagonist
Then subjective is fine. Hit.[l][er]

She closed her eyes.[l][er]

#seitokai
...Very well. Then you handle the documents. I handle the meeting. A division of roles.[l][er]

A perfect person can even swallow an imperfect plan.[l][er]
The way she swallowed it was painful to watch.[l][er]

[jump target="seitokai_00_scene_4"]

; ================================================================================
; ■ 生徒会ルート - 第2話「完璧の仮面」
; テーマ：弱さを見せられない / 本当の自分
; ================================================================================

*seitokai_01
[chara_hide_all]
[bg storage="student_council_room.webp" time="1000"]
[playbgm storage="bgm_tension.mp3"]

The meeting ended.[l][er]

[if exp="f.seitokai_a"]
The result—on hold. With one condition: "Submit an improvement plan by the next meeting."[l][er]

The vice principal frowned at my presence the entire time.[l][er]
—But he didn't send me away.[l][er]

[chara_show name="seitokai" face="default" pos="center" time="1000"]

#seitokai
...Having you beside me made a big difference.[l][er]

#protagonist
Yeah?[l][er]

#seitokai
"The founder did not run away"—that fact counts in our favor.[l][er]

#protagonist
A fact's a fact.[l][er]

#seitokai
...There's a condition, but we can still "move."[l][er]

#seitokai
We stopped one step short of the worst case.[l][er]

There was a little room to breathe in her voice.[l][er]
Not perfect. The voice of someone who'd held her ground.[l][er]

[chara_hide name="seitokai" time="1000"]
[elsif exp="f.seitokai_b"]
The result—completely on hold.[l][er]

The vice principal didn't add any conditions.[l][er]
—But that wasn't "approval." It was "saving his next excuse for later."[l][er]

[chara_show name="seitokai" face="default" pos="center" time="1000"]

#seitokai
...As expected.[l][er]

#protagonist
Yeah?[l][er]

#seitokai
The worst case was "immediate suspension." Compared to that—[l][er]

#protagonist
But it's not approved either.[l][er]

#seitokai
...No.[l][er]

Her voice trembled slightly.[l][er]

#protagonist
...Are you okay?[l][er]

#seitokai
I'm fine.[l][er]

An instant answer. But her eyes were darting around.[l][er]

[chara_hide name="seitokai" time="1000"]
[else]
The result—on hold. Plus a note: "rash."[l][er]

Apparently the flaws in the improvement plan I'd submitted early got picked apart in the meeting.[l][er]
—The Muscle Club's "legitimacy" got whittled down at the paperwork stage.[l][er]

[chara_show name="seitokai" face="default" pos="center" time="1000"]

#seitokai
...That was unexpected.[l][er]

#protagonist
Sorry. I rushed it.[l][er]

#seitokai
A fact is a fact.[l][er]

#seitokai
However—there is now a record of us "breaking proper order."[l][er]

#protagonist
...[l][er]

#seitokai
That record will be cited in every meeting from now on.[l][er]

Her voice was calm. But her hand set down her pen in the wrong spot.[l][er]

[chara_hide name="seitokai" time="1000"]
[endif]

; ================================================================================
*seitokai_01_scene_2
; シーン2：崩れる仮面
; ================================================================================

[chara_hide_all]
[bg storage="student_council_room.webp" time="1000"]
[playbgm storage="bgm_sadness.mp3"]

That night.[l][er]

I went back to the student council room to grab something I'd forgotten.[l][er]

When I opened the door—[l][er]

[if exp="f.seitokai_a"]
[chara_show name="seitokai" face="default" pos="center" time="1000"]

She had put down her pen.[l][er]
—She'd managed to put it down.[l][er]

#seitokai
...Can I help you?[l][er]

#protagonist
Forgot something.[l][er]

#seitokai
Go ahead.[l][er]

Her voice was a little lower than usual. But it wasn't shaking.[l][er]

#protagonist
...Are you okay alone?[l][er]

#seitokai
I'm not okay.[l][er]

#seitokai
But—I can at least admit that I'm "not okay."[l][er]

#protagonist
...[l][er]

#seitokai
Because you were beside me.[l][er]

#seitokai
...Just for tonight.[l][er]
[elsif exp="f.seitokai_b"]
[chara_show name="seitokai" face="crying" pos="center" time="1000"]

#seitokai
...![l][er]

She was crying.[l][er]

#protagonist
...![l][er]

#seitokai
—![l][er]

She hurriedly wiped her tears.[l][er]

#seitokai
C-Can I help you?[l][er]

#protagonist
I forgot someth—[l][er]

#seitokai
I see. Go ahead.[l][er]

Her voice was shaking.[l][er]

#protagonist
...Were you crying?[l][er]

#seitokai
I wasn't crying.[l][er]

#protagonist
Liar.[l][er]

#seitokai
...[l][er]

Silence.[l][er]

She looked down.[l][er]

#seitokai
...Please don't look at me.[l][er]

#protagonist
...[l][er]

#seitokai
I don't want anyone to see me like this.[l][er]
[else]
[chara_show name="seitokai" face="crying" pos="center" time="1000"]

#seitokai
...![l][er]

She was crying.[l][er]

—A button from her uniform lay on the desk.[l][er]
The last fastener holding "the perfect student council president" together had come off.[l][er]

#protagonist
...![l][er]

#seitokai
—![l][er]

She hurriedly wiped her tears.[l][er]
She couldn't wipe them all. Her breathing was coming apart faster than her tears.[l][er]

#seitokai
C-Can I help you?[l][er]

#protagonist
I forgot someth—[l][er]

#seitokai
I see. Go ahead.[l][er]

Her voice was shaking.[l][er]

#protagonist
...Were you crying?[l][er]

#seitokai
I wasn't crying.[l][er]

#protagonist
Liar.[l][er]

#seitokai
...[l][er]

Silence.[l][er]

She looked down.[l][er]

#seitokai
...I got the order wrong.[l][er]

#protagonist
That's on me.[l][er]

#seitokai
I'm the one who failed to stop it.[l][er]

#seitokai
—That is my responsibility.[l][er]
[endif]

[chara_hide name="seitokai" time="1000"]

; ================================================================================
*seitokai_01_scene_3
; シーン3：本音
; ================================================================================

[chara_hide_all]
[bg storage="student_council_room.webp" time="1000"]
[playbgm storage="bgm_sadness.mp3"]

#protagonist
...What's so painful?[l][er]

[chara_show name="seitokai" face="sad" pos="center" time="1000"]

#seitokai
...[l][er]

#protagonist
Tell me.[l][er]

#seitokai
...I have to be perfect.[l][er]

#protagonist
...[l][er]

#seitokai
As student council president. As the face of the school.[l][er]

#seitokai
Always correct. Always composed.[l][er]

#protagonist
...[l][er]

#seitokai
But—[l][er]

She looked at her own arm.[l][er]

#seitokai
With this body—[l][er]

#seitokai
"perfect" fell apart.[l][er]

#protagonist
...[l][er]

#seitokai
My uniform doesn't fit. People stare at me like I'm a curiosity.[l][er]

#seitokai
Even in the meeting—"not suitable as a model for the student body."[l][er]

#protagonist
...[l][er]

#seitokai
What have I even been working so hard for...?[l][er]

Tears spilled over.[l][er]

#seitokai
I tried so hard to be perfect...[l][er]

#seitokai
...and I can't protect anything.[l][er]

[chara_hide name="seitokai" time="1000"]

; ================================================================================
*seitokai_01_scene_4
; シーン4：選択
; ================================================================================

[chara_hide_all]
[bg storage="student_council_room.webp" time="1000"]

[glink target="seitokai_01_choice_a" text="You don't have to be perfect"]
[glink target="seitokai_01_choice_b" text="Let's fight this together"]
[s]

*seitokai_01_choice_a
#protagonist
You don't have to be perfect.[l][er]

[chara_show name="seitokai" face="surprised" pos="center" time="1000"]

#seitokai
...What?[l][er]

#protagonist
Even if you're not perfect, I'll follow you.[l][er]

#seitokai
...[l][er]

#protagonist
Even if you're weak. Even if you cry.[l][er]

#protagonist
You're still the student council president.[l][er]

#seitokai
...[l][er]

#protagonist
That's—what I think.[l][er]

Tears fell from her eyes.[l][er]

#seitokai
...Thank you.[l][er]

#seitokai
It feels—a little easier now.[l][er]

[chara_hide name="seitokai" time="1000"]
[jump target="seitokai_02"]

*seitokai_01_choice_b
#protagonist
Let's fight this together.[l][er]

[chara_show name="seitokai" face="surprised" pos="center" time="1000"]

#seitokai
...[l][er]

#protagonist
Don't carry it all by yourself.[l][er]

#protagonist
Everyone in the Muscle Club will fight with you too.[l][er]

#seitokai
...[l][er]

#protagonist
We're friends, aren't we?[l][er]

She smiled a little.[l][er]

#seitokai
...Friends, is it.[l][er]

#protagonist
Yeah.[l][er]

#seitokai
...That's a nice word.[l][er]

#seitokai
It's not a word we use much in the student council.[l][er]

#protagonist
Start using it.[l][er]

#seitokai
...Okay.[l][er]

[chara_hide name="seitokai" time="1000"]
[jump target="seitokai_02"]

; ================================================================================
; ■ 生徒会ルート - 第3話「反撃」
; テーマ：仲間の力 / 正当性
; ================================================================================

*seitokai_02
[chara_hide_all]
[bg storage="classroom.webp" time="1000"]
[playbgm storage="bgm_daily.mp3"]

A few days later.[l][er]

An emergency meeting of the Muscle Club.[l][er]

[chara_show name="seitokai" face="default" pos="center" time="1000"]

#seitokai
I have a request for all of you.[l][er]

[chara_show name="gyaru" face="default" pos="left" time="1000"]

#gyaru
What is it, what is it?[l][er]

#seitokai
A petition drive—to prove the legitimacy of the Muscle Club.[l][er]

[chara_hide name="gyaru" time="1000"]

[chara_show name="otaku" face="default" pos="left" time="1000"]

#otaku
A petition?[l][er]

#seitokai
Yes. With support from the students, the school can't ignore us.[l][er]

[chara_hide name="otaku" time="1000"]

[chara_show name="kakutogi" face="default" pos="left" time="1000"]

#kakutogi
I like it. Let's do it.[l][er]

[chara_hide name="kakutogi" time="1000"]
[chara_hide name="seitokai" time="1000"]

; ================================================================================
*seitokai_02_scene_2
; シーン2：署名活動
; ================================================================================

[chara_hide_all]
[bg storage="hallway.webp" time="1000"]
[playbgm storage="bgm_daily.mp3"]

We started the petition.[l][er]

At first, the response was weak.[l][er]

#男子A
Muscle Club? What's that?[l][er]

#女子A
They're kinda scary...[l][er]

—It was a terrible start.[l][er]

So the club went into action.[l][er]

[chara_show name="gyaru" face="smile" pos="center" time="800"]

#gyaru
We're live! "#MuscleClub"—we're going for trending, everybody![l][er]

#protagonist
Didn't you say we were collecting signatures?[l][er]

#gyaru
If we go viral, the signatures'll follow![l][er]

[chara_hide name="gyaru" time="600"]
[chara_show name="otaku" face="default" pos="center" time="800"]

#otaku
I've prepared handouts. On the positive effects of skeletal muscle development on academic performance. Double-sided, full color.[l][er]

#protagonist
Double-sided...[l][er]

#otaku
The back is graphs. People are weak to graphs.[l][er]

[chara_hide name="otaku" time="600"]
[chara_show name="kakutogi" face="default" pos="center" time="800"]

#kakutogi
I set up an arm-wrestling challenge table. Beat me and you get a free juice.[l][er]

#protagonist
Can anyone actually beat you?[l][er]

#kakutogi
No. So the juice never runs out. A perfect plan.[l][er]

[chara_hide name="kakutogi" time="600"]
[chara_show name="furyo" face="default" pos="center" time="800"]

#furyo
...They told me all I had to do was stand here.[l][er]

The crowd backed up two meters.[l][er]

[chara_show name="imouto" face="smile" pos="left" time="800"]

#imouto
Okaaay, cookies for everyone! Only for people who sign![l][er]

The crowd came back one meter.[l][er]

[chara_hide name="imouto" time="600"]
[chara_hide name="furyo" time="600"]
[chara_show name="osananajimi" face="smile" pos="center" time="800"]

#osananajimi
I'll just talk to people normally. That's probably fastest.[l][er]

—It actually was the fastest.[l][er]

[chara_hide name="osananajimi" time="600"]

It was noisy and chaotic—but bit by bit, the air in the hallway started to change.[l][er]

And in the end, what worked was—[l][er]

[chara_show name="seitokai" face="default" pos="center" time="1000"]

#seitokai
We are facing our own bodies.[l][er]

#seitokai
Instead of being ashamed of them, we are trying to accept them.[l][er]

#seitokai
Please approve the activities that help us do that.[l][er]

Her words were sincere.[l][er]

Little by little—signatures started coming in.[l][er]

#女子B
That's kind of cool, actually.[l][er]

#男子B
I'll support you.[l][er]

[chara_hide name="seitokai" time="1000"]

; ================================================================================
*seitokai_02_scene_3
; シーン3：成果
; ================================================================================

[chara_hide_all]
[bg storage="student_council_room.webp" time="1000"]
[playbgm storage="bgm_daily.mp3"]

One week later.[l][er]

[if exp="f.seitokai_a"]
We had over two hundred signatures.[l][er]

—A few people had written in the margins, "because the founder showed up."[l][er]

[chara_show name="seitokai" face="smile" pos="center" time="1000"]

#seitokai
...With this, we can win.[l][er]

#protagonist
You got a lot.[l][er]

#seitokai
"I've seen the founder"—that seems to have been the deciding factor for many.[l][er]

#protagonist
I didn't do anything.[l][er]

#seitokai
The fact that you showed your face turns into votes.[l][er]

#seitokai
And I used that as a weapon.[l][er]

[chara_hide name="seitokai" time="1000"]
[elsif exp="f.seitokai_b"]
We had over two hundred and fifty signatures.[l][er]

—More than half were students who had never once talked to Rin.[l][er]

[chara_show name="seitokai" face="smile" pos="center" time="1000"]

#seitokai
...This exceeds my expectations.[l][er]

#protagonist
That's amazing.[l][er]

#seitokai
It's thanks to all of you.[l][er]

#protagonist
It's your strength.[l][er]

#seitokai
...[l][er]

She looked a little embarrassed.[l][er]

#seitokai
...It would be a lie to say I stood on my own.[l][er]

#seitokai
It's closer to say that people believed I could stand on my own.[l][er]

#protagonist
...[l][er]

#seitokai
Thank you.[l][er]

[chara_hide name="seitokai" time="1000"]
[else]
A hundred and twenty signatures. Not enough to meet the goal.[l][er]

—The "rash" record had turned into a rumor through the teachers.[l][er]

[chara_show name="seitokai" face="default" pos="center" time="1000"]

#seitokai
...We didn't reach the number.[l][er]

#protagonist
That's my fault.[l][er]

#seitokai
It isn't your fault.[l][er]

#seitokai
—It was both of us who broke proper order.[l][er]

#protagonist
...[l][er]

#seitokai
However, since the number falls short, we'll have to push through another way.[l][er]

#seitokai
We'll bring the shortfall with us, without hiding it.[l][er]

#protagonist
Is that really okay?[l][er]

#seitokai
"Winning while falling short" is also a tactic.[l][er]

[chara_hide name="seitokai" time="1000"]
[endif]

; ================================================================================
; シーン4：面談前夜 — 二本目の薬
; ================================================================================

*seitokai_02b_yoru

[chara_hide_all]
[bg storage="rooftop_night.webp" time="1000"]
[playbgm storage="bgm_devil.mp3"]

The night before the meeting.[l][er]

I'd forgotten to hand her tomorrow's documents, so I went back to school at night.[l][er]

The door to the roof was open.[l][er]

—She was there.[l][er]

And beside her...[l][er]

[chara_show name="akuma" face="default" pos="left" time="1000"]
[chara_show name="seitokai" face="sad" pos="right" time="1000"]

#akuma
—So you see, this is insurance.[l][er]

A small bottle dangled from the devil's claw.[l][er]

#akuma
What if tomorrow, you're rejected? What if they tell you "not suitable" again?[l][er]

#akuma
Drink this, and you'll never waver again.[l][er]

#akuma
Not just perfect—above perfect.[l][er]

#seitokai
...[l][er]

#akuma
A president who never hesitates. A girl who never cries. No one will ever reject you again.[l][er]

#seitokai
...I...[l][er]

Her hand moved, ever so slightly, toward the bottle.[l][er]

—My voice came out.[l][er]

#protagonist
Hey.[l][er]

[chara_show name="seitokai" face="surprised" pos="right" time="500"]

#seitokai
...! Why are you here?[l][er]

#akuma
Hey there. You came at a good moment.[l][er]

#akuma
We were just talking about her life.[l][er]

#protagonist
...Get away from her.[l][er]

#akuma
I'm not forcing anything. I always just—let them choose.[l][er]

The devil set the bottle down within her reach.[l][er]

#akuma
Whether she drinks it is up to her.[l][er]

She was looking at the bottle.[l][er]

With the same eyes as that night she cried in the student council room after school.[l][er]

#seitokai
...If I drink this...[l][er]

#seitokai
I won't cause anyone any more trouble.[l][er]

#seitokai
No mistakes. No wavering. —I'll be able to do it perfectly.[l][er]

No.[l][er]

That means you'd "break."[l][er]

—What do I say?[l][er]

[glink target="seitokai_02b_refuse" text="”I'm watching you, imperfect and all.”"]
[glink target="seitokai_02b_accept" text="”...Whether you drink it is your decision.”"]
[s]

; --------------------------------------------------------------------
*seitokai_02b_refuse

#protagonist
I'm watching you. Imperfect and all.[l][er]

[chara_show name="seitokai" face="surprised" pos="right" time="500"]

#seitokai
...[l][er]

#protagonist
Even if they reject you tomorrow—[l][er]

#protagonist
your shaking voice, your crooked stamp—I'm watching all of it.[l][er]

#protagonist
So you don't need that. Not that thing.[l][er]

For a long time, she said nothing.[l][er]

Then—she took one step away from the bottle.[l][er]

[chara_show name="seitokai" face="crying" pos="right" time="500"]

#seitokai
...Yes.[l][er]

#seitokai
—I'm returning it.[l][er]

[chara_show name="akuma" face="smile" pos="left" time="500"]

#akuma
...Oh?[l][er]

#akuma
It's been a long, long time since anyone returned one.[l][er]

The devil made the bottle vanish into its sleeve.[l][er]

#akuma
Fine. The game's still going, after all.[l][er]

[chara_hide name="akuma" time="1000"]

After the shadow disappeared, she let out a small breath.[l][er]

#seitokai
...Tomorrow's meeting.[l][er]

#seitokai
—Please be beside me.[l][er]

#protagonist
Yeah.[l][er]

[eval exp="f.seitokai_refused = true"]
[chara_hide name="seitokai" time="1000"]
[jump target="seitokai_03"]

; --------------------------------------------------------------------
*seitokai_02b_accept

#protagonist
...Whether you drink it is your decision.[l][er]

—The instant I said it, I knew I'd gotten it wrong.[l][er]

[chara_show name="seitokai" face="sad" pos="right" time="500"]

#seitokai
...Yes. That's right.[l][er]

#seitokai
It's my decision.[l][er]

She was someone who had only ever piled up "correct decisions."[l][er]

What she wanted most right now—wasn't a decision.[l][er]

—It was someone to stop her.[l][er]

#seitokai
Tomorrow, I can't afford—to fail again.[l][er]

Her hand took the bottle.[l][er]

#protagonist
—Wait![l][er]

Too late.[l][er]

[jump target="seitokai_ending_bad"]

; ================================================================================
; ■ 生徒会ルート - 第4話「承認」
; テーマ：勝利 / 新しい関係
; ================================================================================

*seitokai_03
[chara_hide_all]
[bg storage="student_council_room.webp" time="1000"]
[playbgm storage="bgm_tension.mp3"]

The second meeting.[l][er]

We submitted the signatures.[l][er]

[if exp="f.seitokai_a"]
#教頭
...Two hundred.[l][er]

#教頭
Is the founder—beside you again today?[l][er]

#protagonist
I am.[l][er]

#教頭
...[l][er]

#seitokai
I am submitting, once again, the fact that "he did not run."[l][er]

A long silence.[l][er]

#教頭
...Very well.[l][er]

#protagonist
...![l][er]

#教頭
I'll approve it. With conditions.[l][er]
[elsif exp="f.seitokai_b"]
#教頭
...Over two hundred and fifty signatures.[l][er]

#seitokai
These are the voices of the students.[l][er]

#教頭
...[l][er]

A long silence.[l][er]

#教頭
...Very well.[l][er]

#protagonist
...![l][er]

#教頭
The Muscle Club is officially approved.[l][er]
[else]
#教頭
...A hundred and twenty. That falls short of the target.[l][er]

#seitokai
Yes.[l][er]

#seitokai
Therefore, I have brought one more argument.[l][er]

She handed over another stack of documents.[l][er]
—A copy of the warning issued to her, with the word "rash" written on it.[l][er]

#seitokai
I will take responsibility for "breaking proper order."[l][er]

#seitokai
With that understood, I ask that our activities be allowed to continue.[l][er]

#教頭
...[l][er]

A long silence.[l][er]

#教頭
...Provisional approval.[l][er]

#protagonist
...![l][er]

#教頭
If there are no problems for six months, it becomes full approval.[l][er]
[endif]

[chara_show name="seitokai" face="smile" pos="center" time="1000"]

#seitokai
...![l][er]

#seitokai
Thank you very much![l][er]

Her eyes were shining.[l][er]

Not as the perfect student council president—[l][er]

but as one girl who had fought alongside her friends.[l][er]

[chara_hide name="seitokai" time="1000"]

; ================================================================================
*seitokai_03_scene_2
; シーン2：祝勝会
; ================================================================================

[chara_hide_all]
[bg storage="classroom.webp" time="1000"]
[playbgm storage="bgm_daily.mp3"]

After school. The club room.[l][er]

We all celebrated.[l][er]

[chara_show name="gyaru" face="smile" pos="left" time="1000"]

#gyaru
Yaaay! We got approved![l][er]

[chara_show name="kakutogi" face="smile" pos="right" time="1000"]

#kakutogi
Well done, President.[l][er]

[chara_hide name="kakutogi" time="1000"]
[chara_hide name="gyaru" time="1000"]

[chara_show name="seitokai" face="smile" pos="center" time="1000"]

#seitokai
...It's thanks to all of you.[l][er]

#protagonist
We could do it because you were the leader.[l][er]

#seitokai
...[l][er]

She looked a little embarrassed.[l][er]

#seitokai
...I'm not used to this.[l][er]

#protagonist
To what?[l][er]

#seitokai
Being praised.[l][er]

#protagonist
Get used to it.[l][er]

#seitokai
...Okay.[l][er]

[chara_hide name="seitokai" time="1000"]

; ================================================================================
; ■ 生徒会ルート - 告白前夜：悪魔の味見
; ================================================================================

*seitokai_03b_akuma
[chara_hide_all]
[bg storage="rooftop_night.webp" time="1000"]
[playbgm storage="bgm_devil.mp3"]

After the celebration, I went up to the roof alone.[l][er]
—No one had called me. But there was definitely a voice I could hear.[l][er]

[chara_show name="akuma" face="default" pos="center" time="1000"]

#akuma
Hey there.[l][er]

#akuma
What do you taste like right now?[l][er]

#protagonist
...I have no business with you.[l][er]

#akuma
Emotions processed through procedure can't be eaten as emotions.[l][er]

#akuma
—What a shame.[l][er]

#protagonist
...[l][er]

#akuma
Plus, she shoved that bottle right back at me the other day.[l][er]

#akuma
I'd never heard a line like that before. "I'm watching you, imperfect and all."[l][er]

#protagonist
...You were eavesdropping?[l][er]

#akuma
I'm an involved party.[l][er]

#akuma
So now I've got one card left—just waiting for you to miss your chance at "the real thing."[l][er]

#akuma
Rin can only get close to you in a form she can write down in the minutes.[l][er]

#akuma
Because you're the person she wanted to be "perfect" for.[l][er]

#protagonist
I never asked for that.[l][er]

#akuma
Nobody submits minutes to someone who never asked for anything.[l][er]

#protagonist
...[l][er]

#akuma
Just so you know—[l][er]

#akuma
there's still the option of not choosing, and letting me eat.[l][er]

#protagonist
I won't let you eat.[l][er]

#protagonist
The Rin in front of me isn't paperwork.[l][er]

#akuma
Hmm.[l][er]

[chara_show name="akuma" face="smile" pos="center" time="500"]

#akuma
Then accept it through a procedure that isn't paperwork.[l][er]

[chara_hide name="akuma" time="1000"]

The shadow vanished.[l][er]
—But the words "a procedure that isn't paperwork" stayed behind.[l][er]

; ================================================================================
; ■ 生徒会ルート - 第5話「告白」
; テーマ：完璧を超えて / 恋
; ================================================================================

*seitokai_04
[chara_hide_all]
[bg storage="rooftop.webp" time="1000"]
[playbgm storage="bgm_romance.mp3"]

Dusk. The roof.[l][er]

The council president had called me here.[l][er]

[chara_show name="seitokai" face="default" pos="center" time="1000"]

#seitokai
...May I have a moment of your time?[l][er]

#protagonist
You're the one who called me.[l][er]

#seitokai
Yes.[l][er]

She held out a single sheet of A4 paper.[l][er]

#seitokai
I will read it aloud.[l][er]

#protagonist
...A document?[l][er]

#seitokai
It is a private agenda item, however.[l][er]

#seitokai
There is no record of me ever submitting anything outside the format of the minutes.[l][er]

#protagonist
...[l][er]

#seitokai
Subject: "On the Handling of Private Feelings."[l][er]

#seitokai
Date: today.[l][er]

#seitokai
Proposer: Rin Shiratori.[l][er]

#seitokai
Body.[l][er]

[chara_show name="seitokai" face="blush" pos="center" time="500"]

#seitokai
"The proposer wishes to continue her affection toward the subject (you)."[l][er]

#seitokai
"Should the subject approve this, the proposer will continue to show her imperfect self, in the presence of the subject only."[l][er]

#seitokai
"Should the subject return this, the proposer will reorganize the conditions and resubmit at a later date."[l][er]

#seitokai
That is all.[l][er]

#protagonist
...[l][er]

#seitokai
May I have your decision—approval, or return?[l][er]

#seitokai
I will apply the stamp myself.[l][er]

[chara_hide name="seitokai" time="1000"]

; ================================================================================
*seitokai_04_scene_2
; シーン2：返事（議事録への押印）
; ================================================================================

[chara_hide_all]
[bg storage="rooftop.webp" time="1000"]

[glink target="seitokai_ending_good" text="Approve (tell her to stamp it)"]
[glink target="seitokai_ending_normal" text="Return it (wait for resubmission)"]
[s]

; ================================================================================
; ■ 生徒会ルート - グッドエンディング「不完全な二人」
; ================================================================================

*seitokai_ending_good
#protagonist
I approve.[l][er]

[chara_show name="seitokai" face="surprised" pos="center" time="1000"]

#seitokai
...[l][er]

#protagonist
Stamp it.[l][er]

#seitokai
...Yes.[l][er]

She pressed her stamp in the lower right corner of the document.[l][er]
—It came out a little crooked.[l][er]

#seitokai
...It's crooked.[l][er]

#protagonist
Leave it.[l][er]

#protagonist
It's the first page of "an imperfect procedure."[l][er]

#seitokai
...[l][er]

She stood there holding the document, not moving, for a while.[l][er]

#seitokai
...I will keep this.[l][er]

#protagonist
Give me a copy.[l][er]

#seitokai
Double-sided?[l][er]

#protagonist
Double-sided.[l][er]

#seitokai
...I'll give it to you tomorrow.[l][er]

After she finished speaking, she smiled a little.[l][er]
—On the page of the minutes, she was finally able to smile.[l][er]

[chara_hide name="seitokai" time="1000"]


[chara_hide_all]
[bg storage="rooftop_night.webp" time="1000"]
[playbgm storage="bgm_devil.mp3"]

[chara_show name="akuma" face="smile" pos="center" time="1000"]

#akuma
—And that's game. You win.[l][er]

#akuma
You accepted it properly. A procedure that isn't paperwork.[l][er]

#akuma
As promised, one bite. A wedding gift.[l][er]

The devil's paw tapped my chest, lightly.[l][er]
Something—just a sliver—was taken.[l][er]
—Probably the edge of that feeling, the moment I saw the crooked stamp.[l][er]

#akuma
...Mm. A serious flavor. But properly sweet.[l][er]

#akuma
Bye now. I won't be coming back.[l][er]

[chara_hide name="akuma" time="1000"]

; ================================================================================
*seitokai_ending_good_epilogue
; エピローグ
; ================================================================================

[chara_hide_all]
[bg storage="student_council_room.webp" time="1000"]
[playbgm storage="bgm_romance.mp3"]

A few months later.[l][er]

The Muscle Club had become a school institution.[l][er]

And—[l][er]

[chara_show name="seitokai" face="smile" pos="center" time="1000"]

#seitokai
...That concludes today's agenda.[l][er]

#protagonist
Good work.[l][er]

#seitokai
...[l][er]

After everyone had gone home.[l][er]

She leaned against me.[l][er]

#seitokai
...I'm tired.[l][er]

#protagonist
What about the perfect student council president?[l][er]

#seitokai
...She's on break right now.[l][er]

#protagonist
I see.[l][er]

I stroked her hair.[l][er]

#seitokai
...When we're like this, I feel safe.[l][er]

#protagonist
Me too.[l][er]

#seitokai
...It's strange.[l][er]

#seitokai
Once I gave up on being perfect—[l][er]

#seitokai
things got easier.[l][er]

#protagonist
You don't have to be perfect.[l][er]

#seitokai
Yes.[l][er]

#seitokai
Because—you're here.[l][er]

[chara_hide name="seitokai" time="1000"]

[chara_hide_all]
[bg storage="events/seitokai_councilroom.webp" time="1000"]

Rin Shiratori.[l][er]

The girl who tried so hard to be perfect—[l][er]

accepted her imperfect self.[l][er]

[if exp="f.seitokai_a"]
I sit beside her as vice president.[l][er]
Without ever giving up the title of "founder."[l][er]
[elsif exp="f.seitokai_b"]
I simply stand beside her.[l][er]
In a place with no title, we finally balanced out.[l][er]
[else]
Sometimes we laugh together about that night when we "rushed it."[l][er]
Whatever order we broke, the two of us make up for it together.[l][er]
[endif]

And so—two imperfect people began walking together.[l][er]

(GOOD END — "Two Imperfect People")[l][er]

[s]

; ================================================================================
; ■ 生徒会ルート - ノーマルエンディング「最高のパートナー」
; ================================================================================

*seitokai_ending_normal
#protagonist
I'm returning it.[l][er]

[chara_show name="seitokai" face="default" pos="center" time="1000"]

#seitokai
...[l][er]

#protagonist
As it stands, the conditions are vague.[l][er]

#protagonist
"Show her imperfect self"—how much counts as showing?[l][er]

#protagonist
"Resubmit at a later date"—when is "later"?[l][er]

#seitokai
...[l][er]

She took back the document and said nothing.[l][er]

#protagonist
Right now, I haven't even caught up to you as a friend yet.[l][er]

#protagonist
Once I catch up, I want to talk about the stamp again.[l][er]

#seitokai
...That's rational.[l][er]

#protagonist
I'm not returning it just because it's rational.[l][er]

#seitokai
...Yes.[l][er]

#seitokai
I understand.[l][er]

She folded the document carefully.[l][er]
—It wasn't the kind of fold you make before throwing something away.[l][er]

#seitokai
I will keep it.[l][er]

#seitokai
In the folder marked "Returned — Resubmission Pending."[l][er]

[chara_hide name="seitokai" time="1000"]

[chara_hide_all]
[bg storage="rooftop_night.webp" time="1000"]
[playbgm storage="bgm_devil.mp3"]

[chara_show name="akuma" face="default" pos="center" time="1000"]

#akuma
...On hold, then.[l][er]

#akuma
The second bottle got returned. But the stamp for "the real thing" didn't get pressed, either.[l][er]

#akuma
I'm still hungry. ...Well, it's "resubmission pending," right? I'll wait.[l][er]

[chara_hide name="akuma" time="1000"]

; ================================================================================
*seitokai_ending_normal_epilogue
; エピローグ
; ================================================================================

[chara_hide_all]
[bg storage="student_council_room.webp" time="1000"]
[playbgm storage="bgm_daily.mp3"]

A few months later.[l][er]

I'd become vice president of the student council.[l][er]

[chara_show name="seitokai" face="smile" pos="center" time="1000"]

#seitokai
Today's agenda is—[l][er]

#protagonist
The Muscle Club activity report, right?[l][er]

#seitokai
Yes. And—[l][er]

#seitokai
planning for the next event.[l][er]

#protagonist
Leave it to me.[l][er]

We're the best partners there are.[l][er]

We're not a couple—but there's more trust between us than that.[l][er]

#seitokai
...I'm grateful to have you here.[l][er]

#protagonist
Same here.[l][er]

#seitokai
...I look forward to working with you from now on.[l][er]

#protagonist
Yeah.[l][er]

#protagonist
Always.[l][er]

[chara_hide name="seitokai" time="1000"]

[chara_hide_all]
[bg storage="events/seitokai_councilroom.webp" time="1000"]

Rin Shiratori.[l][er]

The girl who tried so hard to be perfect—[l][er]

found the best partner there is.[l][er]

[if exp="f.seitokai_a"]
As vice president, I sit on the side that reads her minutes.[l][er]
[elsif exp="f.seitokai_b"]
I don't have the right to read her minutes, and never did.[l][er]
—But I'm always allowed to be there for the silence before the agenda gets decided.[l][er]
[else]
Once a year, we laugh again about that night we "rushed it," in a footnote to the minutes.[l][er]
[endif]

Not a lover—but a friend I trust more than anyone.[l][er]

(NORMAL END — "The Best Partner")[l][er]

[s]

; ================================================================================
; ■ 生徒会ルート - バッドエンディング「完璧な怪物」
; 二本目の薬を飲んだ場合。悪魔の勝利＝主人公の感情没収
; ================================================================================

*seitokai_ending_bad

[playbgm storage="bgm_despair.mp3"]

She drank it in one gulp.[l][er]

[chara_hide_all]
[bg storage="devil_space.webp" time="1500"]

The sound drained out of the world.[l][er]

Her body creaked. The seams of her uniform screamed.[l][er]

The "steps" of her muscles—turned into "walls."[l][er]

[status stage="stage2"]
[chara_show name="seitokai" face="default" pos="center" time="2000"]

—And more than that,[l][er]

the wavering left her eyes.[l][er]

#seitokai
...Ah.[l][er]

#seitokai
It's quiet.[l][er]

#protagonist
Hey... Hey![l][er]

#seitokai
I'm fine. Nothing frightens me anymore.[l][er]

#seitokai
The function called "fear"—no longer exists.[l][er]

Her voice was still hers.[l][er]

Only her voice was still hers.[l][er]

[chara_show name="akuma" face="smile" pos="left" time="1000"]

#akuma
—And that's game.[l][er]

#protagonist
Change her back.[l][er]

#akuma
Can't. I rewrote her much deeper than the first bottle did.[l][er]

#akuma
Besides—doesn't she look happy right now?[l][er]

She looked happy.[l][er]

—No. That's wrong.[l][er]

That was just a "correct answer," shaped like a smile.[l][er]

#akuma
Well then, as promised.[l][er]

#akuma
—Thanks for the meal.[l][er]

The devil's claw touched my chest.[l][er]

The heat drained away.[l][er]

The frustration. The fear. —The feeling of loving her.[l][er]

One by one, they disappeared,[l][er]

[chara_hide_all]
[bg storage="black.webp" time="2000"]

(...)[l][er]

[chara_hide_all]
[bg storage="student_council_room.webp" time="1500"]

A few months later.[l][er]

The student council president is perfect again today.[l][er]

Not a single document out of place. Her stamp is never crooked again.[l][er]

No one defies her. —No one comes near her.[l][er]

I watch her from the hallway.[l][er]

I feel nothing.[l][er]

—All I remember is that I think I used to feel something.[l][er]

(BAD END — "The Perfect Monster")[l][er]

[s]
