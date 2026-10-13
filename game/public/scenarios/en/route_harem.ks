; route: 誰も選ばない（七人全員と向き合う）
; 第3話の屋上で「まだ誰も選ばない」を選んだ場合。主人公は七人全員に、悪魔のゲームの真相を打ち明ける。
*start
[jump target="harem_01"]

; ================================================================================
; 第1話「全部話す」
; ================================================================================
*harem_01
[chara_hide_all]
[bg storage="rooftop_night.webp" time="1000"]
[playbgm storage="bgm_devil.mp3"]

[chara_show name="akuma" face="default" pos="center" time="1000"]

#akuma
...You're still not choosing anyone?[l][er]

#protagonist
Nope.[l][er]

#akuma
I told you, didn't I? While you're being nice to everyone, someone might reach for the second bottle.[l][er]

#protagonist
I know.[l][er]

#protagonist
That's why I'm telling all of them.[l][er]

#akuma
...Telling them what?[l][er]

#protagonist
About your game. About the second bottle. About what happens if I lose. Everything.[l][er]

[chara_show name="akuma" face="smile" pos="center" time="500"]

#akuma
...Oh?[l][er]

#akuma
Sure. Nothing in the rules says "keep it a secret."[l][er]

#akuma
But once they know, they'll be angry, won't they? Finding out their hearts were the prize in a bet.[l][er]

#protagonist
I'm telling them so they can be angry.[l][er]

[chara_hide name="akuma" time="1000"]

[chara_hide_all]
[bg storage="science_prep_room.webp" time="1000"]
[playbgm storage="bgm_tension.mp3"]

The next day, after school. The science prep room.[l][er]
I called the seven of them back to the room where we'd first gathered.[l][er]

[chara_show name="seitokai" face="default" pos="center" time="800"]

#seitokai
Everyone is present. &f.main_name, the floor is yours.[l][er]

#protagonist
...There's something about the devil I haven't told you yet.[l][er]

I told them everything.[l][er]

How the devil came to my room that night.[l][er]
How it told me, "This is a game."[l][er]
If I became "the real thing" with one of the seven, I'd win.[l][er]
If one of the seven threw herself away and drank the "second bottle," the devil would win.[l][er]
How the second bottle changes the body even more, and remakes the heart along with it—into a heart that doesn't hesitate, doesn't waver, doesn't get hurt.[l][er]
And how, if the devil won, it would eat all of my emotions at once.[l][er]

—When I finished, the room was silent.[l][er]

[chara_hide_all]
[chara_show name="gyaru" face="angry" pos="left" time="800"]
[chara_show name="furyo" face="angry" pos="right" time="800"]

#gyaru
...Huh?[l][er]

#gyaru
What the hell? So our hearts were, like, the prize in a bet?[l][er]

#furyo
...Don't go betting on us.[l][er]

#protagonist
I'm not the one who made the bet. But I'm the one who started this.[l][er]

#protagonist
...I'm sorry. I should have told you sooner.[l][er]

[chara_hide_all]
[chara_show name="otaku" face="default" pos="center" time="800"]

#otaku
...I had heard a little about the existence of the second bottle.[l][er]

#otaku
The devil said to me, "You'd be interested in the second bottle too, wouldn't you?"[l][er]

#otaku
...To be honest, I was interested.[l][er]

[chara_hide_all]
[chara_show name="kakutogi" face="default" pos="left" time="800"]
[chara_show name="osananajimi" face="sad" pos="right" time="800"]

#kakutogi
...So what you're saying is this.[l][er]

#kakutogi
On whichever night one of us is at our weakest, that thing shows up with a bottle.[l][er]

#osananajimi
...And it tells us, "Drink this and you'll never have to cry again."[l][er]

#osananajimi
...Honestly, I think there'd be a night when I'd drink it.[l][er]

Yui tried to laugh and failed.[l][er]
No one laughed. Every one of them was thinking the same thing.[l][er]

[chara_hide_all]
[chara_show name="imouto" face="sad" pos="center" time="800"]

#imouto
...Senpai, what do you want to do?[l][er]

#imouto
If you pick one person, the game ends, right?[l][er]

#protagonist
...I can't choose. Not yet.[l][er]

#protagonist
While I'm facing one person, someone else might take the bottle alone.[l][er]

#protagonist
That scares me more than anything.[l][er]

#protagonist
So—I have a favor to ask.[l][er]

#protagonist
If the second bottle comes, don't take it alone.[l][er]

#protagonist
Call me. It doesn't have to be me. Call anyone here.[l][er]

#protagonist
It comes when you're alone, when you're weakest. So—we don't let anyone be alone.[l][er]

A long silence.[l][er]

[chara_hide_all]
[chara_show name="seitokai" face="default" pos="center" time="800"]

#seitokai
...I will put it in the minutes.[l][er]

#seitokai
"The Second Bottle Pact." Article One. Anyone offered the second bottle shall not accept it on the spot, and shall contact a club member.[l][er]

#seitokai
Article Two. Anyone so contacted shall come running, regardless of time or place.[l][er]

#seitokai
Article Three—[l][er]

#seitokai
...Article Three is a penalty clause for &f.main_name.[l][er]

#protagonist
...Huh?[l][er]

#seitokai
"The founder shall not carry everything alone."[l][er]

#seitokai
That is all. All in favor?[l][er]

Seven thick arms went up.[l][er]

[jump target="harem_02"]

; ================================================================================
; 第2話「夜の電話」
; ================================================================================
*harem_02
[chara_hide_all]
[bg storage="black.webp" time="1000"]
[playbgm storage="bgm_isolation.mp3"]

After that, a month passed.[l][er]

The devil came.[l][er]
Just as it said it would—on the weakest nights.[l][er]

[chara_hide_all]
[bg storage="park_night.webp" time="1000"]

[chara_show name="gyaru" face="crying" pos="left" time="800"]

—The first was Misaki.[l][er]
Two in the morning, after reading hate comments for hours.[l][er]

#gyaru
...Yui, sorry, it's so late. The cat's here. Right now.[l][er]

[chara_show name="osananajimi" face="default" pos="right" time="800"]

#osananajimi
On my way! I'm in pajamas! Three minutes![l][er]

Yui really did make it in three minutes.[l][er]
The two of them sat on a bench and talked until morning.[l][er]
The devil went home, still holding the bottle, looking bored.[l][er]

[chara_hide_all]
[bg storage="dojo_night.webp" time="1000"]

[chara_show name="kakutogi" face="angry" pos="left" time="800"]

—Next was Hibiki.[l][er]
The night her tournament ban became official.[l][er]

#kakutogi
...Kujo. Come. The dojo.[l][er]

[chara_show name="furyo" face="default" pos="right" time="800"]

#furyo
...Why me?[l][er]

#kakutogi
Because you're the best there is at "wanting to hit something and not hitting it."[l][er]

#furyo
...Is that supposed to be a compliment?[l][er]

Sae transferred trains to get there.[l][er]
The two of them did no-contact sparring all night long.[l][er]
The devil yawned in a corner of the dojo.[l][er]

[chara_hide_all]
[bg storage="science_prep_room.webp" time="1000"]

[chara_show name="otaku" face="default" pos="left" time="800"]

—Rika called Rin on her own.[l][er]

#otaku
Rin-senpai. I've been handed a bottle. I haven't opened it yet.[l][er]

#otaku
...I want to open it. Very much.[l][er]

[chara_show name="seitokai" face="default" pos="right" time="800"]

#seitokai
Understood. In that case, the student council will take custody of the bottle as "evidence."[l][er]

#seitokai
The safe can only be opened with the agreement of two people: me, and &f.main_name.[l][er]

#otaku
...That's not fair.[l][er]

#seitokai
It's procedure.[l][er]

The bottle was locked in the student council room safe.[l][er]
The devil knocked on the safe three times and went home.[l][er]

[chara_hide_all]
[bg storage="friend_house.webp" time="1000"]

[chara_show name="imouto" face="crying" pos="center" time="800"]

—Miu called me.[l][er]
The night she had a huge fight with Tomoki.[l][er]

#imouto
...Senpai. Will you come?[l][er]

#imouto
...That's Article Two, right?[l][er]

I went.[l][er]
Tomoki was the one who opened the front door.[l][er]
"Miu says she called you." That was all he said before letting me in.[l][er]

That night, the three of us baked cookies in the Takahashi kitchen.[l][er]
Outside the window, the devil scrunched up its face at the burnt smell.[l][er]

[chara_hide_all]
[bg storage="street_evening.webp" time="1000"]

[chara_show name="osananajimi" face="sad" pos="left" time="800"]
[chara_show name="seitokai" face="sad" pos="right" time="800"]

—Yui called Rin on the evening she fought with her mom.[l][er]
Rin called Yui on the night she made a mistake at student council.[l][er]
Sae called Misaki the day she got harassed at the station.[l][er]

Every night, a phone rang somewhere.[l][er]
And every time, someone ran.[l][er]

In one month, the devil came eleven times.[l][er]
All eleven times, the bottle stayed closed.[l][er]

[jump target="harem_03"]

; ================================================================================
; 第3話「最後のセール」
; ================================================================================
*harem_03
[chara_hide_all]
[bg storage="gym.webp" time="1000"]
[playbgm storage="bgm_devil.mp3"]

A month later, at night. The gym.[l][er]

Club practice had ended, and everyone was about to go home.[l][er]
Every light in the gym went out at once.[l][er]

[chara_show name="akuma" face="default" pos="center" time="1000"]

#akuma
...Okay, seriously.[l][er]

#akuma
Isn't this cheating?[l][er]

In the middle of the dark gym, the devil floated.[l][er]
Around it—seven small bottles, lined up in midair.[l][er]

#akuma
One month, eleven times. Every single one ruined by one phone call.[l][er]

#akuma
My game is the "make them choose alone on their weakest night" game, you know.[l][er]

#akuma
Never being alone has to be against the rules.[l][er]

#protagonist
The rules don't say "you have to take it alone."[l][er]

#akuma
...Your personality's gotten worse.[l][er]

[chara_show name="akuma" face="smile" pos="center" time="500"]

#akuma
Fine. Then, a final sale.[l][er]

#akuma
Seven bottles. One for everyone. Tonight, right here, I'll hand them out in front of all of you.[l][er]

#akuma
On a night when no one's weak, in a place where no one's alone—will anyone still reach for one?[l][er]

#akuma
If even one of you drinks, I win. If no one drinks—[l][er]

#akuma
...If no one drinks, what do I do? I hadn't thought about that.[l][er]

One by one, the bottles floated down in front of the seven of them.[l][er]

[chara_hide_all]
[chara_show name="osananajimi" face="default" pos="left" time="800"]

#osananajimi
...I don't want it.[l][er]

#osananajimi
I'm still in the middle of making up with Mom. If I stop crying, making up won't mean anything.[l][er]

[chara_show name="seitokai" face="default" pos="right" time="800"]

#seitokai
Unnecessary. Per Article One of the minutes, I decline to accept it.[l][er]

#seitokai
...Besides, a version of me who doesn't waver couldn't call Yui.[l][er]

[chara_hide_all]
[chara_show name="gyaru" face="smile" pos="left" time="800"]

#gyaru
Nah, I'm good. Like, if I drank this, Yui wouldn't show up in her pajamas when I'm crying over my search results anymore.[l][er]

#gyaru
That was, like, honestly the happiest I've been.[l][er]

[chara_show name="otaku" face="default" pos="right" time="800"]

#otaku
Combined with the one in the safe, that makes two samples of the second bottle.[l][er]

#otaku
...I'm returning it. My research subject has changed to "what happens after, to the ones who don't drink."[l][er]

[chara_hide_all]
[chara_show name="kakutogi" face="default" pos="left" time="800"]

#kakutogi
Don't want it. The frustration is mine.[l][er]

[chara_show name="furyo" face="default" pos="right" time="800"]

#furyo
...Don't want it.[l][er]

#furyo
I quit being "unapproachable."[l][er]

[chara_hide_all]
[chara_show name="imouto" face="default" pos="center" time="800"]

#imouto
...I don't want it.[l][er]

#imouto
I decided I'd grow up while staying a crybaby.[l][er]

The seven bottles stayed floating in midair.[l][er]

[chara_hide_all]
[chara_show name="akuma" face="default" pos="center" time="1000"]

#akuma
...[l][er]

#akuma
...And you?[l][er]

#protagonist
Me?[l][er]

#akuma
Want one too? Special offer.[l][er]

#akuma
Drink it, and you won't hesitate. Even if you can't choose any of the seven, it won't hurt at all.[l][er]

#akuma
The easiest way to "choose no one."[l][er]

An eighth bottle dangled from the devil's front paw.[l][er]

[glink target="harem_03_refuse" text="”No thanks. Hesitating is my job.”"]
[glink target="harem_03_accept" text="”...If it means nobody gets hurt...”"]
[s]

*harem_03_refuse
#protagonist
No thanks.[l][er]

#protagonist
Hesitating is my job.[l][er]

#protagonist
All seven of them just said no, hesitating the whole time. I can't be the only one who takes the easy way.[l][er]

#protagonist
Besides—Article Three. "The founder shall not carry everything alone."[l][er]

#protagonist
If I hesitate, I'll call them.[l][er]

[chara_show name="akuma" face="smile" pos="center" time="500"]

#akuma
...Pff, ahaha.[l][er]

#akuma
Ahahahaha![l][er]

The devil laughed.[l][er]
A laugh I'd never seen before—like it was clutching its stomach.[l][er]

#akuma
All eight, returned. I've never lost like this before.[l][er]

[jump target="harem_end"]

*harem_03_accept
#protagonist
...If it means nobody gets hurt...[l][er]

[chara_hide_all]
[chara_show name="osananajimi" face="angry" pos="left" time="500"]
[chara_show name="kakutogi" face="angry" pos="right" time="500"]

#osananajimi
—Idiot![l][er]

Yui's hand grabbed my wrist.[l][er]
Hibiki's hand knocked the devil's bottle away.[l][er]

#kakutogi
That's a violation of Article Three.[l][er]

#osananajimi
Rin-senpai wrote "don't carry it alone," didn't she?![l][er]

[chara_hide_all]
[chara_show name="seitokai" face="angry" pos="center" time="500"]

#seitokai
...I am adding a penalty.[l][er]

#seitokai
"The founder shall serve as the club's cleaning duty for the next year."[l][er]

#protagonist
...That's harsh.[l][er]

#seitokai
That's the lenient version.[l][er]

I was surrounded by seven of them.[l][er]
Every one of them was angry—and every one of them looked about to cry.[l][er]

#protagonist
...Sorry. I don't want it. I really don't.[l][er]

[chara_show name="akuma" face="smile" pos="left" time="500"]

#akuma
...Aww. This time his friends stopped him.[l][er]

#akuma
All eight, returned.[l][er]

[jump target="harem_end"]

; ================================================================================
; SPECIAL END「八本の返品」
; ================================================================================
*harem_end
[chara_hide_all]
[chara_show name="akuma" face="default" pos="center" time="1000"]
[playbgm storage="bgm_sadness.mp3"]

#akuma
...So. How do I score this?[l][er]

#akuma
No one drank the second bottle. So I didn't win.[l][er]

#akuma
But no one became "the real thing" with you, either. So you didn't win.[l][er]

#akuma
...No verdict.[l][er]

#akuma
Seven wavering hearts right in front of me, the whole time, and I can't take a single bite.[l][er]

#akuma
This is the worst game ever. First time this has ever happened.[l][er]

#protagonist
...Sorry about that.[l][er]

#akuma
You should be.[l][er]

The eight bottles scattered and were sucked into the devil's shadow.[l][er]

#akuma
...But remember this.[l][er]

#akuma
The game isn't over. Someday you might choose someone. Or you might never choose anyone.[l][er]

#akuma
When that happens, if anyone spends a night alone—I'll be back.[l][er]

#protagonist
...If you come, a phone will just ring.[l][er]

[chara_show name="akuma" face="smile" pos="center" time="500"]

#akuma
...Heh. I'm sure it will.[l][er]

#akuma
Bye now. I'll drop by now and then, still hungry.[l][er]

[chara_hide name="akuma" time="1000"]

Every light in the gym came back on at once.[l][er]

[chara_hide_all]
[bg storage="gym.webp" time="1000"]
[playbgm storage="bgm_ending.mp3"]

After that, half a year passed.[l][er]

[bg storage="events/harem_gym.webp" time="1500"]

The Muscle Club is still meeting today, in a corner of the gym.[l][er]

Yui sometimes fights with her mom, and sometimes makes up.[l][er]
The "Second Bottle Pact" page is still in Rin's minutes.[l][er]
Sometimes everyone shows up on Misaki's streams.[l][er]
Rika's research theme is "what happens after, to the ones who don't drink." She's still collecting data.[l][er]
Hibiki can compete in tournaments now, in the kata division.[l][er]
Sae transfers trains to come twice a week.[l][er]
Miu's cookies don't break anymore. Not a single one.[l][er]

I still haven't chosen anyone.[l][er]
I don't know if that's the right answer.[l][er]

But—if my phone rings in the middle of the night, I'll run.[l][er]
Whether one of the seven is calling. Or one of the seven is calling for me.[l][er]

No one spends a night alone.[l][er]
—That's our answer, for now.[l][er]

(SPECIAL END — "Eight Bottles Returned")[l][er]
[s]
