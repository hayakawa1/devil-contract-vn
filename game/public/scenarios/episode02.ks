; ■ 悪魔との契約 - 第2話：地獄の朝
*start

; ================================================================================
*start_scene_1
; Scene 1: 登校前の異変
; ================================================================================

[bg storage="room_morning.png" time="1000"]
[playbgm storage="bgm_daily.mp3"]

（翌朝。）[l][er]

#protagonist
（……あれ、なんか体が重い）[l][er]

#protagonist
（夢、見てたっけ……？）[l][er]

（スマホを見る。）[l][er]

【LINE通知：7件】[l][er]

#protagonist
（……誰からだ？）[l][er]

#osananajimi
『おはよ……じゃなくて、ヤバい』[l][er]
#osananajimi
『マジでヤバい』[l][er]
#osananajimi
『今すぐ来て』[l][er]

#seitokai
『緊急連絡。至急相談したいことがあります』[l][er]

#gyaru
『え、マジで無理なんだけど』[l][er]

#otaku
『興味深い現象が発生しました。データを送ります』[l][er]

#protagonist
（……なんだこれ）[l][er]


; ================================================================================
*start_scene_2
; Scene 2: 学校到着
; ================================================================================

[bg storage="classroom.png" time="1000"]
[playbgm storage="bgm_tension.mp3"]

（教室に着くと——）[l][er]

（いつもと違う空気。）[l][er]

#モブ男子A
……なあ、見た？[l][er]

#モブ男子B
見た。あれ、マジで……[l][er]

#protagonist
？[l][er]

（幼なじみが、教室の隅にいた。）[l][er]

[chara_show name="osananajimi" face="sad" pos="left" time="1000"]

#protagonist
（……あれ？）[l][er]

#protagonist
（腕が……太い？）[l][er]

#osananajimi
……見ないで[l][er]

#protagonist
……[l][er]

#osananajimi
昨日の夜、あの薬飲んだら……朝起きたらこうなってた[l][er]

#osananajimi
制服、きつい……[l][er]

（確かに、袖が少し食い込んでいる。）[l][er]

#protagonist
（まさか……あいつが言ってた薬か……）[l][er]

[chara_hide name="osananajimi" time="1000"]


; ================================================================================
*start_scene_3
; Scene 3: 次々と発覚
; ================================================================================

[bg storage="hallway.png" time="1000"]
[playbgm storage="bgm_tension.mp3"]

（廊下を歩いていると——）[l][er]

#seitokai
&f.main_nameさん[l][er]

[chara_show name="seitokai" face="default" pos="center" time="1000"]

#protagonist
生徒会長……[l][er]

（彼女も、明らかに体格が変わっている。）[l][er]

（肩幅が広がり、腕に筋肉の輪郭が見える。）[l][er]

#seitokai
……見ましたか[l][er]

#protagonist
ああ……[l][er]

#seitokai
私だけではないようですね[l][er]

（廊下を、ギャルが歩いてくる。）[l][er]

[chara_show name="gyaru" face="surprised" pos="right" time="1000"]

#gyaru
マジやば……みんな見てくるし[l][er]

（彼女も、同じだ。筋肉質な体。）[l][er]

#protagonist
（まさか、全員……？）[l][er]

[chara_hide name="seitokai" time="500"]
[chara_hide name="gyaru" time="500"]


; ================================================================================
*start_scene_4
; Scene 4: 理科準備室での集合
; ================================================================================

[bg storage="science_prep_room.png" time="1000"]
[playbgm storage="bgm_tension.mp3"]

（昼休み。理科準備室。）[l][er]

（集まったのは——7人。）[l][er]

（他校の不良少女は、生徒会長が「事情確認」という名目で来客扱いにした。）[l][er]

[chara_show name="osananajimi" face="sad" pos="left" time="500"]
[chara_show name="seitokai" face="default" pos="center" time="500"]
[chara_show name="gyaru" face="surprised" pos="right" time="500"]

#osananajimi
……なんで私たち、こうなったの[l][er]

#seitokai
原因不明です。医学的にあり得ない[l][er]

#gyaru
あたし、昨日変な薬飲んだんだけど……[l][er]

[chara_hide name="osananajimi" time="500"]
[chara_hide name="seitokai" time="500"]
[chara_hide name="gyaru" time="500"]

[chara_show name="otaku" face="default" pos="left" time="500"]

#otaku
私もです[l][er]

[chara_show name="kakutogi" face="default" pos="center" time="500"]

#kakutogi
……私もだ[l][er]

[chara_show name="furyo" face="default" pos="right" time="500"]

#furyo
……同じく[l][er]

[chara_hide name="otaku" time="500"]
[chara_hide name="kakutogi" time="500"]
[chara_hide name="furyo" time="500"]

[chara_show name="imouto" face="sad" pos="center" time="500"]

#imouto
……私も[l][er]

[chara_hide name="imouto" time="500"]

（沈黙。）[l][er]

#protagonist
（7人全員……）[l][er]

#protagonist
（俺が願ったせいで……）[l][er]


; ================================================================================
*start_scene_5
; Scene 5: 悪魔の再登場
; ================================================================================

[bg storage="science_prep_room.png" time="1000"]
[playbgm storage="bgm_devil.mp3"]

#akuma
みんな揃ってるね[l][er]

[chara_show name="akuma" face="default" pos="center" time="1000"]

#全員
！[l][er]

#osananajimi
あなた……！[l][er]

#akuma
昨日の薬、効いたみたいだね[l][er]

#seitokai
これは、あなたの仕業ですか[l][er]

#akuma
仕業？　違うよ[l][er]

[chara_show name="akuma" face="smile" pos="center" time="500"]

#akuma
君たちが、自分で飲んだんでしょ[l][er]

#gyaru
でも、こんなこと聞いてない！[l][er]

#akuma
言ったよ。"戻れなくなる"って[l][er]

悪魔は、にこりと笑った。[l][er]

#akuma
それに——[l][er]

（主人公を見る。）[l][er]

#akuma
彼が望んだんだ。"筋肉ムキムキの彼女"を[l][er]

#protagonist
……っ[l][er]

全員が、主人公を見る。[l][er]

#osananajimi
……え？[l][er]

#seitokai
&f.main_nameさん、これは……[l][er]

#akuma
願いは叶ったよ。7人もいるし、大盤振る舞いだね[l][er]

#protagonist
待てよ！　俺は——[l][er]

#akuma
願ったでしょ。筋肉ムキムキの彼女が欲しいって[l][er]

#akuma
僕は、叶えただけ[l][er]

#akuma
ああ、そうだ。言い忘れてた[l][er]

[chara_show name="akuma" face="default" pos="center" time="500"]

#akuma
君の体も、少し強化しておいたから[l][er]

#protagonist
……は？[l][er]

#akuma
彼女たちの相手をするには、それくらい必要でしょ[l][er]

#akuma
じゃあ、楽しんでね[l][er]

（悪魔は、消えた。）[l][er]

[chara_hide name="akuma" time="1000"]

（残されたのは、重い沈黙。）[l][er]


; ================================================================================
*start_scene_6
; Scene 6: 責任
; ================================================================================

[bg storage="science_prep_room.png" time="1000"]
[playbgm storage="bgm_sadness.mp3"]

[chara_show name="osananajimi" face="sad" pos="center" time="1000"]

#osananajimi
……そうだったんだ[l][er]

#protagonist
違う、俺は——[l][er]

[chara_hide name="osananajimi" time="500"]
[chara_show name="seitokai" face="default" pos="center" time="500"]

#seitokai
でも、事実ですね[l][er]

[chara_hide name="seitokai" time="500"]
[chara_show name="gyaru" face="angry" pos="center" time="500"]

#gyaru
マジで……最悪[l][er]

[chara_hide name="gyaru" time="500"]

#protagonist
……すまない[l][er]

[chara_show name="otaku" face="default" pos="left" time="500"]

#otaku
謝罪されても、戻りませんけど[l][er]

[chara_show name="kakutogi" face="default" pos="right" time="500"]

#kakutogi
……私は、別に構わない[l][er]

#kakutogi
強くなれたし[l][er]

[chara_hide name="otaku" time="500"]
[chara_hide name="kakutogi" time="500"]

[chara_show name="furyo" face="default" pos="left" time="500"]

#furyo
……[l][er]

[chara_show name="imouto" face="blush" pos="right" time="500"]

#imouto
……私も[l][er]

#imouto
これで、先輩に……[l][er]

（言いかけて、止まる。）[l][er]

[chara_hide name="furyo" time="500"]
[chara_hide name="imouto" time="500"]

[chara_show name="osananajimi" face="sad" pos="left" time="500"]

#osananajimi
……どうすればいいの[l][er]

[chara_show name="seitokai" face="default" pos="right" time="500"]

#seitokai
まず、状況を整理しましょう[l][er]

#seitokai
私たち7人が、同じ薬を飲んだ[l][er]

#seitokai
結果、筋肉が急激に増えた[l][er]

#seitokai
戻る方法は——[l][er]

[chara_hide name="seitokai" time="500"]
[chara_show name="otaku" face="default" pos="right" time="500"]

#otaku
ありません。悪魔はそう言いました[l][er]

[chara_hide name="osananajimi" time="500"]
[chara_hide name="otaku" time="500"]

（沈黙。）[l][er]

#osananajimi
……じゃあ、どうするの[l][er]

（誰も答えられない。）[l][er]


; ================================================================================
[jump storage="episode03.ks"]
