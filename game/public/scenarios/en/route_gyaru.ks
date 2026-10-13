; route: ギャル（星野美咲）
; 第3話の一週間後から。美咲が「看板」として上げた写真が、バズっている。
*start
[jump target="gyaru_01"]

; ================================================================================
; 第1話「10万いいね」
; ================================================================================
*gyaru_01
[chara_hide_all]
[bg storage="rooftop.webp" time="1000"]
[playbgm storage="bgm_daily.mp3"]

Lunch break. The roof.[l][er]

[chara_show name="gyaru" face="smile" pos="center" time="1000"]

#gyaru
Look look look![l][er]

Misaki shoved her phone in front of my face. Too close to see anything.[l][er]

#protagonist
Too close.[l][er]

#gyaru
Just look! Here![l][er]

On the screen was a photo of her, taken in the gym.[l][er]
Both arms bent, making biceps. Instead of a peace sign.[l][er]
The photo she'd posted a week ago as the club's "sign."[l][er]

#gyaru
A hundred thousand likes. A HUNDRED THOUSAND. The old me maxed out at, like, three hundred.[l][er]

#gyaru
Forty thousand new followers in one week. And around a hundred DMs a day.[l][er]

#protagonist
...That's amazing.[l][er]

#gyaru
Right? That cat said it, didn't it? "Number one in a whole different category."[l][er]

#gyaru
I'm literally number one. Search "muscle schoolgirl" and I'm the top result.[l][er]

She was laughing. Louder than usual.[l][er]
—But the hand holding her phone kept refreshing the screen, over and over.[l][er]
While she talked. While she laughed. Only her thumb, like a separate living thing.[l][er]

#gyaru
So. I've got a favor to ask.[l][er]

#gyaru
I'm thinking of streaming every night starting tonight. Rin-senpai said I can use the gym.[l][er]

#gyaru
Will you be my camera guy? A tripod can't get good angles.[l][er]

#gyaru
You probably know the "best parts" of my muscles better than anyone, right?[l][er]

#protagonist
...What's that supposed to mean?[l][er]

#gyaru
Exactly what it sounds like, Mr. "His Type."[l][er]

A teasing voice. But her eyes were serious.[l][er]

[glink target="gyaru_01_a" text="”Okay. I'll film.”"]
[glink target="gyaru_01_b" text="”...Don't do it every night.”"]
[s]

*gyaru_01_a
[eval exp="f.gyaru_camera = true"]

#protagonist
Okay. I'll film.[l][er]

[chara_show name="gyaru" face="smile" pos="center" time="500"]

#gyaru
For real? Yesss![l][er]

#gyaru
Then seven o'clock tonight. If you're late, I'm posting your sleeping face.[l][er]

#protagonist
You don't even have one.[l][er]

#gyaru
If I ask Yui, I bet she's got one from elementary school.[l][er]

#protagonist
Don't.[l][er]

She left the roof, laughing.[l][er]
—Halfway down the stairs, I heard her unlock her phone again.[l][er]

[jump target="gyaru_02"]

*gyaru_01_b
#protagonist
...Don't do it every night.[l][er]

[chara_show name="gyaru" face="angry" pos="center" time="500"]

#gyaru
Huh? Why not?[l][er]

#protagonist
Right now, while you're talking to me, you keep refreshing.[l][er]

#gyaru
...No I'm not.[l][er]

#protagonist
You are. Right now.[l][er]

She stopped her thumb.[l][er]
The finger she'd stopped was trembling, just a little.[l][er]

#gyaru
...Ugh, so annoying.[l][er]

#gyaru
Fine. I'll use a tripod. I was stupid to ask you.[l][er]

#gyaru
...Someone finally found me. If you're gonna get in the way, then you're a "hater" too.[l][er]

She left the roof.[l][er]
The door shut a little harder than it needed to.[l][er]

[jump target="gyaru_02"]

; ================================================================================
; 第2話「可愛い、が来ない」
; ================================================================================
*gyaru_02
[chara_hide_all]
[bg storage="gym.webp" time="1000"]
[playbgm storage="bgm_tension.mp3"]

Three days later. The gym at night.[l][er]

[if exp="f.gyaru_camera"]
I was holding Misaki's phone.[l][er]
In the glow of the ring light, she struck a pose.[l][er]
[else]
I was standing at the gym entrance.[l][er]
Rin had let me in—"as long as you're only watching."[l][er]
In front of the tripod, Misaki was posing alone.[l][er]
[endif]

[chara_show name="gyaru" face="smile" pos="center" time="1000"]

#gyaru
Okaaay, here we go again tonight! Three thousand watching live! That's insane![l][er]

#gyaru
Got a request. "Show us your back"? Sure thing![l][er]

The comments poured down the edge of the screen like a waterfall.[l][er]

"way too big lol"[l][er]
"is this edited?"[l][er]
"gorilla"[l][er]
"damn how do you even get like that"[l][er]
"monster lmaooo"[l][er]

#gyaru
"Monster" is kinda mean, isn't it? Ahaha.[l][er]

She was laughing.[l][er]
Reading the comments out loud, roasting them back, laughing.[l][er]

One hour.[l][er]
The moment the stream ended—everything drained out of her face.[l][er]

[chara_show name="gyaru" face="sad" pos="center" time="500"]

#gyaru
...Hey.[l][er]

#protagonist
Hm?[l][er]

#gyaru
Do you know how many comments there were tonight?[l][er]

#protagonist
...No.[l][er]

#gyaru
Eight thousand two hundred. I read all of them.[l][er]

#gyaru
"Amazing": fourteen hundred. "Huge": nine hundred. "Monster"-type stuff: about six hundred.[l][er]

#gyaru
..."Cute": four.[l][er]

#protagonist
...[l][er]

#gyaru
Funny, right? I drank that stuff to drop out of the "cute" race.[l][er]

#gyaru
And now that I've dropped out, I want "cute" again.[l][er]

#gyaru
I did become one of a kind. One of a kind, in the "monster" category.[l][er]

[if exp="f.gyaru_camera"]
#gyaru
...You know, you were watching me through the camera the whole time.[l][er]

#gyaru
How was it? ...Be honest.[l][er]

#protagonist
...Through the camera, you were smiling the whole time.[l][er]

#protagonist
When I lowered the camera, you had the face you have now. And this one hurts more to look at.[l][er]

#gyaru
...Saying stuff like that isn't fair.[l][er]
[else]
#gyaru
...Why did you even come? You told me not to.[l][er]

#protagonist
I told you not to. That's why I came.[l][er]

#gyaru
...That makes no sense.[l][er]

#gyaru
...But reading all this alone in an empty gym after it's over was kinda too much, so...[l][er]

#gyaru
...Thanks for coming. Just for today.[l][er]
[endif]

[jump target="gyaru_03"]

; ================================================================================
; 第3話「検証動画」
; ================================================================================
*gyaru_03
[chara_hide_all]
[bg storage="classroom.webp" time="1000"]
[playbgm storage="bgm_tension.mp3"]

One week later. The classroom in the morning.[l][er]

Misaki's seat was empty.[l][er]

[chara_show name="otaku" face="default" pos="center" time="800"]

#otaku
This.[l][er]

Rika held out her tablet.[l][er]

The video title—"[INVESTIGATION] Viral Muscle Schoolgirl: Is She On Drugs?"[l][er]
Six hundred thousand views.[l][er]

#otaku
Scientifically, the content is nonsense. However—[l][er]

#otaku
in the second half, photos of her from middle school are placed side by side with her current ones.[l][er]

#otaku
And her school has been identified from her uniform.[l][er]

#protagonist
...[l][er]

[chara_show name="seitokai" face="default" pos="right" time="800"]

#seitokai
The school phones have been ringing nonstop since this morning.[l][er]

#seitokai
"Is there a club that uses drugs?"[l][er]

#seitokai
We've been instructed to suspend club activities for the time being.[l][er]

#protagonist
What about Hoshino?[l][er]

#seitokai
...Last night, at the end of her stream, she said "sorry, everyone" and set her account to private.[l][er]

#seitokai
She isn't answering her phone this morning.[l][er]

[chara_hide_all]
[chara_show name="osananajimi" face="sad" pos="left" time="800"]
[chara_show name="kakutogi" face="angry" pos="right" time="800"]

#osananajimi
Misaki texted me yesterday. "Sorry if I ruined the club."[l][er]

#kakutogi
...It's not her fault. It's the fault of whoever made the video.[l][er]

#osananajimi
Yeah. But Misaki thinks it's her fault.[l][er]

#osananajimi
...&f.main_name. Go find her.[l][er]

#osananajimi
Right now, the person Misaki most wants to be "found" by is probably you.[l][er]

[jump target="gyaru_04"]

; ================================================================================
; 第4話「二本目」
; ================================================================================
*gyaru_04
[chara_hide_all]
[bg storage="park_night.webp" time="1000"]
[playbgm storage="bgm_isolation.mp3"]

Night. A park on the other side of the station.[l][er]

Near Misaki's house. She'd told me once that she used to take pictures here when she was little.[l][er]

[chara_show name="gyaru" face="crying" pos="right" time="1000"]

She was on a bench, hugging her knees, staring at her phone.[l][er]
Only the light of the screen lit her face.[l][er]

#protagonist
...Hoshino.[l][er]

#gyaru
...Don't look at me.[l][er]

#gyaru
I'm not cute right now. ...Not that I ever was.[l][er]

#protagonist
...Didn't you set your account to private?[l][er]

#gyaru
I did. But I can't stop searching my own name.[l][er]

#gyaru
"Juice girl." "Her whole school's done." "Before the surgery she was just ugly lol."[l][er]

#gyaru
...I wonder who leaked my middle school photos. I deleted those myself.[l][er]

[chara_show name="akuma" face="default" pos="left" time="1000"]
[playbgm storage="bgm_devil.mp3"]

#akuma
You can't stop reading, can you.[l][er]

#gyaru
...There you are, cat.[l][er]

#akuma
Devil. ...Hey, you actually understand, don't you?[l][er]

#akuma
What you want isn't "likes." It's being found.[l][er]

#akuma
But there's no one on the other side of that screen who'll find you. There are only numbers.[l][er]

#akuma
So, here.[l][er]

A small bottle in the devil's front paw.[l][er]
The same shape as the first one. Only the color of what was inside was a little darker.[l][er]

#akuma
The second bottle. Drink this, and nothing anyone writes will make you feel a thing.[l][er]

#akuma
"Ugly," "monster," "cute"—they'll all look like the same number.[l][er]

#akuma
You can smile forever and stream forever. The perfect influencer.[l][er]

#akuma
No more crying over your own search results.[l][er]

#gyaru
...[l][er]

Misaki's eyes were on the bottle.[l][er]
The same eyes she used to look at her phone.[l][er]

#gyaru
...If I drink it, will I be okay with having caused trouble for everyone in the club too?[l][er]

#akuma
You will. It just won't bother you anymore.[l][er]

The devil set the bottle on the bench.[l][er]

#akuma
Whether you drink it is up to you.[l][er]

—I had to say it now.[l][er]
I had to say it from outside the screen.[l][er]

[glink target="gyaru_04_refuse" text="Take her phone: ”Look at the you outside the screen.”"]
[glink target="gyaru_04_accept" text="”...If it makes things easier for you.”"]
[s]

*gyaru_04_refuse
I took the phone out of her hand.[l][er]

[chara_show name="gyaru" face="surprised" pos="right" time="500"]

#gyaru
Hey—give it back.[l][er]

#protagonist
No.[l][er]

#protagonist
Look at the you outside the screen. I'm looking at her right now.[l][er]

#protagonist
Puffy eyes, red nose, messy hair, sitting on a bench hugging her knees.[l][er]

#gyaru
...That's the worst.[l][er]

#protagonist
You're cute.[l][er]

#gyaru
...Huh.[l][er]

#protagonist
You're cute. That's number five. Keep count.[l][er]

#gyaru
...![l][er]

#protagonist
I'm not going to say "amazing" or "huge." You've already gotten eight thousand of those.[l][er]

#protagonist
I'm going to say "cute" to the you who doesn't show up on screen. That's all I can do.[l][er]

[chara_show name="gyaru" face="crying" pos="right" time="500"]

#gyaru
...Idiot.[l][er]

#gyaru
Idiot. Don't say stuff like that right now.[l][er]

#gyaru
...Now I can't drink it.[l][er]

She pushed the bottle away on the bench with the back of her hand.[l][er]

#gyaru
...I don't want it. Take it back, cat.[l][er]

[chara_show name="akuma" face="smile" pos="left" time="500"]

#akuma
...Hmm. A return, huh.[l][er]

#akuma
Fine. The game's still going, after all.[l][er]

[chara_hide name="akuma" time="1000"]

The shadow vanished.[l][er]

Misaki didn't try to take her phone back.[l][er]
Instead, she pinched my sleeve between her fingertips.[l][er]

#gyaru
...What number are we at now?[l][er]

#protagonist
Of what?[l][er]

#gyaru
"Cute."[l][er]

#protagonist
...Number five.[l][er]

#gyaru
...Say number six by tomorrow.[l][er]

[eval exp="f.gyaru_refused = true"]
[jump target="gyaru_05"]

*gyaru_04_accept
#protagonist
...If it makes things easier for you.[l][er]

The instant I said it, I knew I'd gotten it wrong.[l][er]

[chara_show name="gyaru" face="sad" pos="right" time="500"]

#gyaru
...I see.[l][er]

#gyaru
So you think so too. That it'd be better.[l][er]

#gyaru
...Yeah. I'm a pain right now, huh.[l][er]

Before I could say no,[l][er]
she took the bottle—[l][er]
and flashed a peace sign at the camera, just like on her streams.[l][er]

#protagonist
—Wait![l][er]

Too late.[l][er]

[jump target="gyaru_ending_bad"]

; ================================================================================
; 第5話「カウンター、オフ」
; ================================================================================
*gyaru_05
[chara_hide_all]
[bg storage="gym.webp" time="1000"]
[playbgm storage="bgm_tension.mp3"]

Three days later. The gym at night.[l][er]

Rin had bowed to the vice principal and gotten permission to use it for one night only.[l][er]

[chara_show name="gyaru" face="default" pos="center" time="1000"]

#gyaru
...I'm gonna stream.[l][er]

#gyaru
I'm setting my account back to public. And I'm gonna talk, properly. Just once.[l][er]

#protagonist
Aren't you scared?[l][er]

#gyaru
I am. Super scared.[l][er]

#gyaru
So you do the camera. A tripod's not gonna cut it tonight.[l][er]

I held up the phone.[l][er]
On the screen, Misaki looked a little smaller than usual.[l][er]

[chara_hide_all]
[bg storage="events/gyaru_stream.webp" time="1500"]
[playbgm storage="bgm_romance.mp3"]

#gyaru
...Good evening. It's Misaki.[l][er]

#gyaru
I think a lot of you know about the video. I caused a ton of trouble for my school, too.[l][er]

#gyaru
I can't tell you why my body got like this. Even if I did, you probably wouldn't believe me.[l][er]

#gyaru
But there's one thing. Nobody forced me into this.[l][er]

#gyaru
This is a body I chose myself.[l][er]

#gyaru
...And one more thing.[l][er]

#gyaru
Starting today, I'm not looking at like counts anymore. I turned the counter off.[l][er]

#gyaru
Because I'd rather see the faces of the people who show up than a number.[l][er]

Comments scrolled by.[l][er]
"Coward." "It's obviously drugs."[l][er]
—And then.[l][er]

"I'm in Misaki's class. She honestly works so hard."[l][er]
"Same school. She's always the last one to leave the gym."[l][er]
"I was next to her in those middle school photos. She was cute back then too."[l][er]

#gyaru
...![l][er]

At the edge of the screen, someone popped into frame.[l][er]

#kakutogi
Hoshino. Can I be on camera too?[l][er]

#osananajimi
Me too! Is the spot next to Misaki open?[l][er]

#otaku
May I take about ten minutes to explain the muscle fiber composition of this body?[l][er]

#gyaru
Wait, what—you guys—[l][er]

#seitokai
This is an official club activity. As student council president, I approve it.[l][er]

The screen filled up with muscle.[l][er]
Misaki was crying and laughing.[l][er]
Even without a camera between us, she was really laughing.[l][er]

[jump target="gyaru_06"]

; ================================================================================
; 告白前夜：悪魔の味見
; ================================================================================
*gyaru_06
[chara_hide_all]
[bg storage="rooftop_night.webp" time="1000"]
[playbgm storage="bgm_devil.mp3"]

After the stream. The roof.[l][er]

[chara_show name="akuma" face="default" pos="center" time="1000"]

#akuma
Hey there. What do you taste like right now?[l][er]

#protagonist
...Don't sample me.[l][er]

#akuma
Oh, come on. I watched tonight's stream too. Twelve thousand live viewers.[l][er]

#akuma
...You know, that girl's wish was "to be one of a kind."[l][er]

#akuma
I made her "one of a kind in the monster category." That's how the contract works.[l][er]

#akuma
But tonight, there were seven of them on screen. She wasn't one of a kind anymore, and she had her best face yet.[l][er]

#protagonist
...She figured out you can be found even if you're not one of a kind.[l][er]

#akuma
Hmm.[l][er]

[chara_show name="akuma" face="smile" pos="center" time="500"]

#akuma
Then all that's left is being "one of a kind off-screen."[l][er]

#akuma
And the only one who can give her that is the person who was holding the camera.[l][er]

[chara_hide name="akuma" time="1000"]

The shadow vanished.[l][er]

[jump target="gyaru_07"]

; ================================================================================
; 第6話「投稿しない一枚」
; ================================================================================
*gyaru_07
[chara_hide_all]
[bg storage="rooftop.webp" time="1000"]
[playbgm storage="bgm_romance.mp3"]

One week later. Lunch break. The roof.[l][er]

The club suspension had been lifted. After that stream, apparently most of the calls to the school were messages of support.[l][er]

[chara_show name="gyaru" face="default" pos="center" time="1000"]

#gyaru
Hey. Take one picture.[l][er]

#protagonist
For the stream again?[l][er]

#gyaru
Nope. One I'm not posting.[l][er]

#gyaru
Take it on your phone. And keep it only on your phone.[l][er]

She stood in front of the fence.[l][er]
No biceps. No peace sign.[l][er]
She just stood there, looking at me.[l][er]

[chara_show name="gyaru" face="blush" pos="center" time="500"]

#gyaru
...I still haven't heard "cute" number six, you know.[l][er]

#gyaru
Actually, I quit counting. Likes, and "cute."[l][er]

#gyaru
So this time, not a number—tell me what's inside.[l][er]

#gyaru
How do you feel about me?[l][er]

[glink target="gyaru_ending_good" text="Take the picture: ”I love you. Off-screen and on.”"]
[glink target="gyaru_ending_normal" text="Take the picture: ”...You're the best subject there is.”"]
[s]

; ================================================================================
; GOOD END「投稿しない一枚」
; ================================================================================
*gyaru_ending_good
I pressed the shutter.[l][er]

#protagonist
I love you.[l][er]

#protagonist
Off-screen and on. Including all the times I didn't count.[l][er]

[chara_show name="gyaru" face="surprised" pos="center" time="500"]

#gyaru
...[l][er]

#gyaru
...Did you just take it?[l][er]

#protagonist
I did.[l][er]

#gyaru
Show me.[l][er]

I showed her the screen.[l][er]
Misaki in front of the fence, eyes wide, mouth half open—[l][er]
dumber-looking and cuter than in any photo I'd ever seen.[l][er]

[chara_show name="gyaru" face="smile" pos="center" time="500"]

#gyaru
...So ugly.[l][er]

#gyaru
...Don't you DARE post that. That one's yours only.[l][er]

#protagonist
I won't.[l][er]

#gyaru
...I love you too.[l][er]

#gyaru
This is way better than a hundred thousand likes.[l][er]

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
—Probably the edge of the heat in my fingertip, the moment I pressed the shutter.[l][er]

#akuma
...Mm. Not a through-the-screen flavor. It fizzes, like soda.[l][er]

#akuma
Bye now. I won't be coming back.[l][er]

[chara_hide name="akuma" time="1000"]

[chara_hide_all]
[bg storage="gym.webp" time="1000"]
[playbgm storage="bgm_ending.mp3"]

A few months later.[l][er]

Misaki still streams once a week.[l][er]
The counter's still off.[l][er]
Most of the time, I'm the one holding the camera.[l][er]

[chara_show name="gyaru" face="smile" pos="center" time="1000"]

#gyaru
Okay, that's it for tonight! See you![l][er]

The stream ends.[l][er]
Nothing drains out of her face.[l][er]

#gyaru
Hey, what about today's "cute"?[l][er]

#protagonist
...I said it three times.[l][er]

#gyaru
Not enough. Two more.[l][er]

In a locked folder on my phone, one more photo that'll never be posted was added today.[l][er]

Misaki Hoshino.[l][er]
The girl who wanted to be "one of a kind"[l][er]
now has something she doesn't need to count.[l][er]

(GOOD END — "The Photo I'll Never Post")[l][er]
[s]

; ================================================================================
; NORMAL END「最高の被写体」
; ================================================================================
*gyaru_ending_normal
I pressed the shutter.[l][er]

#protagonist
...You're the best subject there is.[l][er]

[chara_show name="gyaru" face="default" pos="center" time="500"]

#gyaru
...Subject, huh.[l][er]

#gyaru
...Hmm.[l][er]

#protagonist
Are you mad?[l][er]

#gyaru
I'm not mad. Just a little frustrated.[l][er]

[chara_show name="gyaru" face="smile" pos="center" time="500"]

#gyaru
Fine. Then I'm counting on you as my camera guy from now on.[l][er]

#gyaru
Someday I'll make you say a word that isn't "subject."[l][er]

[chara_hide_all]
[bg storage="rooftop_night.webp" time="1000"]
[playbgm storage="bgm_devil.mp3"]

[chara_show name="akuma" face="default" pos="center" time="1000"]

#akuma
...On hold, then.[l][er]

#akuma
She didn't drink the second bottle. But you didn't become "the real thing," either.[l][er]

#akuma
I'm still hungry. ...Well, that girl seems pretty persistent. I'll wait for the rest.[l][er]

[chara_hide name="akuma" time="1000"]

[chara_hide_all]
[bg storage="gym.webp" time="1000"]
[playbgm storage="bgm_daily.mp3"]

A few months later.[l][er]

Sometimes the whole club shows up on Misaki's streams.[l][er]
The "Muscle Club Channel" became school-approved. Rin stamped it, again.[l][er]

[chara_show name="gyaru" face="smile" pos="center" time="1000"]

#gyaru
Camera guuuy, that angle was perfect![l][er]

#protagonist
Yeah, yeah.[l][er]

She smiles at me through the camera.[l][er]
And sometimes, not at the camera—at me.[l][er]

(NORMAL END — "The Best Subject")[l][er]
[s]

; ================================================================================
; BAD END「永遠の配信」
; ================================================================================
*gyaru_ending_bad
[playbgm storage="bgm_despair.mp3"]

Still holding the peace sign, she drank it in one gulp.[l][er]

[chara_hide_all]
[bg storage="devil_space.webp" time="1500"]

The sound drained out of the world.[l][er]

The sleeves of her jacket split.[l][er]
Her shoulders, her arms, her legs, swelled up one more stage.[l][er]

[status stage="stage2"]
[chara_show name="gyaru" face="smile" pos="center" time="2000"]

—And before any of that,[l][er]
her swollen eyes went perfectly dry.[l][er]

#gyaru
...Oh. Whoa.[l][er]

#gyaru
I'm searching my name and I don't feel a thing. "Ugly" and "cute" are the same.[l][er]

#gyaru
Now I can stream forever. I can keep smiling forever.[l][er]

#protagonist
Hoshino...![l][er]

#gyaru
Oh, you don't need to do the camera anymore. A tripod's fine.[l][er]

#gyaru
It's the same whether you film me or a tripod does.[l][er]

[chara_show name="akuma" face="smile" pos="left" time="1000"]

#akuma
—And that's game.[l][er]

#akuma
Well then, as promised. —Thanks for the meal.[l][er]

The devil's paw touched my chest.[l][er]
The heat drained away.[l][er]
The frustration. The fear. That ache I felt watching her through the camera.[l][er]
One by one, they disappeared—[l][er]

[chara_hide_all]
[bg storage="black.webp" time="2000"]

(...)[l][er]

[bg storage="classroom.webp" time="1500"]
[playbgm storage="bgm_isolation.mp3"]

A few months later.[l][er]

Misaki has over a million followers.[l][er]
She streams eight hours every night. Whenever you look, it's the same smile.[l][er]

Someone in class shows me their phone. "This is Hoshino, right?"[l][er]
"Yeah," I answer.[l][er]
I don't think anything beyond that.[l][er]

The girl on the screen probably doesn't think anything, either.[l][er]

(BAD END — "The Endless Stream")[l][er]
[s]
