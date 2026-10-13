; route: 幼なじみ（藤咲結衣）
; 第3話の一週間後から。結衣の母は、変わった娘の顔を、まだ見られずにいる。
*start
[jump target="osananajimi_01"]

; ================================================================================
; 第1話「ドア越しの晩ごはん」
; ================================================================================
*osananajimi_01
[chara_hide_all]
[bg storage="gym.webp" time="1000"]
[playbgm storage="bgm_daily.mp3"]

After school. The gym, after club was over and everyone had gone home.[l][er]

[chara_show name="osananajimi" face="default" pos="center" time="1000"]

Yui was still stretching.[l][er]
Yesterday too. And the day before. She'd stayed until the very end.[l][er]

#protagonist
...Aren't you going home?[l][er]

#osananajimi
I am. In a bit.[l][er]

#protagonist
You said that yesterday too.[l][er]

#osananajimi
...[l][er]

Yui hugged her knees, still sitting on the floor.[l][er]
The arms hugging her knees were thick. So were the knees.[l][er]
The same pose as the little girl who used to cry in our front hallway.[l][er]

[chara_show name="osananajimi" face="sad" pos="center" time="500"]

#osananajimi
My mom, she...[l][er]

#osananajimi
Ever since that day, she won't look at my face.[l][er]

#protagonist
...[l][er]

#osananajimi
She doesn't yell or anything. She still makes dinner.[l][er]

#osananajimi
But when I come home, she goes into the kitchen. My dinner gets left outside my room.[l][er]

#osananajimi
She says "welcome home" through the door. Without looking at me.[l][er]

#osananajimi
...I mean, yeah. That makes sense. Your daughter turns into this overnight.[l][er]

Her face tried to laugh and failed.[l][er]

#osananajimi
Hey. Will you walk home with me today?[l][er]

#protagonist
All the way to your house?[l][er]

#osananajimi
Yeah. To the front door.[l][er]

#osananajimi
When you're with me, Mom makes her "normal face." Just a little.[l][er]

#osananajimi
You've been part of the scenery at our place since we were little.[l][er]

—Scenery.[l][er]
Furniture—that's what the devil had called her, that night.[l][er]
And now she was leaning on that "furniture."[l][er]

#protagonist
...Okay. I'll come.[l][er]

[chara_hide_all]
[bg storage="street_evening.webp" time="1000"]
[playbgm storage="bgm_sadness.mp3"]

In front of the Fujisaki house. Three doors down from mine.[l][er]

The front door opened.[l][er]

[chara_show name="mother" face="neutral" pos="left" time="1000"]
[chara_show name="osananajimi" face="default" pos="right" time="1000"]

#mother
...Oh, &f.main_name.[l][er]

#mother
It's been a while. Would you like to come in?[l][er]

Mrs. Fujisaki's eyes were on me.[l][er]
She was careful not to look below the shoulders of Yui, standing next to me.[l][er]

#osananajimi
...I'm home.[l][er]

#mother
...Welcome home. Dinner's ready.[l][er]

That was all she said before she started to turn her back.[l][er]

#protagonist
—Um.[l][er]

#mother
...Yes?[l][er]

If I was going to say it, it had to be now.[l][er]

[glink target="osananajimi_01_a" text="”Yui is like this because of me.”"]
[glink target="osananajimi_01_b" text="”Yui's been working really hard at her club.”"]
[s]

*osananajimi_01_a
[eval exp="f.osa_honest = true"]

#protagonist
Yui is like this because of me.[l][er]

[chara_show name="osananajimi" face="surprised" pos="right" time="500"]

#osananajimi
Wait—[l][er]

#mother
...What do you mean?[l][er]

#protagonist
I can't explain all of it. I don't think you'd believe me.[l][er]

#protagonist
But I'm what started it. Something I wished for is the cause.[l][er]

#protagonist
So—please look at Yui. If you're going to be angry, be angry at me.[l][er]

Mrs. Fujisaki looked at me for a long time.[l][er]
Then, for the first time, she looked at Yui.[l][er]
Her shoulders. Her arms. Then her face.[l][er]

#mother
...You two have always been like this.[l][er]

#mother
Whenever one of you broke something, the other would come running to say "I did it."[l][er]

#mother
...There's enough dinner for three. Come in.[l][er]

Mrs. Fujisaki went back into the kitchen.[l][er]
But this time, she didn't close the door.[l][er]

[jump target="osananajimi_01_end"]

*osananajimi_01_b
[eval exp="f.osa_lie = true"]

#protagonist
Yui's been working really hard at her club.[l][er]

#protagonist
We all started this thing called the Muscle Club. And so, suddenly—[l][er]

#mother
..."Suddenly" doesn't turn someone into this.[l][er]

#protagonist
...[l][er]

#mother
It's all right. I can tell you're covering for her.[l][er]

#mother
You've always been that kind of boy.[l][er]

Mrs. Fujisaki smiled, just a little.[l][er]
But she never once looked at Yui.[l][er]

#mother
I'll leave her dinner outside her room.[l][er]

[chara_show name="osananajimi" face="sad" pos="right" time="500"]

#osananajimi
...[l][er]

[jump target="osananajimi_01_end"]

*osananajimi_01_end
[chara_hide name="mother" time="500"]

[chara_show name="osananajimi" face="default" pos="center" time="500"]

#osananajimi
...Thanks. For coming to the door with me.[l][er]

#protagonist
The door was as far as I got.[l][er]

#osananajimi
That's still enough.[l][er]

#osananajimi
...Hey. You know...[l][er]

#osananajimi
I drank that potion because I wanted to quit being "furniture."[l][er]

#osananajimi
And today I used you like furniture. "It's enough if you're just here."[l][er]

#osananajimi
...That's not fair of me, huh.[l][er]

#protagonist
It's fine.[l][er]

#osananajimi
It's not. If I don't tell myself it's not fair, I'll just keep leaning on you.[l][er]

The front door closed.[l][er]
I walked the three houses home slower than usual.[l][er]

[jump target="osananajimi_02"]

; ================================================================================
; 第2話「鏡の前の他人」
; ================================================================================
*osananajimi_02
[chara_hide_all]
[bg storage="gym.webp" time="1000"]
[playbgm storage="bgm_isolation.mp3"]

A few days later. In front of the big mirror by the gym stage.[l][er]

[chara_show name="osananajimi" face="default" pos="center" time="1000"]

Yui was staring at herself in the mirror.[l][er]

#osananajimi
...Hey. Who do you think this is?[l][er]

#protagonist
It's Yui.[l][er]

#osananajimi
That was fast.[l][er]

#protagonist
There's nothing to think about.[l][er]

#osananajimi
...That's the thing.[l][er]

[chara_show name="osananajimi" face="angry" pos="center" time="500"]

#osananajimi
Mom can't look at me anymore. Kids in class look at me like I'm a meme now.[l][er]

#osananajimi
Everyone looks at me differently than before.[l][er]

#osananajimi
Except you. You look at me the exact same way you always have.[l][er]

#protagonist
...Is that a bad thing?[l][er]

#osananajimi
It's not bad. It helps. A lot.[l][er]

#osananajimi
But, you know—[l][er]

Yui turned around.[l][er]
Wearing the same face as the one in the mirror.[l][er]

#osananajimi
The place I wanted to change was in YOUR eyes.[l][er]

#osananajimi
Even with my body like this, to you I'm still just "the usual Yui."[l][er]

#osananajimi
...Which means I'm still furniture, doesn't it?[l][er]

I tried to say something back. Nothing came out.[l][er]

Looking at her the same way as always.[l][er]
I'd thought that was the kindest thing I could give her.[l][er]
—It was the one thing she least wanted to receive.[l][er]

[chara_show name="osananajimi" face="sad" pos="center" time="500"]

#osananajimi
...Sorry. I'm taking it out on you.[l][er]

#osananajimi
It's not your fault, and I still say it to you. I always have.[l][er]

#protagonist
...You always have. It's fine.[l][er]

#osananajimi
It's not fine.[l][er]

She slung a towel over her shoulder and left the gym.[l][er]
Only I was left in the mirror.[l][er]
Just me. Unchanged.[l][er]

[jump target="osananajimi_03"]

; ================================================================================
; 第3話「おばさんの電話」
; ================================================================================
*osananajimi_03
[chara_hide_all]
[bg storage="protagonist_room_night.webp" time="1000"]
[playbgm storage="bgm_sadness.mp3"]

Friday night, that same week.[l][er]

My phone rang.[l][er]
The name on the screen was "Mrs. Fujisaki (Yui's mom)."[l][er]
A number my mom had saved for me back in elementary school.[l][er]

#mother
...&f.main_name? I'm sorry to call so late.[l][er]

#protagonist
It's fine.[l][er]

[if exp="f.osa_honest"]
#mother
The other day, you said, "It's because of me."[l][er]

#mother
I've been thinking about it ever since. About her body.[l][er]

#mother
...Honestly, whether it's your fault or not doesn't matter to me.[l][er]

#mother
There's only one thing I want to know.[l][er]

#mother
Does she smile, at school?[l][er]

#protagonist
...She does. Sometimes she's forcing it, but she does.[l][er]

#mother
I see.[l][er]

#mother
...She doesn't smile at home anymore. Because I can't make her smile.[l][er]
[else]
#mother
Today when I went to leave her dinner outside her room, the door was open a crack.[l][er]

#mother
I saw her phone screen. "Muscle Club"—Hoshino-san? A post from one of her friends.[l][er]

#mother
...I knew perfectly well that "suddenly, from her club" was a lie.[l][er]

#mother
But in that photo, she was smiling. She looked like she was having so much fun.[l][er]

#mother
...She doesn't smile at home anymore.[l][er]
[endif]

#mother
Tell me. What am I supposed to do?[l][er]

#mother
When I look at her, I go searching for "the old Yui." In her face. In her voice.[l][er]

#mother
When I find her, I'm relieved. When I don't, I get scared.[l][er]

#mother
...She must hate being looked at like that.[l][er]

#protagonist
...[l][er]

It's the same, I thought.[l][er]
I only see "the old Yui," and Mrs. Fujisaki is searching for "the old Yui."[l][er]
—Neither of us is looking at who Yui is now.[l][er]

#protagonist
...Mrs. Fujisaki.[l][er]

#protagonist
Would you talk with Yui tomorrow? Properly. I'll come too.[l][er]

#mother
...Yes. Please.[l][er]

[jump target="osananajimi_04"]

; ================================================================================
; 第4話「二本目」
; ================================================================================
*osananajimi_04
[chara_hide_all]
[bg storage="street_evening.webp" time="1000"]
[playbgm storage="bgm_tension.mp3"]

Saturday evening. In front of the Fujisaki house.[l][er]

I arrived earlier than we'd agreed.[l][er]

—I heard voices from inside the front door.[l][er]

#mother
...That's why I'm saying, at least your hair, like before—[l][er]

#osananajimi
Changing my hair back won't change my arms back![l][er]

#mother
I never said I wanted you changed back![l][er]

#osananajimi
You do! You say it with your eyes, all the time![l][er]

#mother
...[l][er]

#mother
...Fine. Then I'll say it.[l][er]

#mother
Yes, I want her back. The old Yui.[l][er]

Everything went silent.[l][er]

The front door flew open.[l][er]

[chara_show name="osananajimi" face="crying" pos="center" time="500"]

Yui came running out.[l][er]
She didn't notice me.[l][er]
She just kept running. Straight down the road, into the sunset.[l][er]

#protagonist
Yui![l][er]

[chara_hide_all]
[bg storage="park_night.webp" time="1000"]
[playbgm storage="bgm_isolation.mp3"]

I didn't find her until after the sun went down.[l][er]

The park the two of us used to go to when we were little.[l][er]
Yui was standing beside the swings.[l][er]

[chara_show name="osananajimi" face="crying" pos="right" time="1000"]
[chara_show name="akuma" face="default" pos="left" time="1000"]
[playbgm storage="bgm_devil.mp3"]

—And next to her, there was a black shadow.[l][er]

#akuma
...See? Didn't I tell you? You wouldn't be "the Yui they're used to" anymore.[l][er]

#akuma
You quit being furniture. But there's no place for a you that isn't furniture. Not yet.[l][er]

#osananajimi
...[l][er]

#akuma
Here. For you.[l][er]

A small bottle in the devil's front paw.[l][er]
The same shape as the first one. Only the color of what was inside was a little darker.[l][er]

#akuma
The second bottle. Drink it, and you won't cry anymore. You won't get angry.[l][er]

#akuma
Even when your mom goes looking for "the old Yui," you'll be able to give her the old Yui's face, no problem.[l][er]

#akuma
Whatever anyone says, you'll smile and smile, and answer "welcome home" with "I'm home."[l][er]

#akuma
You won't get in anyone's way. You won't ask anyone for anything. —A perfect good girl.[l][er]

#osananajimi
...That's furniture.[l][er]

#akuma
Yep. But furniture that doesn't hurt anymore.[l][er]

Yui's hand reached slowly toward the bottle.[l][er]

#osananajimi
...If it doesn't hurt, maybe that's fine.[l][er]

#osananajimi
It'd be easier for Mom, too.[l][er]

#protagonist
—Yui.[l][er]

[chara_show name="osananajimi" face="surprised" pos="right" time="500"]

#osananajimi
...Why are you here?[l][er]

#akuma
Hey there. You came at a good moment.[l][er]

#akuma
We were just talking about her "future." Whether she drinks it is up to her, of course.[l][er]

There was something I had to say.[l][er]
Something I'd never said, something I'd always covered up with my "usual" eyes.[l][er]

[glink target="osananajimi_04_refuse" text="”I love who you are now. Not the old Yui.”"]
[glink target="osananajimi_04_accept" text="”...Whatever's easier for you.”"]
[s]

*osananajimi_04_refuse
#protagonist
I love who you are now.[l][er]

#osananajimi
...[l][er]

#protagonist
Not "the old Yui." Not "the usual Yui," either.[l][er]

#protagonist
You, right now—with thick arms, fighting with your mom, taking it out on me, crying in a park.[l][er]

#protagonist
...The reason I always looked at you "like usual" was because it was easy.[l][er]

#protagonist
As long as I treated you being beside me as a given, I never had to choose anything.[l][er]

#protagonist
I'm the one who turned you into furniture. I'm sorry.[l][er]

[chara_show name="osananajimi" face="crying" pos="right" time="500"]

#osananajimi
...Not fair.[l][er]

#osananajimi
Saying that now isn't fair.[l][er]

#protagonist
I know.[l][er]

#osananajimi
...![l][er]

Yui's hand stopped just short of the bottle.[l][er]
And then—it became a fist.[l][er]

#osananajimi
...I don't want it.[l][er]

#osananajimi
Even if it hurts. If it takes away how it felt just now, being told "I love you," then I don't want it.[l][er]

[chara_show name="akuma" face="smile" pos="left" time="500"]

#akuma
...Aww. A return, huh.[l][er]

#akuma
Fine. The game's still going, after all.[l][er]

[chara_hide name="akuma" time="1000"]

The shadow vanished.[l][er]

Yui sat down on a swing.[l][er]
The chains creaked. They never used to creak when we were little.[l][er]

#osananajimi
...If the swing breaks, it's your fault.[l][er]

#protagonist
How?[l][er]

#osananajimi
It's always been that way.[l][er]

She was crying, and smiling just a little.[l][er]

[eval exp="f.osa_refused = true"]
[jump target="osananajimi_05"]

*osananajimi_04_accept
#protagonist
...Whatever's easier for you.[l][er]

The instant I said it, I knew I'd gotten it wrong.[l][er]

[chara_show name="osananajimi" face="sad" pos="right" time="500"]

#osananajimi
...I see.[l][er]

#osananajimi
I knew it. For you too, that'd be better, huh.[l][er]

#osananajimi
The usual Yui.[l][er]

Before I could say no,[l][er]
she'd already taken the bottle.[l][er]

#protagonist
—Wait![l][er]

Too late.[l][er]

[jump target="osananajimi_ending_bad"]

; ================================================================================
; 第5話「ただいま」
; ================================================================================
*osananajimi_05
[chara_hide_all]
[bg storage="street_evening.webp" time="1000"]
[playbgm storage="bgm_sadness.mp3"]

The next evening. In front of the Fujisaki house.[l][er]

[chara_show name="osananajimi" face="default" pos="right" time="1000"]

#osananajimi
...Not just to the front door.[l][er]

#osananajimi
Today, come inside.[l][er]

#protagonist
Okay.[l][er]

Yui opened the front door herself.[l][er]

[chara_show name="mother" face="neutral" pos="left" time="1000"]

#mother
...Yui.[l][er]

#osananajimi
...I'm home.[l][er]

#mother
...Welcome home.[l][er]

Mrs. Fujisaki didn't go into the kitchen.[l][er]
She stayed right there in the entryway.[l][er]

#osananajimi
Mom. There's something I have to tell you.[l][er]

#osananajimi
My body didn't just end up like this on its own.[l][er]

#osananajimi
I was told, "If you drink this, you can't go back," and I chose to drink it anyway.[l][er]

#mother
...Why?[l][er]

#osananajimi
Because I wanted to change. Because I hated being stuck in the same place forever.[l][er]

#osananajimi
...I'm sorry. I can't give you the old Yui back.[l][er]

#osananajimi
But the Yui I am now is still your daughter.[l][er]

Mrs. Fujisaki didn't say anything.[l][er]
Without a word, she reached out—and touched Yui's arm.[l][er]

It was a thick arm. Her palm couldn't cover even half of it.[l][er]

#mother
...You're warm.[l][er]

#mother
When you had a fever, I made you an ice pillow, remember? It's the same as then.[l][er]

#mother
...It's Yui's warmth.[l][er]

[chara_show name="osananajimi" face="crying" pos="right" time="500"]

#osananajimi
...![l][er]

#mother
I'm sorry for saying such awful things.[l][er]

#mother
I might not be able to stop searching for the old Yui right away.[l][er]

#mother
But—even while I'm searching, I'll look at who you are now. Properly.[l][er]

#mother
...Let's eat dinner in the kitchen. Together. The three of us.[l][er]

Yui burst into tears like a little kid.[l][er]
Mrs. Fujisaki was crying too.[l][er]

I took my time taking off my shoes in the entryway.[l][er]

[jump target="osananajimi_06"]

; ================================================================================
; 告白前夜：悪魔の味見
; ================================================================================
*osananajimi_06
[chara_hide_all]
[bg storage="protagonist_room_night.webp" time="1000"]
[playbgm storage="bgm_devil.mp3"]

That night. My room.[l][er]

[chara_show name="akuma" face="default" pos="center" time="1000"]

#akuma
Hey there. What do you taste like right now?[l][er]

#protagonist
...I told you not to show up in people's rooms.[l][er]

#akuma
Oh, come on. The house three doors down was lively today.[l][er]

#akuma
...You know, that girl's wish was "to quit being furniture."[l][er]

#akuma
I didn't prepare anywhere for her to go after she quit. That's how the contract works.[l][er]

#akuma
She made that place herself. With her mom. And with you.[l][er]

#protagonist
...[l][er]

[chara_show name="akuma" face="smile" pos="center" time="500"]

#akuma
And the last seat is still open.[l][er]

#akuma
The next seat for a girl who quit being the "childhood friend." What you name it—that's up to you.[l][er]

[chara_hide name="akuma" time="1000"]

The shadow vanished.[l][er]

Outside my window, the second-floor light three doors down was still on.[l][er]

[jump target="osananajimi_07"]

; ================================================================================
; 第6話「三軒先」
; ================================================================================
*osananajimi_07
[chara_hide_all]
[bg storage="street_evening.webp" time="1000"]
[playbgm storage="bgm_romance.mp3"]

One week later. Walking home from the club.[l][er]

Three more houses to go.[l][er]

[chara_show name="osananajimi" face="default" pos="center" time="1000"]

#osananajimi
...Hey.[l][er]

#protagonist
Hm?[l][er]

#osananajimi
Lately Mom keeps taking pictures of me. Without asking.[l][er]

#osananajimi
She's all, "It's for the record, the record." She lines them up next to my old photos.[l][er]

#protagonist
...That's nice.[l][er]

#osananajimi
Yeah. It is.[l][er]

In the evening glow, she stopped walking.[l][er]
Not in front of my house. Not in front of hers. Right in the middle.[l][er]

[chara_show name="osananajimi" face="blush" pos="center" time="500"]

#osananajimi
Hey. What you said in the park.[l][er]

#osananajimi
Does that still count?[l][er]

#protagonist
...[l][er]

#osananajimi
"I love who you are now."[l][er]

#osananajimi
I've been replaying it every night since. Every time, I nearly break the swing.[l][er]

#osananajimi
...So I want to ask properly.[l][er]

#osananajimi
Can I quit being your "childhood friend"?[l][er]

[glink target="osananajimi_ending_good" text="”Quit. And be my girlfriend.”"]
[glink target="osananajimi_ending_normal" text="”...Don't quit being my childhood friend, either.”"]
[s]

; ================================================================================
; GOOD END「真ん中の場所」
; ================================================================================
*osananajimi_ending_good
#protagonist
Quit.[l][er]

#protagonist
And—be my girlfriend.[l][er]

[chara_show name="osananajimi" face="surprised" pos="center" time="500"]

#osananajimi
...[l][er]

#osananajimi
...I should've recorded that.[l][er]

#protagonist
I'm not saying it twice.[l][er]

#osananajimi
I'll make you. From now on, as many times as I want.[l][er]

[chara_show name="osananajimi" face="smile" pos="center" time="500"]

Yui held out her hand.[l][er]
When we were little, she used to pull me along by the hand to kindergarten every morning.[l][er]

The hand I took was much bigger, much stronger than back then—[l][er]
and just as sweaty as it was back then.[l][er]

#osananajimi
...Heh. Your hand's so tiny.[l][er]

#protagonist
Yours is just huge.[l][er]

#osananajimi
I know. —I chose it myself.[l][er]

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
—Probably the edge of the sweat on our hands, the moment we held them in the evening glow.[l][er]

#akuma
...Mm. I've never tasted anything simmered this long. A ten-year vintage.[l][er]

#akuma
Bye now. I won't be coming back.[l][er]

[chara_hide name="akuma" time="1000"]

[chara_hide_all]
[bg storage="school_gate.webp" time="1000"]
[playbgm storage="bgm_ending.mp3"]

A few months later.[l][er]

Morning. Yui comes out of the house three doors down.[l][er]
In the doorway, Mrs. Fujisaki holds up her phone and waves.[l][er]

[chara_hide_all]
[bg storage="events/osananajimi_schoolgate.webp" time="1500"]

#osananajimi
Morning. ...Here.[l][er]

I take the hand she offers.[l][er]
It happens every morning, and every morning my heart still skips.[l][er]

#osananajimi
Hey. We're not "the usual" anymore, are we?[l][er]

#protagonist
Nope.[l][er]

#osananajimi
...Heh. A little different every day.[l][er]

Yui Fujisaki.[l][er]
The girl who quit being my "childhood friend"[l][er]
is beside me now, in a brand new place.[l][er]

(GOOD END — "Right in the Middle")[l][er]
[s]

; ================================================================================
; NORMAL END「三軒先の幼なじみ」
; ================================================================================
*osananajimi_ending_normal
#protagonist
...Don't quit being my childhood friend, either.[l][er]

[chara_show name="osananajimi" face="sad" pos="center" time="500"]

#osananajimi
...[l][er]

#protagonist
You, right now, matter to me. That's true.[l][er]

#protagonist
But I can't throw away ten years of "the usual" all at once.[l][er]

#osananajimi
...I see.[l][er]

#osananajimi
That's not fair. ...But it's so you.[l][er]

[chara_show name="osananajimi" face="smile" pos="center" time="500"]

#osananajimi
Then I'll wait. Until you can throw away "the usual."[l][er]

#osananajimi
I'm not furniture anymore, you know. I'll keep moving on my own while I wait.[l][er]

#protagonist
...I'll brace myself.[l][er]

[chara_hide_all]
[bg storage="protagonist_room_night.webp" time="1000"]
[playbgm storage="bgm_devil.mp3"]

[chara_show name="akuma" face="default" pos="center" time="1000"]

#akuma
...On hold, then.[l][er]

#akuma
She didn't drink the second bottle. But you didn't become "the real thing," either.[l][er]

#akuma
I'm still hungry. ...Well, she's waited ten years. I suppose I can wait a little longer.[l][er]

[chara_hide name="akuma" time="1000"]

[chara_hide_all]
[bg storage="street_evening.webp" time="1000"]
[playbgm storage="bgm_daily.mp3"]

A few months later.[l][er]

Walking home from the club. The two of us, as far as three doors down.[l][er]

[chara_show name="osananajimi" face="smile" pos="center" time="1000"]

#osananajimi
See you tomorrow.[l][er]

#protagonist
Yeah. See you tomorrow.[l][er]

The same words every day.[l][er]
But sometimes, after she says them, she looks back.[l][er]
As if she's mixing a little bit of "not the usual" into "the usual."[l][er]

(NORMAL END — "The Girl Three Doors Down")[l][er]
[s]

; ================================================================================
; BAD END「完璧な家具」
; ================================================================================
*osananajimi_ending_bad
[playbgm storage="bgm_despair.mp3"]

She drank it in one gulp.[l][er]

[chara_hide_all]
[bg storage="devil_space.webp" time="1500"]

The sound drained out of the world.[l][er]

The sleeves of her uniform split.[l][er]
Her shoulders, her arms, swelled up one more stage.[l][er]

[status stage="stage2"]
[chara_show name="osananajimi" face="smile" pos="center" time="2000"]

—And before any of that,[l][er]
the tears drained out of her swollen eyes.[l][er]

#osananajimi
...Oh. I'm fine.[l][er]

#osananajimi
It doesn't hurt at all anymore.[l][er]

#protagonist
Yui...![l][er]

#osananajimi
Let's go home. Mom's probably worried.[l][er]

#osananajimi
I'll apologize properly. With a smile, like "the old Yui."[l][er]

It was her usual smile.[l][er]
The usual smile I'd seen beside me for ten years.[l][er]
—So usual that Yui was nowhere in it.[l][er]

[chara_show name="akuma" face="smile" pos="left" time="1000"]

#akuma
—And that's game.[l][er]

#akuma
Well then, as promised. —Thanks for the meal.[l][er]

The devil's paw touched my chest.[l][er]
The heat drained away.[l][er]
The frustration. The fear. The warmth of the memory of being led by the hand in the evening glow.[l][er]
One by one, they disappeared—[l][er]

[chara_hide_all]
[bg storage="black.webp" time="2000"]

(...)[l][er]

[bg storage="school_gate.webp" time="1500"]
[playbgm storage="bgm_isolation.mp3"]

A few months later.[l][er]

Every morning, Yui from three doors down smiles and says, "Morning."[l][er]
She's getting along with her mom, apparently. They never fight. Not once.[l][er]

I say "morning" back.[l][er]
That's all.[l][er]
She asks for nothing, and I feel nothing.[l][er]

Like furniture that's always been there.[l][er]

(BAD END — "Perfect Furniture")[l][er]
[s]
