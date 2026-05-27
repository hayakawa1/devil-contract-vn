; route: ギャル
*start
[jump target="gyaru_00"]

; source: 第1話_10万いいね.txt
*gyaru_00
; ■ ギャルルート - 第1話「10万いいね」

; SNS依存度：+3（バズへの執着）
; 孤立度：0

; ================================================================================
*gyaru_00_scene_1
; シーン1：昼休み／屋上（バズったSNS）
; ================================================================================

[bg storage="rooftop.png" time="1000"]
[playbgm storage="bgm_daily.mp3"]

（昼休み。屋上。）[l][er]

（ギャルが、俺を呼び出した。）[l][er]

[chara_show name="gyaru" face="default" pos="center" time="1000"]

#gyaru
見てこれ[l][er]

（スマホを突きつけられた。）[l][er]

（画面には、彼女の写真。）[l][er]

（——ムキムキの、ポージング写真。）[l][er]


#protagonist
お前、これ——[l][er]

#gyaru
バズった[l][er]

#protagonist
は？[l][er]

#gyaru
10万いいね。まじウケる[l][er]

（笑ってる。）[l][er]

（いつもみたいに、笑ってる。）[l][er]

（でも——）[l][er]

#gyaru
"加工じゃないの？"とか"どこのジム？"とか、めっちゃリプきてる[l][er]


#protagonist
……[l][er]

（通知が、止まらない。）[l][er]

（画面が、延々とリプライで埋まっている。）[l][er]

[chara_hide name="gyaru" time="1000"]

; ================================================================================
*gyaru_00_scene_2
; シーン2：屋上（承認への執着）
; ================================================================================

[bg storage="rooftop.png" time="1000"]
[playbgm storage="bgm_isolation.mp3"]

#gyaru
あたしさ、前から思ってたんだよね。バズりたいって[l][er]

（彼女は、空を見上げた。）[l][er]

#gyaru
可愛い子なんていっぱいいるじゃん。あたしより可愛い子、いくらでも[l][er]

#protagonist
……[l][er]

#gyaru
でもこれはさ、あたしだけじゃん。唯一じゃん[l][er]

（彼女の目が、キラキラしている。）[l][er]

（でも——）[l][er]

（それは、嬉しさじゃない。）[l][er]

（何かに、憑かれているような目。）[l][er]

#protagonist
お前——[l][er]

#gyaru
だから続ける。もっとバズる[l][er]

#protagonist
待て。それ、バレるぞ。学校に[l][er]

#gyaru
バレたら何？[l][er]

#protagonist
何って——[l][er]

#gyaru
誰も関係ないじゃん。あたしの体でしょ[l][er]

（彼女は、スマホをしまった。）[l][er]

[chara_hide name="gyaru" time="1000"]

; ================================================================================
*gyaru_00_scene_3
; シーン3：写真撮影の依頼
; ================================================================================

[bg storage="rooftop.png" time="1000"]
[playbgm storage="bgm_romance.mp3"]

#gyaru
ね、今度写真撮ってよ。一人じゃ限界あるし[l][er]

#protagonist
俺が？[l][er]

#gyaru
他に誰がいんの[l][er]

（じっと見てくる。）[l][er]

#gyaru
……あんたに撮ってほしいの。だめ？[l][er]

（その目だけは——）[l][er]

（笑ってなかった。）[l][er]

#protagonist
……[l][er]


[glink target="gyaru_00_choice_a" text="わかった、撮ってやる"]
[glink target="gyaru_00_choice_b" text="やめとけ。危ないぞ"]
[s]
[chara_hide name="furyo" time="1000"]

; ================================================================================
*gyaru_00_scene_4a
; シーン4A：承諾後（距離が縮まる）
; ================================================================================

[bg storage="rooftop.png" time="1000"]
[playbgm storage="bgm_romance.mp3"]

#gyaru
……ありがと[l][er]

（小さく、そう言った。）[l][er]

#protagonist
何が[l][er]

#gyaru
あんたが撮ってくれるなら——[l][er]

（彼女は、少し笑った。）[l][er]

#gyaru
なんか、安心[l][er]

#protagonist
……[l][er]

#gyaru
変だよね。SNSに載せるのに[l][er]

#protagonist
……変だな[l][er]

#gyaru
でしょ[l][er]

（彼女は、スマホを見た。）[l][er]

（通知が、まだ増え続けている。）[l][er]

#gyaru
……あたし、どこまで行けるかな[l][er]

#protagonist
……[l][er]

（俺は、嫌な予感がした。）[l][er]

[jump target="gyaru_00_scene_5"]

[chara_hide name="furyo" time="1000"]

; ================================================================================
*gyaru_00_scene_4b
; シーン4B：拒絶後（孤立が深まる）
; ================================================================================

[bg storage="rooftop.png" time="1000"]
[playbgm storage="bgm_isolation.mp3"]

（ギャルは、一人で階段を降りていった。）[l][er]

#protagonist
（……まずかったか）[l][er]

（でも、あれは危ない。）[l][er]

（炎上するかもしれない。）[l][er]

（身バレするかもしれない。）[l][er]

#protagonist
（……）[l][er]

（彼女の背中が、小さく見えた。）[l][er]

[jump target="gyaru_00_scene_5"]

[chara_hide name="furyo" time="1000"]

; ================================================================================
*gyaru_00_scene_5
; シーン5：悪魔の囁き
; ================================================================================

[bg storage="rooftop.png" time="1000"]
[playbgm storage="bgm_tension.mp3"]

（放課後。）[l][er]

（屋上に、あいつがいた。）[l][er]

[chara_show name="akuma" face="smile" pos="center" time="1000"]

#akuma
面白いね、彼女[l][er]

#protagonist
……[l][er]

#akuma
10万いいね。すごいじゃない[l][er]

#protagonist
お前、何を——[l][er]

#akuma
何もしてないよ[l][er]

（悪魔は、笑った。）[l][er]

#akuma
ただ——[l][er]

#akuma
筋肉は、バズる[l][er]

#akuma
見てもらえる。注目される[l][er]

#akuma
でも——[l][er]

（悪魔の目が、冷たくなる。）[l][er]

#akuma
見られすぎると、どうなるか[l][er]

#protagonist
……[l][er]

#akuma
楽しみだね[l][er]


（影が、消えた。）[l][er]

[jump target="gyaru_01"]

; ================================================================================

*gyaru_00_choice_a
#protagonist
わかった。撮ってやる[l][er]

#gyaru
ほんと？[l][er]

（彼女の顔が、明るくなる。）[l][er]

#gyaru
やった！ じゃあ今度の日曜——[l][er]

#protagonist
でも、条件がある[l][er]

#gyaru
……なに[l][er]

#protagonist
俺が見て、ダメだと思ったら投稿するな[l][er]

#gyaru
……[l][er]

（彼女は、少し考えた。）[l][er]

#gyaru
……わかった[l][er]




[jump target="gyaru_00_scene_4a"]

*gyaru_00_choice_b
#protagonist
やめとけ。SNSは危ない[l][er]

#gyaru
……[l][er]

（彼女の目が、冷たくなる。）[l][er]

#gyaru
あっそ[l][er]

#protagonist
おい——[l][er]

#gyaru
わかった。自分で撮るし[l][er]

（彼女は、背を向けた。）[l][er]

#gyaru
もういい[l][er]




[jump target="gyaru_00_scene_4b"]

; ================================================================================
; ■ ギャルルート - 第2話「撮影会」
; テーマ：承認欲求 / 本当の自分
; ================================================================================

*gyaru_01
[chara_hide_all]
[bg storage="park.png" time="1000"]
[playbgm storage="bgm_daily.mp3"]

（日曜日。公園。）[l][er]

（約束通り、ギャルの写真を撮ることになった。）[l][er]

[chara_show name="gyaru" face="smile" pos="center" time="1000"]

#gyaru
おっそーい。待ったし[l][er]

#protagonist
5分前だろ[l][er]

#gyaru
女子を待たせるとか最悪[l][er]

#protagonist
……で、どう撮ればいい？[l][er]

#gyaru
んー、とりあえずポージングするから、いい感じに撮って[l][er]

（彼女は、カメラの前に立った。）[l][er]

（そして——筋肉を見せつけるポーズ。）[l][er]

#protagonist
（……すごいな）[l][er]

（彼女の体は、明らかに普通じゃない。）[l][er]

（でも——どこか、作り物みたいだ。）[l][er]

[chara_hide name="gyaru" time="1000"]

; ================================================================================
*gyaru_01_scene_2
; シーン2：撮影中の違和感
; ================================================================================

[bg storage="park.png" time="1000"]
[playbgm storage="bgm_daily.mp3"]

（何枚か撮った。）[l][er]

[chara_show name="gyaru" face="default" pos="center" time="1000"]

#gyaru
どう？見せて[l][er]

（スマホの画面を見せる。）[l][er]

#gyaru
……[l][er]

#protagonist
どうした[l][er]

#gyaru
……なんか、違う[l][er]

#protagonist
違う？[l][er]

#gyaru
もっと——いい感じにならない？[l][er]

#protagonist
十分いい感じだと思うけど[l][er]

#gyaru
違うの。もっと——[l][er]

（彼女は、言い淀んだ。）[l][er]

#gyaru
もっと、"映える"やつ[l][er]

#protagonist
……[l][er]

（何かが、おかしい。）[l][er]

（彼女は笑ってるけど、目が笑ってない。）[l][er]

[chara_hide name="gyaru" time="1000"]

; ================================================================================
*gyaru_01_scene_3
; シーン3：休憩
; ================================================================================

[bg storage="park.png" time="1000"]
[playbgm storage="bgm_sadness.mp3"]

（休憩。ベンチに座る。）[l][er]

[chara_show name="gyaru" face="sad" pos="center" time="1000"]

#gyaru
……ねえ[l][er]

#protagonist
ん？[l][er]

#gyaru
あたしさ、前は普通だったんだよね[l][er]

#protagonist
普通？[l][er]

#gyaru
可愛い系で売ってた[l][er]

#gyaru
でも、可愛い子なんていっぱいいるじゃん[l][er]

#protagonist
……[l][er]

#gyaru
埋もれるの。全然バズらない[l][er]

#gyaru
だから——[l][er]

（彼女は、自分の腕を見た。）[l][er]

#gyaru
これなら、唯一になれると思った[l][er]

#protagonist
……悪魔の薬で？[l][er]

#gyaru
うん[l][er]

（彼女は、笑った。）[l][er]

（でも、その笑顔が痛々しい。）[l][er]

#gyaru
バズった。10万いいね[l][er]

#gyaru
でも——[l][er]

#protagonist
でも？[l][er]

#gyaru
コメント、読んだ？[l][er]

#protagonist
いや[l][er]

#gyaru
"気持ち悪い""加工でしょ""病気？"[l][er]

#protagonist
……[l][er]

#gyaru
褒めてるコメントより、叩いてるコメントの方が多いの[l][er]

（彼女の声が、震えた。）[l][er]

[chara_hide name="gyaru" time="1000"]

; ================================================================================
*gyaru_01_scene_4
; シーン4：本音
; ================================================================================

[bg storage="park.png" time="1000"]
[playbgm storage="bgm_sadness.mp3"]

[chara_show name="gyaru" face="crying" pos="center" time="1000"]

#gyaru
……あたし、何してんだろ[l][er]

#protagonist
……[l][er]

#gyaru
注目されたかった[l][er]

#gyaru
見てもらいたかった[l][er]

#gyaru
でも——[l][er]

（涙が、こぼれた。）[l][er]

#gyaru
見てもらえても、嫌われたら意味ないじゃん[l][er]

#protagonist
……[l][er]

#gyaru
あたしのこと、好きって言ってくれる人——[l][er]

#gyaru
一人もいない[l][er]

（彼女は、泣いていた。）[l][er]

（SNSの女王は、こんなにも脆かった。）[l][er]

[chara_hide name="gyaru" time="1000"]

; ================================================================================
*gyaru_01_scene_5
; シーン5：選択
; ================================================================================

[bg storage="park.png" time="1000"]
[playbgm storage="bgm_sadness.mp3"]

[glink target="gyaru_01_choice_a" text="俺は好きだぞ"]
[glink target="gyaru_01_choice_b" text="SNS、やめたら？"]
[s]

*gyaru_01_choice_a
#protagonist
俺は好きだぞ[l][er]

[chara_show name="gyaru" face="surprised" pos="center" time="1000"]

#gyaru
……え[l][er]

#protagonist
お前のこと[l][er]

#gyaru
……何、急に[l][er]

#protagonist
急じゃない。前から思ってた[l][er]

#protagonist
明るくて、前向きで、ちょっとうるさいけど[l][er]

#gyaru
うるさいは余計[l][er]

#protagonist
でも、そういうとこ好きだ[l][er]

#gyaru
……[l][er]

（彼女の目が、潤む。）[l][er]

#gyaru
……ほんとに？[l][er]

#protagonist
ああ[l][er]

#gyaru
……ありがと[l][er]

（小さく、そう言った。）[l][er]

[chara_hide name="gyaru" time="1000"]
[jump target="gyaru_02"]

*gyaru_01_choice_b
#protagonist
SNS、やめたら？[l][er]

[chara_show name="gyaru" face="angry" pos="center" time="1000"]

#gyaru
……は？[l][er]

#protagonist
辛いなら、やめればいい[l][er]

#gyaru
……無理[l][er]

#protagonist
なんで[l][er]

#gyaru
だって——[l][er]

（彼女は、俯いた。）[l][er]

#gyaru
やめたら、あたし何もなくなる[l][er]

#protagonist
……[l][er]

#gyaru
フォロワー10万人いるのに[l][er]

#gyaru
リアルの友達——一人もいないんだよ[l][er]

#protagonist
……[l][er]

（俺は、何も言えなかった。）[l][er]

#gyaru
……ごめん。今日、帰る[l][er]

（彼女は、立ち上がった。）[l][er]

[chara_hide name="gyaru" time="1000"]
[jump target="gyaru_02"]

; ================================================================================
; ■ ギャルルート - 第3話「炎上」
; テーマ：ネット社会の闘 / 味方
; ================================================================================

*gyaru_02
[bg storage="classroom.png" time="1000"]
[playbgm storage="bgm_tension.mp3"]

（月曜日。教室。）[l][er]

（ギャルの席が、空いている。）[l][er]

#protagonist
（……来てないのか）[l][er]

（スマホを見る。）[l][er]

（SNSを開くと——）[l][er]

#protagonist
……！[l][er]

（炎上していた。）[l][er]

（ギャルの写真が、まとめサイトに転載されている。）[l][er]

（コメント欄は、誹謗中傷の嵐。）[l][er]

; ================================================================================
*gyaru_02_scene_2
; シーン2：探しに行く
; ================================================================================

[bg storage="rooftop.png" time="1000"]
[playbgm storage="bgm_tension.mp3"]

（俺は、彼女を探した。）[l][er]

（屋上。）[l][er]

（——いた。）[l][er]

[chara_show name="gyaru" face="crying" pos="center" time="1000"]

#gyaru
……来ないでよ[l][er]

#protagonist
来た[l][er]

#gyaru
見たんでしょ。炎上[l][er]

#protagonist
ああ[l][er]

#gyaru
笑った？[l][er]

#protagonist
笑わない[l][er]

#gyaru
……[l][er]

（彼女は、フェンスに寄りかかっていた。）[l][er]

（目が、真っ赤だった。）[l][er]

#gyaru
学校にもバレた[l][er]

#gyaru
親にも[l][er]

#protagonist
……[l][er]

#gyaru
"何考えてるの"って[l][er]

#gyaru
"恥ずかしい"って[l][er]

（声が、震える。）[l][er]

#gyaru
……あたし、恥ずかしいのかな[l][er]

#gyaru
認められたかっただけなのに[l][er]

[chara_hide name="gyaru" time="1000"]

; ================================================================================
*gyaru_02_scene_3
; シーン3：励まし
; ================================================================================

[bg storage="rooftop.png" time="1000"]
[playbgm storage="bgm_sadness.mp3"]

#protagonist
恥ずかしくない[l][er]

[chara_show name="gyaru" face="surprised" pos="center" time="1000"]

#gyaru
……え[l][er]

#protagonist
お前は、自分を見てほしかっただけだ[l][er]

#protagonist
それの何が悪い[l][er]

#gyaru
でも——[l][er]

#protagonist
ネットの奴らは、お前のことを知らない[l][er]

#protagonist
俺は知ってる[l][er]

#gyaru
……[l][er]

#protagonist
明るくて、ちょっとバカで[l][er]

#gyaru
バカは余計[l][er]

#protagonist
でも、一生懸命で[l][er]

#protagonist
そういうお前を、俺は知ってる[l][er]

#gyaru
……[l][er]

（彼女の目から、また涙がこぼれた。）[l][er]

#gyaru
……あんた、ほんと変[l][er]

#protagonist
よく言われる[l][er]

#gyaru
……ありがと[l][er]

[chara_hide name="gyaru" time="1000"]

; ================================================================================
*gyaru_02_scene_4
; シーン4：筋肉同好会の仲間
; ================================================================================

[bg storage="classroom.png" time="1000"]
[playbgm storage="bgm_daily.mp3"]

（放課後。部室。）[l][er]

（ギャルを連れてきた。）[l][er]

[chara_show name="seitokai" face="default" pos="left" time="1000"]

#seitokai
炎上の件、把握しています[l][er]

[chara_show name="gyaru" face="sad" pos="right" time="1000"]

#gyaru
……[l][er]

#seitokai
法的対処を検討しましょう[l][er]

#gyaru
え？[l][er]

#seitokai
誹謗中傷は、訴えられます[l][er]

[chara_show name="otaku" face="default" pos="left" time="1000"]

#otaku
まとめサイトの管理者、特定できそうです[l][er]

#gyaru
……なんで、そこまで[l][er]

#otaku
仲間ですから[l][er]

[chara_hide name="otaku" time="1000"]

[chara_show name="kakutogi" face="default" pos="left" time="1000"]

#kakutogi
ネットで叩いてる奴ら、直接会ったら絶対ビビるぞ[l][er]

#gyaru
……[l][er]

#kakutogi
お前は強いんだ。こんな筋肉、普通の奴にはない[l][er]

[chara_hide name="kakutogi" time="1000"]

#gyaru
……みんな[l][er]

（彼女の目が、潤む。）[l][er]

#gyaru
ありがと……[l][er]

[chara_hide name="seitokai" time="1000"]

; ================================================================================
*gyaru_02_scene_5
; シーン5：反撃
; ================================================================================

[bg storage="classroom.png" time="1000"]
[playbgm storage="bgm_tension.mp3"]

（数日後。）[l][er]

（生徒会長とオタクが動いた。）[l][er]

（まとめサイトは削除された。）[l][er]

（悪質なコメントを書いた人物には、警告が送られた。）[l][er]

[chara_show name="gyaru" face="smile" pos="center" time="1000"]

#gyaru
……すごい[l][er]

#protagonist
生徒会長とオタク、ガチだからな[l][er]

#gyaru
あたし、こんなに味方がいたんだ[l][er]

#protagonist
当たり前だろ[l][er]

（彼女は、笑った。）[l][er]

（今度は、本当の笑顔だった。）[l][er]

[chara_hide name="gyaru" time="1000"]
[jump target="gyaru_03"]

; ================================================================================
; ■ ギャルルート - 第4話「本当の自分」
; テーマ：SNSとの向き合い方 / 自己肯定
; ================================================================================

*gyaru_03
[bg storage="rooftop.png" time="1000"]
[playbgm storage="bgm_daily.mp3"]

（炎上騒動が収まって、数週間。）[l][er]

（ギャルは、SNSの更新を止めていた。）[l][er]

[chara_show name="gyaru" face="default" pos="center" time="1000"]

#gyaru
ねえ[l][er]

#protagonist
ん？[l][er]

#gyaru
あたし、考えたんだ[l][er]

#protagonist
何を[l][er]

#gyaru
SNSのこと[l][er]

#protagonist
……[l][er]

#gyaru
やめようかなって[l][er]

#protagonist
……本当に？[l][er]

#gyaru
うん[l][er]

（彼女は、空を見上げた。）[l][er]

#gyaru
フォロワー10万人いても、あたしを守ってくれたのは——[l][er]

#gyaru
ここにいる人たちだけだった[l][er]

#protagonist
……[l][er]

#gyaru
数字って、意味ないんだなって[l][er]

[chara_hide name="gyaru" time="1000"]

; ================================================================================
*gyaru_03_scene_2
; シーン2：新しい目標
; ================================================================================

[bg storage="rooftop.png" time="1000"]
[playbgm storage="bgm_romance.mp3"]

[chara_show name="gyaru" face="smile" pos="center" time="1000"]

#gyaru
でもさ[l][er]

#protagonist
ん？[l][er]

#gyaru
写真撮るのは好きなんだよね[l][er]

#protagonist
撮られるのが？[l][er]

#gyaru
撮るのも[l][er]

#protagonist
……知らなかった[l][er]

#gyaru
言ってなかったし[l][er]

#gyaru
あたし、いつも"撮られる側"だったから[l][er]

#protagonist
……[l][er]

#gyaru
でも、撮る側も楽しいかなって[l][er]

#gyaru
みんなの写真、撮りたい[l][er]

#protagonist
筋肉同好会の？[l][er]

#gyaru
うん[l][er]

（彼女は、カメラを構えるポーズをした。）[l][er]

#gyaru
筋肉美少女図鑑、作るの[l][er]

#protagonist
……それ、バズりそうだな[l][er]

#gyaru
あはは、でもバズらなくてもいい[l][er]

#gyaru
みんなが喜んでくれたら、それでいい[l][er]

（彼女は、変わり始めていた。）[l][er]

[chara_hide name="gyaru" time="1000"]

; ================================================================================
*gyaru_03_scene_3
; シーン3：撮影会
; ================================================================================

[bg storage="classroom.png" time="1000"]
[playbgm storage="bgm_daily.mp3"]

（部室。）[l][er]

（ギャルが、みんなの写真を撮っている。）[l][er]

[chara_show name="gyaru" face="smile" pos="center" time="1000"]

#gyaru
はい、そこ！いい感じ！[l][er]

[chara_show name="kakutogi" face="default" pos="right" time="1000"]

#kakutogi
こ、こうか？[l][er]

#gyaru
もっと自然に！力抜いて！[l][er]

#kakutogi
力を抜くと筋肉が——[l][er]

#gyaru
いいからいいから！[l][er]

[chara_hide name="kakutogi" time="1000"]

（みんなが笑っている。）[l][er]

（ギャルも、笑っている。）[l][er]

（前より、ずっと自然な笑顔で。）[l][er]

[chara_hide name="gyaru" time="1000"]
[jump target="gyaru_04"]

; ================================================================================
; ■ ギャルルート - 第5話「告白」
; テーマ：恋 / 本当の繋がり
; ================================================================================

*gyaru_04
[bg storage="park_night.png" time="1000"]
[playbgm storage="bgm_romance.mp3"]

（夜の公園。）[l][er]

（ギャルに呼び出された。）[l][er]

[chara_show name="gyaru" face="blush" pos="center" time="1000"]

#gyaru
……来てくれた[l][er]

#protagonist
呼んだのお前だろ[l][er]

#gyaru
うん[l][er]

（彼女は、俺の前に立った。）[l][er]

（いつもより、緊張している。）[l][er]

#gyaru
あのさ[l][er]

#protagonist
ん？[l][er]

#gyaru
あたし、ずっと考えてたんだ[l][er]

#protagonist
何を[l][er]

#gyaru
あんたのこと[l][er]

#protagonist
……[l][er]

#gyaru
炎上した時、一番最初に来てくれたじゃん[l][er]

#gyaru
みんなに嫌われても、味方でいてくれたじゃん[l][er]

#protagonist
当たり前だろ[l][er]

#gyaru
当たり前じゃないよ[l][er]

（彼女の目が、潤む。）[l][er]

#gyaru
あたし、フォロワー10万人いたけど[l][er]

#gyaru
炎上した時、誰も助けてくれなかった[l][er]

#gyaru
でも、あんたは——[l][er]

#protagonist
……[l][er]

#gyaru
あんただけは、来てくれた[l][er]

[chara_hide name="gyaru" time="1000"]

; ================================================================================
*gyaru_04_scene_2
; シーン2：告白
; ================================================================================

[bg storage="park_night.png" time="1000"]
[playbgm storage="bgm_romance.mp3"]

[chara_show name="gyaru" face="blush" pos="center" time="1000"]

#gyaru
だから——[l][er]

（彼女は、深呼吸した。）[l][er]

#gyaru
好き[l][er]

#protagonist
……[l][er]

#gyaru
あんたのこと、好き[l][er]

#gyaru
いいねとか、フォロワーとか、そんなのじゃなくて[l][er]

#gyaru
本当に、好き[l][er]

（彼女の顔が、真っ赤になっている。）[l][er]

#gyaru
……返事、聞かせて[l][er]

[chara_hide name="gyaru" time="1000"]

; ================================================================================
*gyaru_04_scene_3
; シーン3：選択
; ================================================================================

[bg storage="park_night.png" time="1000"]

[glink target="gyaru_ending_good" text="俺も好きだ"]
[glink target="gyaru_ending_normal" text="友達でいたい"]
[s]

; ================================================================================
; ■ ギャルルート - グッドエンディング「いいねより大切なもの」
; ================================================================================

*gyaru_ending_good
#protagonist
俺も好きだ[l][er]

[chara_show name="gyaru" face="surprised" pos="center" time="1000"]

#gyaru
……え[l][er]

#protagonist
お前のこと[l][er]

#gyaru
……ほんとに？[l][er]

#protagonist
ああ[l][er]

#protagonist
明るくて、バカで、ちょっとうるさくて[l][er]

#gyaru
褒めてるの？けなしてるの？[l][er]

#protagonist
褒めてる[l][er]

#protagonist
そういうお前が、好きだ[l][er]

#gyaru
……[l][er]

（彼女の目から、涙がこぼれた。）[l][er]

#gyaru
……嬉しい[l][er]

#protagonist
泣くなよ[l][er]

#gyaru
泣いてない……泣いてるけど……[l][er]

（彼女は、俺に抱きついた。）[l][er]

#gyaru
ありがと……[l][er]

#protagonist
……ああ[l][er]

[chara_hide name="gyaru" time="1000"]

; ================================================================================
*gyaru_ending_good_epilogue
; エピローグ
; ================================================================================

[bg storage="rooftop.png" time="1000"]
[playbgm storage="bgm_romance.mp3"]

（数ヶ月後。）[l][er]

（ギャルは、SNSを再開した。）[l][er]

（でも、前とは違う。）[l][er]

[chara_show name="gyaru" face="smile" pos="center" time="1000"]

#gyaru
見て見て、この写真！[l][er]

#protagonist
どれ[l][er]

#gyaru
筋肉同好会のみんな！[l][er]

（スマホの画面には、仲間たちの写真。）[l][er]

（みんな、笑っている。）[l][er]

#gyaru
いいねより、コメントが嬉しいの[l][er]

#protagonist
コメント？[l][er]

#gyaru
"楽しそう"とか"仲良さそう"とか[l][er]

#gyaru
数じゃなくて、言葉が嬉しい[l][er]

#protagonist
……変わったな[l][er]

#gyaru
うん[l][er]

（彼女は、俺を見た。）[l][er]

#gyaru
あんたのおかげ[l][er]

#protagonist
俺？[l][er]

#gyaru
あんたが、あたしを見てくれたから[l][er]

#gyaru
数字じゃなくて、あたしを[l][er]

#protagonist
……[l][er]

#gyaru
だから、あたしも変われた[l][er]

（彼女は、俺の手を握った。）[l][er]

#gyaru
これからも、見ててね[l][er]

#protagonist
ああ[l][er]

#protagonist
ずっと見てる[l][er]

[chara_hide name="gyaru" time="1000"]

[bg storage="black.png" time="1000"]

（——ギャル。本名、星野美咲。）[l][er]

（SNSの女王だった彼女は——）[l][er]

（本当の繋がりを見つけた。）[l][er]

（いいねより大切なもの。）[l][er]

（それは、隣にいてくれる人。）[l][er]

（END - 「いいねより大切なもの」）[l][er]

[s]

; ================================================================================
; ■ ギャルルート - ノーマルエンディング「最高の友達」
; ================================================================================

*gyaru_ending_normal
#protagonist
……ごめん[l][er]

[chara_show name="gyaru" face="sad" pos="center" time="1000"]

#gyaru
……[l][er]

#protagonist
お前のことは好きだ。でも——[l][er]

#gyaru
……友達として？[l][er]

#protagonist
……ああ[l][er]

#gyaru
……そっか[l][er]

（彼女は、俯いた。）[l][er]

（でも——顔を上げた時、笑っていた。）[l][er]

#gyaru
いいよ[l][er]

#protagonist
……[l][er]

#gyaru
友達でも、いい[l][er]

#gyaru
あたし、今まで本当の友達いなかったから[l][er]

#gyaru
あんたが最初の、本当の友達[l][er]

#protagonist
……[l][er]

#gyaru
それで、十分だよ[l][er]

（彼女は、手を差し出した。）[l][er]

#gyaru
これからも、よろしくね[l][er]

#protagonist
……ああ[l][er]

（俺は、その手を握った。）[l][er]

[chara_hide name="gyaru" time="1000"]

; ================================================================================
*gyaru_ending_normal_epilogue
; エピローグ
; ================================================================================

[bg storage="classroom.png" time="1000"]
[playbgm storage="bgm_daily.mp3"]

（数ヶ月後。）[l][er]

（ギャルは、筋肉同好会の専属カメラマンになった。）[l][er]

[chara_show name="gyaru" face="smile" pos="center" time="1000"]

#gyaru
はい、チーズ！[l][er]

（みんなの写真を撮っている。）[l][er]

（その姿は、前よりずっと生き生きしている。）[l][er]

#gyaru
ねえ、次はあんたの番！[l][er]

#protagonist
俺？[l][er]

#gyaru
当たり前じゃん！最高の友達の写真、撮らせてよ！[l][er]

#protagonist
……しょうがないな[l][er]

（俺は、カメラの前に立った。）[l][er]

#gyaru
いい顔してる[l][er]

#protagonist
……そうか？[l][er]

#gyaru
うん。あたしの自慢の友達[l][er]

（彼女は、シャッターを切った。）[l][er]

[chara_hide name="gyaru" time="1000"]

[bg storage="black.png" time="1000"]

（——ギャル。本名、星野美咲。）[l][er]

（SNSの女王だった彼女は——）[l][er]

（本当の友達を見つけた。）[l][er]

（フォロワー10万人より大切な、たった一人の友達。）[l][er]

（END - 「最高の友達」）[l][er]

[s]
