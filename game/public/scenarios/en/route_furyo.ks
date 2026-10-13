; route: 不良（九条冴）
; 第3話の一週間後から。冴は同好会の外部協力者で、主人公とは朝の電車で会う。
*start
[jump target="furyo_01"]

; ================================================================================
; 第1話「空いた座席」
; ================================================================================
*furyo_01
[chara_hide_all]
[bg storage="train_interior.webp" time="1000"]
[playbgm storage="bgm_daily.mp3"]

Morning. The 7:42 local train.[l][er]

Ever since I gave the devil my answer on the roof, I'd been taking this train.[l][er]
One train earlier than usual.[l][er]
—The train Sae Kujo rides.[l][er]

[chara_show name="furyo" face="default" pos="right" time="1000"]

She always stands beside the door.[l][er]

And the seats around her are always empty.[l][er]

Even when it's crowded. Even when people are standing.[l][er]
No one sits on the long bench in front of her.[l][er]

#protagonist
(...It's even emptier than a week ago.)[l][er]

I knew why.[l][er]
The shoulders of her black coat blocked half the width of the door.[l][er]
"Get close and she'll hit you"—now her looks had caught up with the rumor.[l][er]

I sat at the end of the empty bench, the spot closest to her.[l][er]

#furyo
...[l][er]

#furyo
You again.[l][er]

#protagonist
Morning.[l][er]

#furyo
...Morning.[l][er]

She answers now. Her eyes stay on the window.[l][er]
That was what had changed this past week.[l][er]

#furyo
Hey.[l][er]

#protagonist
Hm?[l][er]

#furyo
Why don't you quit doing that every morning?[l][er]

#protagonist
Doing what?[l][er]

#furyo
Going out of your way to sit next to me.[l][er]

#furyo
Look around.[l][er]

I didn't need to look.[l][er]
A few people were watching us over their phones.[l][er]
"The guy sitting next to that monster."[l][er]

#furyo
The devil said, "Take unapproachable all the way and you'll find out who comes close anyway."[l][er]

#furyo
...I found out. It was you.[l][er]

#protagonist
...[l][er]

#furyo
But I'm asking.[l][er]

[chara_show name="furyo" face="angry" pos="right" time="500"]

For the first time, she turned to face me.[l][er]

#furyo
Are you doing this out of "responsibility"?[l][er]

#furyo
Because I ended up like this because of your wish. So the least you can do is sit next to me, or whatever.[l][er]

#furyo
—If that's what it is, I don't want it.[l][er]

The train swayed.[l][er]

Her fingers tightened on the hand strap.[l][er]
The metal ring creaked, just a little.[l][er]

[glink target="furyo_01_a" text="”Responsibility, yes. But that's not all it is.”"]
[glink target="furyo_01_b" text="”...It's responsibility. Because I did this.”"]
[s]

*furyo_01_a
[eval exp="f.furyo_honest = true"]

#protagonist
It's partly responsibility.[l][er]

#protagonist
But if that were all, I could just see you at the club.[l][er]

#protagonist
It wouldn't be a reason to take an earlier train every day.[l][er]

#furyo
...[l][er]

[chara_show name="furyo" face="flustered" pos="right" time="500"]

#furyo
...Huh?[l][er]

#protagonist
The first time our eyes met on the train and I didn't look away—that wasn't responsibility. Nothing had even happened yet.[l][er]

#furyo
...[l][er]

She turned her face back to the window.[l][er]
Only her ears had gone red.[l][er]

#furyo
...Are you stupid or something?[l][er]

[jump target="furyo_01_end"]

*furyo_01_b
#protagonist
...It's responsibility.[l][er]

#protagonist
Because I'm the one who did this. I don't want to pretend otherwise.[l][er]

#furyo
...Right.[l][er]

[chara_show name="furyo" face="default" pos="right" time="500"]

#furyo
I don't hate honesty.[l][er]

#furyo
But—[l][er]

She moved a little away from me.[l][er]
One seat's worth.[l][er]

#furyo
Having someone sit next to me out of responsibility is a little colder than being left alone.[l][er]

I had nothing to say back.[l][er]

[jump target="furyo_01_end"]

*furyo_01_end
She got off at the next station.[l][er]
After stepping onto the platform, she looked back. Just once.[l][er]

[chara_hide name="furyo" time="500"]

#protagonist
(...Today's one of her club days.)[l][er]

I wiped my sweaty palms on my pants.[l][er]

[jump target="furyo_02"]

; ================================================================================
; 第2話「外部協力者」
; ================================================================================
*furyo_02
[chara_hide_all]
[bg storage="gym.webp" time="1000"]
[playbgm storage="bgm_daily.mp3"]

After school. A corner of the gym. Muscle Club practice.[l][er]

Sae comes here twice a week.[l][er]
So that a student from another school can come in, Rin files a visitor form every single time.[l][er]

[chara_show name="kakutogi" face="default" pos="left" time="800"]
[chara_show name="furyo" face="default" pos="right" time="800"]

#kakutogi
Kujo. Today you spar with me.[l][er]

#furyo
...No.[l][er]

#kakutogi
Why not? You're strong, aren't you?[l][er]

#furyo
That's exactly why not.[l][er]

#kakutogi
...That makes no sense.[l][er]

[chara_show name="gyaru" face="smile" pos="center" time="800"]

#gyaru
Okay, okay, Hibiki, stay. You're bugging Sae.[l][er]

#gyaru
Also Sae, let me take one picture. Those shoulders would SO go viral.[l][er]

#furyo
...Even more no.[l][er]

#gyaru
Aww.[l][er]

In the club, Sae talks. A little.[l][er]
Because everyone here is just as "weird" as she is.[l][er]
As long as she's here, no one leaves a seat's worth of space around her.[l][er]

[chara_hide_all]
[chara_show name="seitokai" face="default" pos="center" time="800"]

#seitokai
&f.main_name. Do you have a moment?[l][er]

#protagonist
Yeah.[l][er]

#seitokai
Sae's school contacted ours with an inquiry.[l][er]

#protagonist
...An inquiry?[l][er]

#seitokai
"There is a rumor that a student from your school made our Kujo drink something."[l][er]

#protagonist
...[l][er]

#seitokai
Her homeroom teacher handled it. "No such incident has been confirmed."[l][er]

#seitokai
That is factual. It is not the truth.[l][er]

#protagonist
...How is Kujo doing at her school?[l][er]

#seitokai
I don't know.[l][er]

#seitokai
But—every day she comes here, there are shoe prints on the sleeves of her uniform.[l][er]

Shoe prints.[l][er]
From someone kicking her.[l][er]
—And even when they kicked her, she didn't kick back.[l][er]

[chara_hide_all]
[bg storage="station.webp" time="1000"]
[playbgm storage="bgm_sadness.mp3"]

On the way home. The station platform.[l][er]

[chara_show name="furyo" face="default" pos="center" time="1000"]

#protagonist
Kujo.[l][er]

#furyo
What.[l][er]

#protagonist
Your sleeve.[l][er]

#furyo
...[l][er]

She brushed her sleeve with her hand.[l][er]
The print was almost gone already.[l][er]

#furyo
Don't notice stuff like that.[l][er]

#protagonist
Who did it?[l][er]

#furyo
What're you gonna do if I tell you?[l][er]

#protagonist
...[l][er]

#furyo
Tell me to hit them back?[l][er]

[chara_show name="furyo" face="sad" pos="center" time="500"]

#furyo
If I hit someone with this body, they'd probably die.[l][er]

It wasn't a joking voice.[l][er]

#furyo
Even with my old body, I went too far once.[l][er]

#furyo
In middle school. Some high schoolers were messing with my friend. I sent every one of them flying.[l][er]

#furyo
—The next week, they got her back. Just her. When I wasn't around.[l][er]

#protagonist
...[l][er]

#furyo
Her name's Chinatsu. I haven't seen her since.[l][er]

#furyo
When I'm close to people, they get hurt. So it's better if nobody comes near.[l][er]

#furyo
That's why I never corrected the "rumor."[l][er]

The train arrived.[l][er]

#furyo
So, you know. You should—[l][er]

[if exp="f.furyo_honest"]
#furyo
...Never mind. Forget it. You're gonna sit there again tomorrow anyway, right?[l][er]

#protagonist
I am.[l][er]

#furyo
...I know.[l][er]

Right before the doors closed, she smiled. Just barely.[l][er]
[else]
#furyo
If you're only sitting there out of responsibility, you don't have to anymore.[l][er]

#protagonist
...[l][er]

The doors closed.[l][er]
I stayed on the platform.[l][er]
—The only thing I decided was that I'd take the same train tomorrow morning too.[l][er]
[endif]

[jump target="furyo_03"]

; ================================================================================
; 第3話「化け物」
; ================================================================================
*furyo_03
[chara_hide_all]
[bg storage="classroom.webp" time="1000"]
[playbgm storage="bgm_tension.mp3"]

Three days later. Lunch break.[l][er]

[chara_show name="gyaru" face="angry" pos="center" time="800"]

#gyaru
Hey, look at this.[l][er]

Misaki shoved her phone at me.[l][er]

A short video. A station platform. The back of a black coat.[l][er]
The title: "Next Town's Monster Girl Finally On The Juice? (Theory)."[l][er]
Forty thousand views.[l][er]

#gyaru
The account that posted it is apparently the guys who had beef with Sae back in middle school. They're bragging in the comments.[l][er]

#gyaru
"We're settling this behind the station after school today."[l][er]

#protagonist
...Settling it.[l][er]

#gyaru
Even if I report it, stuff like this takes three days to come down. Trust me, I know.[l][er]

#gyaru
...What do we do?[l][er]

[chara_hide_all]
[bg storage="street_evening.webp" time="1000"]
[playbgm storage="bgm_tension.mp3"]

After school. A narrow street behind the station.[l][er]

I'd run the whole way. I was out of breath.[l][er]
My body's ordinary. I can't run like the seven of them.[l][er]

[chara_show name="furyo" face="angry" pos="center" time="800"]

—Had I made it in time?[l][er]

Sae was standing against a wall.[l][er]
In front of her, five guys. Two of them holding up phones.[l][er]

#不良A
Look, here she comes. The monster.[l][er]

#不良B
Film it, film it. If she hits us, she gets canceled. If she doesn't, she looks pathetic. Either way works.[l][er]

#不良A
Hey Kujo. How's Chinatsu doing?[l][er]

[chara_show name="furyo" face="angry" pos="center" time="300"]

Sae's fist clenched.[l][er]

There was a sound.[l][er]
The sound of her own knuckles cracking inside her fist.[l][er]

—If that swings, it's over.[l][er]
Not for them. For Sae.[l][er]

#protagonist
Kujo![l][er]

#furyo
—Stay back![l][er]

I stepped between her and the guys.[l][er]
That was all. I couldn't do anything else.[l][er]

#不良A
The hell are you?[l][er]

#protagonist
...If you're going to film someone, film me.[l][er]

#protagonist
I'm the one who made her drink that potion. So that's enough, right?[l][er]

#不良B
Huh? What's this guy talking about?[l][er]

One of them shoved me in the chest.[l][er]
My back slammed into Sae.[l][er]
—She was hard as a wall. But she was shaking.[l][er]

#furyo
...Move.[l][er]

#protagonist
No.[l][er]

#furyo
Move. You're gonna get hit.[l][er]

#protagonist
I don't care if I get hit. It's way better than you hitting them.[l][er]

#furyo
...![l][er]

A siren sounded in the distance.[l][er]
Before I ran here, I'd asked Misaki to call the station.[l][er]

#不良A
...Tch. Let's go.[l][er]

The guys lowered their phones and scattered.[l][er]

[chara_show name="furyo" face="sad" pos="center" time="800"]

#furyo
...[l][er]

#protagonist
...Are you hurt?[l][er]

#furyo
That's my line.[l][er]

She was looking at my chest.[l][er]
Where I'd been shoved. There was a shoe print on my shirt.[l][er]

#furyo
...Matches the one on my sleeve.[l][er]

#protagonist
That's not funny.[l][er]

#furyo
I'm not laughing.[l][er]

She started to brush the print off my shirt with her fingers—[l][er]
and stopped halfway.[l][er]

#furyo
...If I touch you, I might break you.[l][er]

[jump target="furyo_04"]

; ================================================================================
; 第4話「二本目」
; ================================================================================
*furyo_04
[chara_hide_all]
[bg storage="park_night.webp" time="1000"]
[playbgm storage="bgm_isolation.mp3"]

That night.[l][er]

I couldn't sleep, so I'd gone to the convenience store. On the way back,[l][er]
I saw a black coat in the park near the station.[l][er]

[chara_show name="furyo" face="sad" pos="right" time="1000"]

Sae was standing in front of a bench.[l][er]

The steel pipe along the back of the bench—[l][er]
was bent, in the shape of a grip.[l][er]

#furyo
...Don't look.[l][er]

#protagonist
...Kujo.[l][er]

#furyo
I just tried to sit down. I remembered what happened today, and I squeezed a little too hard, that's all.[l][er]

#furyo
And this happened.[l][er]

She was looking at her own right hand.[l][er]
The way you'd look at something frightening.[l][er]

#furyo
Today, I was this close to hitting them.[l][er]

#furyo
If you hadn't shown up, I would have. Definitely.[l][er]

#furyo
...Then what would've happened to them?[l][er]

I couldn't answer.[l][er]

[chara_show name="akuma" face="default" pos="left" time="1000"]
[playbgm storage="bgm_devil.mp3"]

#akuma
Shall I answer for you?[l][er]

#furyo
...![l][er]

#akuma
Three in the hospital. One of them probably never walks again.[l][er]

#akuma
And you'd never have anyone come near you again. Not because of a rumor this time. Because of facts.[l][er]

#protagonist
...What are you doing here?[l][er]

#akuma
Oh, don't be like that. I'm making a delivery.[l][er]

A small bottle dangled from the devil's front paw.[l][er]
The same shape as the first one. Only the color of what was inside was a little darker.[l][er]

#akuma
The second bottle.[l][er]

#akuma
Drink this, and you won't waver anymore. You won't get angry. Your hands won't shake.[l][er]

#akuma
You won't feel anything no matter what anyone says, so you won't hit anyone.[l][er]

#akuma
—And being left alone won't hurt anymore, either.[l][er]

#furyo
...[l][er]

Sae's eyes were on the bottle.[l][er]
The same eyes she'd had on the platform when she said "it's better if nobody comes near."[l][er]

#furyo
...If I drink that, nobody gets hurt?[l][er]

#akuma
Nobody. Because you won't care about anyone anymore.[l][er]

#furyo
...Nothing like what happened to Chinatsu ever happens again?[l][er]

#akuma
Never again.[l][er]

The devil set the bottle down within her reach.[l][er]

#akuma
Whether you drink it is up to you.[l][er]

Her hand moved.[l][er]

—I had to say something.[l][er]

[glink target="furyo_04_refuse" text="”It's okay if it still hurts. I'll sit next to you.”"]
[glink target="furyo_04_accept" text="”...It's your call.”"]
[s]

*furyo_04_refuse
#protagonist
It's okay if it still hurts.[l][er]

[chara_show name="furyo" face="surprised" pos="right" time="500"]

#furyo
...Huh?[l][er]

#protagonist
Getting angry, shaking—keep all of it.[l][er]

#protagonist
Today, you didn't hit them. You wanted to, and you stopped.[l][er]

#protagonist
Only someone who can feel afraid can do that.[l][er]

#protagonist
If you throw that away, it's not "I won't hit anyone"—it's "I don't care about anyone."[l][er]

#furyo
...[l][er]

#protagonist
If you're scared, I'll sit next to you. Every morning. If you can't stop your hand, I'll step in between again.[l][er]

#furyo
...You have a normal body.[l][er]

#protagonist
I know.[l][er]

#furyo
If I swung for real, you'd break too.[l][er]

#protagonist
But you won't swing.[l][er]

A long silence.[l][er]

And then—she pulled her hand back from the bottle.[l][er]

[chara_show name="furyo" face="crying" pos="right" time="500"]

#furyo
...I don't want it.[l][er]

#furyo
I don't want it. Take it back.[l][er]

[chara_show name="akuma" face="smile" pos="left" time="500"]

#akuma
...Hmm.[l][er]

#akuma
Fine. The game's still going, after all.[l][er]

[chara_hide name="akuma" time="1000"]

The shadow vanished, bottle and all.[l][er]

In front of the bent bench, Sae cried for a while.[l][er]
Without a sound. Just her shoulders.[l][er]

I sat on the end that wasn't bent.[l][er]

#furyo
...You can sit on that?[l][er]

#protagonist
Barely.[l][er]

#furyo
...Idiot.[l][er]

[eval exp="f.furyo_refused = true"]
[jump target="furyo_05"]

*furyo_04_accept
#protagonist
...It's your call.[l][er]

The instant I said it, I knew I'd gotten it wrong.[l][er]

[chara_show name="furyo" face="sad" pos="right" time="500"]

#furyo
...I see.[l][er]

#furyo
Yeah. It's about me, after all.[l][er]

She'd always decided everything on her own.[l][er]
Not correcting the rumor. Not getting close to anyone.[l][er]
—So what she'd probably wanted most[l][er]
wasn't "it's your call."[l][er]

#furyo
Because I don't want to hurt anyone ever again.[l][er]

Her hand took the bottle.[l][er]

#protagonist
—Wait![l][er]

Too late.[l][er]

[jump target="furyo_ending_bad"]

; ================================================================================
; 第5話「千夏」
; ================================================================================
*furyo_05
[chara_hide_all]
[bg storage="gym.webp" time="1000"]
[playbgm storage="bgm_daily.mp3"]

One week later.[l][er]

The video was gone.[l][er]
Misaki had kept reporting it every night for three days.[l][er]

[chara_show name="gyaru" face="smile" pos="left" time="800"]

#gyaru
Also. I don't know if I should even say this, but—[l][er]

#gyaru
There was one person in that video's comments who kept defending Sae the whole time.[l][er]

#gyaru
The account name was "chinatsu_0412."[l][er]

#protagonist
...Chinatsu.[l][er]

[chara_show name="otaku" face="default" pos="right" time="800"]

#otaku
Her identity is confirmed. We exchanged two DMs.[l][er]

#otaku
She said, "I want to see her. But if Sae doesn't want to, it's okay."[l][er]

#protagonist
...You guys.[l][er]

#gyaru
Sorry for doing it without asking. But, like—[l][er]

#gyaru
You can't get close to an "unapproachable" girl all by yourself.[l][er]

[chara_hide_all]
[bg storage="station.webp" time="1000"]
[playbgm storage="bgm_sadness.mp3"]

Saturday. The station platform.[l][er]

[chara_show name="furyo" face="default" pos="right" time="1000"]

#furyo
...Is she seriously coming?[l][er]

#protagonist
She said she would.[l][er]

#furyo
She'll probably just go home once she sees me.[l][er]

#furyo
She doesn't know my body got like this.[l][er]

#protagonist
She must have seen it in the video. She saw it and defended you anyway.[l][er]

#furyo
...[l][er]

The train pulled in.[l][er]
Among the people getting off, one small girl.[l][er]

#千夏
...Sae?[l][er]

[chara_show name="furyo" face="surprised" pos="right" time="500"]

#furyo
...Chinatsu.[l][er]

#千夏
It's Sae. It's really Sae.[l][er]

#千夏
Wow. You got so big.[l][er]

#furyo
...You're not freaked out?[l][er]

#千夏
I am. A little.[l][er]

#千夏
But back in middle school, when you stood in front of me, I was a little freaked out then too. You were way too strong.[l][er]

#furyo
...[l][er]

#千夏
You think it's your fault I got hurt afterward, don't you?[l][er]

#千夏
It's not. The people who did it are the ones to blame.[l][er]

#千夏
You're the one who protected me. I've wanted to thank you this whole time.[l][er]

#千夏
But starting the very next day, you avoided me.[l][er]

[chara_show name="furyo" face="crying" pos="right" time="500"]

#furyo
...Because...[l][er]

#furyo
Because if I was near you, it would happen again—[l][er]

#千夏
Yeah. So today, I came to you.[l][er]

Chinatsu walked right up to Sae and hugged her thick arm.[l][er]
Her own arms didn't even reach all the way around.[l][er]

#千夏
...So hard.[l][er]

#furyo
...Shut up.[l][er]

Sae cried, and didn't hug her back.[l][er]
She felt like if she did, she'd break her.[l][er]
—So instead, slowly, she rested her palm on top of Chinatsu's head.[l][er]

That hand wasn't shaking at all.[l][er]

[jump target="furyo_06"]

; ================================================================================
; 告白前夜：悪魔の味見
; ================================================================================
*furyo_06
[chara_hide_all]
[bg storage="rooftop_night.webp" time="1000"]
[playbgm storage="bgm_devil.mp3"]

That night. The roof.[l][er]

[chara_show name="akuma" face="default" pos="center" time="1000"]

#akuma
Hey there. What do you taste like right now?[l][er]

#protagonist
...Don't sample me without asking.[l][er]

#akuma
Oh, come on. You got the second bottle returned. Just a little bite.[l][er]

#akuma
...You know, that girl's wish was "to be unapproachable."[l][er]

#akuma
And you wouldn't let it come true. Sitting next to her every morning.[l][er]

#akuma
It's not a breach of contract, but it's definitely obstruction of contract.[l][er]

#protagonist
I'm not the only one who got close.[l][er]

#protagonist
Misaki, Rika, Chinatsu... She let them get close.[l][er]

#akuma
Hmm.[l][er]

[chara_show name="akuma" face="smile" pos="center" time="500"]

#akuma
Then the last question is one only you can ask.[l][er]

#akuma
"The person who sits next to her" and "the person who stays beside her" aren't the same thing.[l][er]

#akuma
Decide which one you'll be on tomorrow's train.[l][er]

[chara_hide name="akuma" time="1000"]

The shadow vanished.[l][er]

[jump target="furyo_07"]

; ================================================================================
; 第6話「七時四十二分」
; ================================================================================
*furyo_07
[chara_hide_all]
[bg storage="train_interior.webp" time="1000"]
[playbgm storage="bgm_romance.mp3"]

Monday. The 7:42.[l][er]

The bench in front of Sae was empty, as always.[l][er]
But people stood a little closer than they had a week ago.[l][er]
The video was gone, and in its place, a single photo Chinatsu posted had gone around a little.[l][er]
"My best friend since middle school. Crazy strong, but crazy kind."[l][er]

[chara_show name="furyo" face="default" pos="center" time="1000"]

I sat at my usual end of the bench.[l][er]

#furyo
...Morning.[l][er]

#protagonist
Morning.[l][er]

#furyo
...[l][er]

The train swayed.[l][er]

#furyo
Hey.[l][er]

#protagonist
Hm?[l][er]

#furyo
What are we, anyway?[l][er]

#furyo
Every morning, you sit. I stand.[l][er]

#furyo
At the club, I'm "the outside helper," and you're "one of the founders."[l][er]

#furyo
...That's it?[l][er]

I searched for the words to answer.[l][er]

It felt like if I put it into words, it would disappear.[l][er]
But—the one who first pushed me with "say it out loud" was that devil.[l][er]
I hated the idea of doing exactly what it wanted.[l][er]
So I—[l][er]

[glink target="furyo_ending_good" text="Make room beside me and say, ”Sit down.”"]
[glink target="furyo_ending_normal" text="Hold out a fist, lightly."]
[s]

; ================================================================================
; GOOD END「隣にいる」
; ================================================================================
*furyo_ending_good
#protagonist
Sit down.[l][er]

I gestured to the seat beside me.[l][er]

[chara_show name="furyo" face="surprised" pos="center" time="500"]

#furyo
...Huh?[l][er]

#protagonist
Every morning, I've been the one sitting next to you. Today, you sit.[l][er]

#protagonist
Responsibility, wishes—none of that matters. I want you beside me.[l][er]

#furyo
...[l][er]

#furyo
...If I sit, I'll take up two seats.[l][er]

#protagonist
That's fine.[l][er]

#furyo
Our shoulders'll touch.[l][er]

#protagonist
That's fine.[l][er]

#furyo
...People are gonna stare again.[l][er]

#protagonist
Let them.[l][er]

[chara_show name="furyo" face="blush" pos="center" time="500"]

She sat down.[l][er]
Beside me.[l][er]

The seat sank a little.[l][er]
Our shoulders touched. Hard, and warm.[l][er]

#furyo
...Is it okay if I don't move it? My shoulder.[l][er]

#protagonist
Don't move it.[l][er]

#furyo
...Okay.[l][er]

The train reached her station.[l][er]

—She didn't get off.[l][er]

#protagonist
...You'll be late.[l][er]

#furyo
Once won't kill me. I'll ride to your station.[l][er]

#furyo
...You can call me Sae. Not Kujo.[l][er]

#protagonist
...Sae.[l][er]

#furyo
...Mm.[l][er]

[chara_hide_all]
[bg storage="rooftop_night.webp" time="1000"]
[playbgm storage="bgm_devil.mp3"]

[chara_show name="akuma" face="smile" pos="center" time="1000"]

#akuma
—And that's game. You win.[l][er]

#protagonist
...I figured you'd show up.[l][er]

#akuma
A promise is a promise. One bite, as a wedding gift.[l][er]

The devil's paw tapped my chest, lightly.[l][er]
Something—just the tiniest sliver—was taken.[l][er]
—Probably the very edge of that feeling, the moment the seat beside me sank this morning.[l][er]

#akuma
...Mm. Sweet. Much sweeter than I expected.[l][er]

#akuma
The taste of "beside" from a girl who took "unapproachable" all the way.[l][er]

#akuma
Bye now. I won't be coming back.[l][er]

[chara_hide name="akuma" time="1000"]

[chara_hide_all]
[bg storage="train_interior.webp" time="1000"]
[playbgm storage="bgm_ending.mp3"]

A few months later.[l][er]

The 7:42 is as crowded as ever.[l][er]
The bench in front of Sae isn't empty anymore.[l][er]

Because Sae and I are sitting on it.[l][er]

[chara_hide_all]
[bg storage="events/furyo_station.webp" time="1500"]

#furyo
...Hey.[l][er]

#protagonist
Hm?[l][er]

#furyo
The first time our eyes met, why didn't you look away?[l][er]

#protagonist
...Because I thought you looked cool.[l][er]

#furyo
...That was before my body changed.[l][er]

#protagonist
Since before it changed.[l][er]

#furyo
...Okay.[l][er]

She turned toward the window.[l][er]
Only her ears were red.[l][er]
—Our shoulders stayed touching the whole way.[l][er]

Sae Kujo.[l][er]
The girl who chose to be unapproachable[l][er]
is sitting beside me now.[l][er]

(GOOD END — "Beside Me")[l][er]
[s]

; ================================================================================
; NORMAL END「拳の約束」
; ================================================================================
*furyo_ending_normal
Instead of words, I held out my fist, lightly.[l][er]

[chara_show name="furyo" face="default" pos="center" time="500"]

#furyo
...What's that?[l][er]

#protagonist
A greeting. Between friends.[l][er]

#furyo
...You've never been in a fistfight, have you.[l][er]

#protagonist
Nope.[l][er]

#furyo
...Right.[l][er]

She hesitated a little, then touched her fist to mine.[l][er]
Just a touch. Gently, so she wouldn't break anything.[l][er]

[chara_show name="furyo" face="smile" pos="center" time="500"]

#furyo
...Not bad.[l][er]

#furyo
Even if "that's it," it's not bad. For now.[l][er]

She got off at the next station.[l][er]
On the platform, she turned and raised her fist once more.[l][er]

[chara_hide_all]
[bg storage="rooftop_night.webp" time="1000"]
[playbgm storage="bgm_devil.mp3"]

[chara_show name="akuma" face="default" pos="center" time="1000"]

#akuma
...On hold, then.[l][er]

#akuma
She didn't drink the second bottle. But you didn't become "the real thing," either.[l][er]

#akuma
I'm still hungry. And you still haven't won.[l][er]

#protagonist
...Got a problem with that?[l][er]

#akuma
Nope. I'm good at waiting.[l][er]

#akuma
You're riding the train tomorrow too, right? Looking forward to the rest.[l][er]

[chara_hide name="akuma" time="1000"]

[chara_hide_all]
[bg storage="gym.webp" time="1000"]
[playbgm storage="bgm_daily.mp3"]

A few months later.[l][er]

Muscle Club practice. Sae comes twice a week.[l][er]

[chara_show name="kakutogi" face="smile" pos="left" time="800"]
[chara_show name="furyo" face="smile" pos="right" time="800"]

#kakutogi
Kujo. Today, we spar.[l][er]

#furyo
...Fine. No contact, though.[l][er]

#kakutogi
—! Really?![l][er]

#furyo
You don't look like you'd break.[l][er]

In the middle of the gym, the two of them face off.[l][er]
Everyone gathers around.[l][er]
There's no seat's worth of space around Sae anymore.[l][er]

We're not a couple.[l][er]
But every morning, we ride the same train.[l][er]
—For now, that's enough.[l][er]

(NORMAL END — "A Promise of Fists")[l][er]
[s]

; ================================================================================
; BAD END「静かな電車」
; ================================================================================
*furyo_ending_bad
[playbgm storage="bgm_despair.mp3"]

She drank it in one gulp.[l][er]

[chara_hide_all]
[bg storage="devil_space.webp" time="1500"]

The sound drained out of the world.[l][er]

The seams of her coat split.[l][er]
Her shoulders, her back, swelled up one more stage.[l][er]

[status stage="stage2"]
[chara_show name="furyo" face="default" pos="center" time="2000"]

—And before any of that,[l][er]
the trembling left her eyes.[l][er]

#furyo
...Ah.[l][er]

#furyo
It's quiet.[l][er]

#protagonist
Kujo... Kujo![l][er]

#furyo
It's fine. I won't hit anyone anymore.[l][er]

#furyo
Because I don't want to.[l][er]

#furyo
...And I don't care about you anymore, either.[l][er]

It wasn't an accusing voice.[l][er]
It was the voice of someone reading out a fact.[l][er]

[chara_show name="akuma" face="smile" pos="left" time="1000"]

#akuma
—And that's game.[l][er]

#protagonist
Change her back.[l][er]

#akuma
Can't. I rewrote her much deeper than the first bottle did.[l][er]

#akuma
Well then, as promised. —Thanks for the meal.[l][er]

The devil's paw touched my chest.[l][er]
The heat drained away.[l][er]
The frustration. The fear. The reason I'd sat next to her every morning.[l][er]
One by one, they disappeared—[l][er]

[chara_hide_all]
[bg storage="black.webp" time="2000"]

(...)[l][er]

[bg storage="train_interior.webp" time="1500"]
[playbgm storage="bgm_isolation.mp3"]

A few months later. The 7:42.[l][er]

Beside the door stands a big girl in a black coat.[l][er]
The seats around her are empty.[l][er]
It doesn't bother her in the slightest.[l][er]

I hold onto a hand strap and look out the window.[l][er]
I don't think about sitting next to her.[l][er]
—Sometimes I wonder why I used to.[l][er]

(BAD END — "The Quiet Train")[l][er]
[s]
