; route: 友達の妹（高橋美羽）
; 第3話の一週間後から。美羽は、兄の友樹（他校生）に、まだ体のことを話せていない。
*start
[jump target="imouto_01"]

; ================================================================================
; 第1話「パーカーの理由」
; ================================================================================
*imouto_01
[chara_hide_all]
[bg storage="park.webp" time="1000"]
[playbgm storage="bgm_daily.mp3"]

Sunday. Noon. The neighborhood park.[l][er]

Tomoki had asked me to meet him.[l][er]
My best friend since middle school. We ended up at different high schools, but we still meet up a few times a month.[l][er]

#友樹
Sorry for the short notice.[l][er]

#protagonist
It's fine. What's up?[l][er]

#友樹
...It's about Miu.[l][er]

My heart skipped a beat. The wrong way.[l][er]

#友樹
This past week, she won't look me in the eye.[l][er]

#友樹
Even inside the house, she's always wearing one of my huge hoodies. With the hood up.[l][er]

#友樹
She eats in her room. Takes her bath after I go to sleep.[l][er]

#友樹
Mom says "it's just her age." But, like... does "her age" make you break a doorknob?[l][er]

#protagonist
...A doorknob.[l][er]

#友樹
She says she grabbed it and it came off. Right at the base.[l][er]

#友樹
You go to the same school as Miu, right? Do you know anything?[l][er]

#友樹
...It's not, like, bullying or something... is it?[l][er]

I remembered Miu's message.[l][er]
"Senpai, please don't tell my brother yet. Please."[l][er]

[glink target="imouto_01_a" text="”...Ask Miu-chan yourself.”"]
[glink target="imouto_01_b" text="”...No, I don't know anything.”"]
[s]

*imouto_01_a
#protagonist
...Ask Miu-chan yourself.[l][er]

#protagonist
It's not my place to tell you. But it's not bullying. That, I promise.[l][er]

#友樹
...So you do know.[l][er]

#protagonist
...Yeah.[l][er]

#友樹
...Got it.[l][er]

#友樹
If you say so, I'll wait. Until she tells me herself.[l][er]

#友樹
...But if it turns out to be something that makes her cry, I'm getting mad at you too.[l][er]

#protagonist
...I know.[l][er]

[jump target="imouto_01_end"]

*imouto_01_b
[eval exp="f.imouto_lie = true"]

#protagonist
...No, I don't know anything.[l][er]

#友樹
...I see.[l][er]

#友樹
Sorry. Weird thing to ask. I just figured you might know something.[l][er]

Tomoki smiled.[l][er]
It was the face of someone who didn't doubt me in the slightest.[l][er]
—That face was the hardest part.[l][er]

[jump target="imouto_01_end"]

*imouto_01_end
[chara_hide_all]
[bg storage="street_evening.webp" time="1000"]
[playbgm storage="bgm_sadness.mp3"]

On the way home. Near the Takahashi house.[l][er]

[chara_show name="imouto" face="surprised" pos="center" time="1000"]

—Right as I turned the corner, I almost crashed into a big hoodie.[l][er]

#imouto
Whoa... S-Senpai.[l][er]

Miu's face peeked out from under the hood.[l][er]
The hoodie's sleeves were stretched tight around her upper arms.[l][er]
Even though it was Tomoki's hoodie. Her shoulders were already wider than Tomoki's.[l][er]

#imouto
...Were you with my brother?[l][er]

#protagonist
...Yeah.[l][er]

[if exp="f.imouto_lie"]
#protagonist
I didn't tell him anything. I said "I don't know."[l][er]

[chara_show name="imouto" face="sad" pos="center" time="500"]

#imouto
...Thank you.[l][er]

#imouto
...But I made you lie, senpai.[l][er]

#imouto
To my brother's best friend.[l][er]
[else]
#protagonist
I didn't tell him anything. I told him to ask Miu-chan himself.[l][er]

[chara_show name="imouto" face="sad" pos="center" time="500"]

#imouto
...Right. Of course you'd say that, senpai.[l][er]

#imouto
...I know. I can't hide it forever.[l][er]
[endif]

#imouto
And, senpai...[l][er]

#imouto
Could you stop calling me "Miu-chan"?[l][er]

#protagonist
...Huh?[l][er]

#imouto
When you call me "-chan," it feels like I'm back in elementary school.[l][er]

#imouto
...Even though I finally have a body like this.[l][er]

[jump target="imouto_02"]

; ================================================================================
; 第2話「潰れたクッキー」
; ================================================================================
*imouto_02
[chara_hide_all]
[bg storage="science_room.webp" time="1000"]
[playbgm storage="bgm_daily.mp3"]

A few days later. After school. The home economics room—was taken, so I asked Rika and we borrowed the science room instead.[l][er]

[chara_show name="imouto" face="flustered" pos="center" time="1000"]

#imouto
...It broke again.[l][er]

In Miu's hand, an egg had been crushed, shell and all.[l][er]
That was the fourth one.[l][er]

#imouto
I used to be able to crack them one-handed. I even bragged about it to my brother.[l][er]

#imouto
Because I liked baking cookies.[l][er]

#protagonist
...Liked?[l][er]

#imouto
...I always thought it was childish.[l][er]

#imouto
Every time my brother told you, "Miu really loves baking, huh,"[l][er]

#imouto
I'd think, "Right. I'm still 'the little kid who bakes.'"[l][er]

#imouto
So I was going to quit once I got this body.[l][er]

#imouto
...But before I knew it, I'd bought ingredients again.[l][er]

The fifth egg.[l][er]
This time, she tapped it against the edge of the bowl gently, with only her fingertips.[l][er]
A crack. The shell split cleanly in two.[l][er]

[chara_show name="imouto" face="smile" pos="center" time="500"]

#imouto
...It cracked! Senpai, it cracked![l][er]

#protagonist
Yeah. I saw.[l][er]

Miu bounced like a little kid.[l][er]
The floor creaked, just a little.[l][er]

#imouto
...Ah.[l][er]

[chara_show name="imouto" face="sad" pos="center" time="500"]

#imouto
...That was childish, wasn't it.[l][er]

#protagonist
...So what? It's fine.[l][er]

#imouto
It's not fine. I decided I'd leave both "little sister" and "kid" behind.[l][er]

#imouto
...Especially in front of you, senpai.[l][er]

That day, about half the cookies came out of the oven broken.[l][er]
Miu ate every one of the broken ones herself.[l][er]

[jump target="imouto_03"]

; ================================================================================
; 第3話「兄」
; ================================================================================
*imouto_03
[chara_hide_all]
[bg storage="friend_house.webp" time="1000"]
[playbgm storage="bgm_tension.mp3"]

Saturday of that week. The Takahashi house.[l][er]

"I've got leftover cookies, come pick them up"—Miu had asked me over, so I stepped into the entryway.[l][er]
I heard a voice from the kitchen.[l][er]

#友樹
—Miu, you...[l][er]

Tomoki was frozen in the kitchen doorway.[l][er]

[chara_show name="imouto" face="surprised" pos="center" time="1000"]

Miu had taken off the hoodie and was standing in front of the oven.[l][er]
She must have been hot. Just a short-sleeved T-shirt.[l][er]
Her arms, her shoulders, her back—Tomoki was looking at all of it.[l][er]

#imouto
...B-Big brother. Didn't you have club today...?[l][er]

#友樹
...It got canceled. Never mind that.[l][er]

#友樹
What is THAT?[l][er]

#imouto
...[l][er]

#友樹
Are you sick? Did you go to the hospital? Hey![l][er]

Tomoki turned around. He noticed me.[l][er]

[if exp="f.imouto_lie"]
#友樹
...You said you "didn't know anything," didn't you?[l][er]

#protagonist
...[l][er]

#友樹
You knew. All of it.[l][er]

#友樹
...You knew how worried I was, and you still said you didn't know.[l][er]
[else]
#友樹
...So this is what you meant by "ask her yourself."[l][er]

#友樹
...How did this even happen?[l][er]
[endif]

#protagonist
...It's my fault.[l][er]

#友樹
...Huh?[l][er]

#protagonist
I can't explain it well. But I'm the cause. It's not Miu's fault.[l][er]

Tomoki's fist clenched.[l][er]
I thought he was going to hit me.[l][er]

#imouto
—Stop![l][er]

Miu stepped between Tomoki and me.[l][er]
Tomoki's fist hit Miu's shoulder and stopped.[l][er]
It just hit and stopped. Miu didn't move an inch.[l][er]

#友樹
...![l][er]

#imouto
It's not senpai's fault. I drank it myself.[l][er]

#imouto
Because I hated being "the little sister."[l][er]

#友樹
...You hated being my little sister?[l][er]

#imouto
No matter how old I get, you only ever see "little Miu."[l][er]

#imouto
And senpai only sees me as your "little sister."[l][er]

#imouto
...So I wanted to become someone else.[l][er]

#友樹
...[l][er]

#友樹
...Go back.[l][er]

#imouto
...Huh?[l][er]

#友樹
Go back. To the old Miu. ...You can go back, right? Right?[l][er]

#imouto
...I can't go back.[l][er]

#友樹
...[l][er]

Tomoki's face crumpled.[l][er]
It wasn't an angry face.[l][er]
It was the same face he made when Miu fell down and cried when she was little.[l][er]

[chara_show name="imouto" face="crying" pos="center" time="500"]

#imouto
...Big brother, you idiot.[l][er]

Miu ran out the front door without even grabbing the hoodie.[l][er]

[jump target="imouto_04"]

; ================================================================================
; 第4話「二本目」
; ================================================================================
*imouto_04
[chara_hide_all]
[bg storage="park_night.webp" time="1000"]
[playbgm storage="bgm_isolation.mp3"]

I found her after the sun went down.[l][er]

The park where I'd talked with Tomoki on Sunday.[l][er]
Miu was sitting at the very top of the jungle gym.[l][er]

[chara_show name="imouto" face="crying" pos="right" time="1000"]

#imouto
...Senpai.[l][er]

#imouto
When I was little, I could never climb all the way up here. My brother always had to lift me.[l][er]

#imouto
Now I can make it in one step.[l][er]

#imouto
...I bent the jungle gym a little.[l][er]

[chara_show name="akuma" face="default" pos="left" time="1000"]
[playbgm storage="bgm_devil.mp3"]

#akuma
Places from when you were little always feel small once you've grown, don't they?[l][er]

#imouto
...Oh.[l][er]

#akuma
Hey. How did it feel when your brother told you to "go back"?[l][er]

#akuma
Were you sad? Or—were you frustrated, thinking "he's still treating me like a kid"?[l][er]

#imouto
...Both.[l][er]

#akuma
Figured. So, here.[l][er]

A small bottle in the devil's front paw.[l][er]
The same shape as the first one. Only the color of what was inside was a little darker.[l][er]

#akuma
The second bottle. Drink it, and you won't cry anymore. You won't lean on anyone. Whatever your brother says, you'll be fine.[l][er]

#akuma
You'll be a proper grown woman. Nobody's little sister.[l][er]

#akuma
Nobody will ever call you a "kid" again.[l][er]

#imouto
...[l][er]

Miu's eyes were on the bottle.[l][er]
Eyes wet with tears.[l][er]

#imouto
...If I stop crying, will senpai think I'm a grown-up too?[l][er]

#akuma
Probably. Nobody treats a girl who doesn't cry like a kid.[l][er]

The devil set the bottle gently on one of the jungle gym bars.[l][er]

#akuma
Whether you drink it is up to you.[l][er]

Miu's hand moved.[l][er]

[glink target="imouto_04_refuse" text="”Not crying isn't what makes you a grown-up. ...Come down, Miu.”"]
[glink target="imouto_04_accept" text="”...It's your choice, Miu-chan.”"]
[s]

*imouto_04_refuse
#protagonist
Not crying isn't what makes you a grown-up.[l][er]

[chara_show name="imouto" face="surprised" pos="right" time="500"]

#protagonist
Today, you stepped in between Tomoki and me.[l][er]

#protagonist
Knowing you'd get hit. ...A kid can't do that.[l][er]

#protagonist
Crying doesn't change that. You stepped in between us while you were crying.[l][er]

#protagonist
...Come down, Miu.[l][er]

#imouto
...[l][er]

#imouto
...You didn't say "-chan" just now.[l][er]

#protagonist
I promised I wouldn't.[l][er]

[chara_show name="imouto" face="crying" pos="right" time="500"]

#imouto
...![l][er]

Miu flicked the bottle off the bar with her finger.[l][er]
It fell into the sandbox and sank in without a sound.[l][er]

#imouto
I don't want it.[l][er]

#imouto
I'll stay a crybaby. I'll grow up while crying.[l][er]

[chara_show name="akuma" face="smile" pos="left" time="500"]

#akuma
...Hmm. A return, huh.[l][er]

#akuma
Fine. The game's still going, after all.[l][er]

[chara_hide name="akuma" time="1000"]

The shadow vanished.[l][er]

Miu jumped down from the jungle gym.[l][er]
She landed silently, with the breakfall Hibiki had taught her.[l][er]

#imouto
...Senpai. Will you go home with me? To my brother?[l][er]

#protagonist
Yeah.[l][er]

[eval exp="f.imouto_refused = true"]
[jump target="imouto_05"]

*imouto_04_accept
#protagonist
...It's your choice, Miu-chan.[l][er]

The instant I said it, I knew I'd gotten it wrong.[l][er]
"-chan" had slipped out of my mouth.[l][er]

[chara_show name="imouto" face="sad" pos="right" time="500"]

#imouto
...Oh.[l][er]

#imouto
..."-chan" again.[l][er]

#imouto
...I knew it. To you too, senpai, I'll always be "Miu-chan."[l][er]

Before I could say no,[l][er]
Miu had taken the bottle.[l][er]

#protagonist
—Wait![l][er]

Too late.[l][er]

[jump target="imouto_ending_bad"]

; ================================================================================
; 第5話「兄と妹のクッキー」
; ================================================================================
*imouto_05
[chara_hide_all]
[bg storage="friend_house.webp" time="1000"]
[playbgm storage="bgm_sadness.mp3"]

The Takahashi house. The kitchen.[l][er]

Tomoki was sitting on the floor in front of the oven.[l][er]
The smell of burnt cookies still hung in the air.[l][er]

[chara_show name="imouto" face="sad" pos="center" time="1000"]

#imouto
...Big brother.[l][er]

#友樹
...Miu.[l][er]

#友樹
...I'm sorry. For saying "go back."[l][er]

#友樹
I was scared. It felt like you'd turned into someone I didn't know.[l][er]

#友樹
...Like little Miu was gone.[l][er]

#imouto
...I'm not gone.[l][er]

#imouto
I'm not quitting being your little sister. I'll always be your one and only little sister.[l][er]

#imouto
But—I'm quitting being a kid.[l][er]

#imouto
You don't have to lift me to the top of the jungle gym anymore.[l][er]

#友樹
...[l][er]

#友樹
...I see.[l][er]

#友樹
...You got so big, huh.[l][er]

#imouto
...Yeah.[l][er]

#友樹
...Physically.[l][er]

#imouto
...You're gonna say that?[l][er]

Tomoki laughed, crying.[l][er]
Miu laughed, crying too.[l][er]

[chara_show name="imouto" face="smile" pos="center" time="500"]

#imouto
Hey, let's bake the cookies again. These ones got burnt.[l][er]

#imouto
Big brother, crack the eggs. ...Gently. Just your fingertips.[l][er]

#友樹
Why are you coaching ME?[l][er]

#imouto
Because right now I'm the best egg-cracker in the world.[l][er]

[if exp="f.imouto_lie"]
On my way out, Tomoki stopped me at the door.[l][er]

#友樹
...I'm still mad that you said you "didn't know anything."[l][er]

#protagonist
...Yeah.[l][er]

#友樹
...But you're the one who brought her home from that park.[l][er]

#友樹
Buy me yakiniku sometime. Then we're even.[l][er]
[else]
On my way out, Tomoki stopped me at the door.[l][er]

#友樹
...Thanks for telling me to "ask her myself."[l][er]

#友樹
If I'd heard it from you, I probably would've hit you. ...Though Miu would've stopped me before I could.[l][er]
[endif]

[jump target="imouto_06"]

; ================================================================================
; 告白前夜：悪魔の味見
; ================================================================================
*imouto_06
[chara_hide_all]
[bg storage="protagonist_room_night.webp" time="1000"]
[playbgm storage="bgm_devil.mp3"]

That night. My room.[l][er]

[chara_show name="akuma" face="default" pos="center" time="1000"]

#akuma
Hey there. What do you taste like right now?[l][er]

#protagonist
...Like burnt cookies.[l][er]

#akuma
Ahaha. ...You know, that girl's wish was "to leave the little sister behind."[l][er]

#akuma
But she didn't leave the little sister behind, did she? She only left the kid.[l][er]

#akuma
That's outside the terms of the contract.[l][er]

#protagonist
...Nothing about your contracts goes as planned, huh.[l][er]

#akuma
That's what humans are like.[l][er]

[chara_show name="akuma" face="smile" pos="center" time="500"]

#akuma
So, what will you call "a Miu who isn't a kid"?[l][er]

#akuma
The next name, after "best friend's little sister." Maybe think about it?[l][er]

[chara_hide name="akuma" time="1000"]

The shadow vanished.[l][er]

[jump target="imouto_07"]

; ================================================================================
; 第6話「形の崩れていないクッキー」
; ================================================================================
*imouto_07
[chara_hide_all]
[bg storage="park.webp" time="1000"]
[playbgm storage="bgm_romance.mp3"]

One week later. The park at dusk.[l][er]

The jungle gym is still standing, a little bent.[l][er]

[chara_show name="imouto" face="blush" pos="center" time="1000"]

#imouto
Senpai, this is for you.[l][er]

A small bag, tied with a ribbon.[l][er]
Not a single cookie inside was broken.[l][er]

#imouto
I made all of them with these hands.[l][er]

#imouto
The eggs, the dough, the piping bag. ...I didn't crush a single one.[l][er]

#protagonist
...That's amazing.[l][er]

#imouto
Yes. I'm amazing.[l][er]

#imouto
...And, senpai...[l][er]

#imouto
I'm not quitting being my brother's little sister.[l][er]

#imouto
But I want to quit being your "best friend's little sister."[l][er]

#imouto
...Because I love you, senpai.[l][er]

#imouto
I have ever since elementary school.[l][er]

[glink target="imouto_ending_good" text="Take the cookies: ”I love you too, Miu.”"]
[glink target="imouto_ending_normal" text="Take the cookies: ”...You're Tomoki's sister, and a junior I care about.”"]
[s]

; ================================================================================
; GOOD END「子供じゃない」
; ================================================================================
*imouto_ending_good
I took the cookies.[l][er]

#protagonist
I love you too, Miu.[l][er]

[chara_show name="imouto" face="surprised" pos="center" time="500"]

#imouto
...[l][er]

#imouto
...Not as "your best friend's little sister"?[l][er]

#protagonist
Not as that.[l][er]

#imouto
...Not as "your junior," either?[l][er]

#protagonist
Not as that, either.[l][er]

[chara_show name="imouto" face="crying" pos="center" time="500"]

#imouto
...Nn—waaaaah...[l][er]

#protagonist
You're crying?[l][er]

#imouto
I told you I'd grow up while crying, didn't I...![l][er]

[chara_hide_all]
[bg storage="protagonist_room_night.webp" time="1000"]
[playbgm storage="bgm_devil.mp3"]

[chara_show name="akuma" face="smile" pos="center" time="1000"]

#akuma
—And that's game. You win.[l][er]

#akuma
As promised, one bite. A wedding gift.[l][er]

The devil's paw tapped my chest, lightly.[l][er]
Something—just a sliver—was taken.[l][er]
—Probably the edge of the moment I laughed at Miu bawling her eyes out.[l][er]

#akuma
...Mm. Sweet. Sweeter than the cookies.[l][er]

#akuma
...Oh, and tell her brother yourself. That's outside my contract.[l][er]

#akuma
Bye now. I won't be coming back.[l][er]

[chara_hide name="akuma" time="1000"]

[chara_hide_all]
[bg storage="park.webp" time="1000"]
[playbgm storage="bgm_ending.mp3"]

A few months later.[l][er]

I told Tomoki. Properly.[l][er]
He forgave me for the price of three yakiniku dinners.[l][er]

[bg storage="events/imouto_park.webp" time="1500"]

#imouto
Senpai! Today's batch![l][er]

Miu runs toward me across the park at dusk.[l][er]
A small bag in each hand.[l][er]
The ground rumbles, just a little.[l][er]

#imouto
I made today's with my brother. He crushed three eggs.[l][er]

#protagonist
...Tomoki's really grown.[l][er]

#imouto
Yes. Because I'm a good coach.[l][er]

Miu Takahashi.[l][er]
The girl who wanted to leave "the little sister" behind[l][er]
stayed a little sister, and only left the kid behind.[l][er]
—Now, beside me, she cries sometimes, and laughs a lot.[l][er]

(GOOD END — "Not a Kid")[l][er]
[s]

; ================================================================================
; NORMAL END「大事な後輩」
; ================================================================================
*imouto_ending_normal
I took the cookies.[l][er]

#protagonist
...You're Tomoki's sister, and a junior I care about.[l][er]

[chara_show name="imouto" face="sad" pos="center" time="500"]

#imouto
...[l][er]

#imouto
...You didn't say "-chan."[l][er]

#imouto
I'll take just that much today.[l][er]

[chara_show name="imouto" face="smile" pos="center" time="500"]

#imouto
But, senpai. I'm really good at waiting.[l][er]

#imouto
I've been waiting ever since elementary school. I can wait as many more years as it takes.[l][er]

[chara_hide_all]
[bg storage="protagonist_room_night.webp" time="1000"]
[playbgm storage="bgm_devil.mp3"]

[chara_show name="akuma" face="default" pos="center" time="1000"]

#akuma
...On hold, then.[l][er]

#akuma
She didn't drink the second bottle. But you didn't become "the real thing," either.[l][er]

#akuma
I'm still hungry. ...Well, she's apparently good at waiting. So I'll wait too.[l][er]

[chara_hide name="akuma" time="1000"]

[chara_hide_all]
[bg storage="friend_house.webp" time="1000"]
[playbgm storage="bgm_daily.mp3"]

A few months later.[l][er]

Every time I visit Tomoki's house, there are cookies.[l][er]
Not a single one is ever broken.[l][er]

[chara_show name="imouto" face="smile" pos="center" time="1000"]

#imouto
Senpai, today's batch is my best yet.[l][er]

#友樹
What about mine?[l][er]

#imouto
Bake your own, big brother.[l][er]

Tomoki looks at me and shrugs.[l][er]
Miu puts one extra cookie on my plate only.[l][er]

(NORMAL END — "A Junior I Care About")[l][er]
[s]

; ================================================================================
; BAD END「大人の女の人」
; ================================================================================
*imouto_ending_bad
[playbgm storage="bgm_despair.mp3"]

She drank it in one gulp.[l][er]

[chara_hide_all]
[bg storage="devil_space.webp" time="1500"]

The sound drained out of the world.[l][er]

The seams of her blazer split.[l][er]
Her shoulders, her arms, swelled up one more stage.[l][er]

[status stage="stage2"]
[chara_show name="imouto" face="default" pos="center" time="2000"]

—And before any of that,[l][er]
her tears stopped.[l][er]
Not so much stopped, as if they'd never been falling at all.[l][er]

#imouto
...Ah. I feel calm now.[l][er]

#imouto
My brother telling me to "go back" doesn't bother me at all anymore.[l][er]

#protagonist
Miu...![l][er]

#imouto
"Miu-chan" is fine, senpai. I don't mind what anyone calls me anymore.[l][er]

#imouto
...I'll head home. I'll explain things to my brother myself. Calmly.[l][er]

[chara_show name="akuma" face="smile" pos="left" time="1000"]

#akuma
—And that's game.[l][er]

#akuma
Well then, as promised. —Thanks for the meal.[l][er]

The devil's paw touched my chest.[l][er]
The heat drained away.[l][er]
The frustration. The fear. The memory of laughing together at broken cookies.[l][er]
One by one, they disappeared—[l][er]

[chara_hide_all]
[bg storage="black.webp" time="2000"]

(...)[l][er]

[bg storage="friend_house.webp" time="1500"]
[playbgm storage="bgm_isolation.mp3"]

A few months later.[l][er]

When I visit Tomoki's house, Miu quietly brings me tea.[l][er]
"Welcome." In a polite, grown-up voice.[l][er]

There are no baking ingredients in the kitchen anymore.[l][er]
Tomoki doesn't laugh much these days.[l][er]

I drink my tea and go home.[l][er]
I try to remember what Miu's cookies tasted like—and can't find a reason to.[l][er]

(BAD END — "A Grown Woman")[l][er]
[s]
