; route: ギャル
*start
[jump target="gyaru_00"]

; source: 第1話_10万いいね.txt
*gyaru_00
; ■ ギャルルート - 第1話「10万いいね」

SNS依存度：+3（バズへの執着）
孤立度：0

; ================================================================================
*gyaru_00_scene_1
; シーン1：昼休み／屋上（バズったSNS）
; ================================================================================

[bg storage="rooftop.png"]
[playbgm storage="bgm_daily.mp3"]

（昼休み。屋上。）

（ギャルが、俺を呼び出した。）

[chara_show name="gyaru" face="stage1" pos="center"]

#gyaru
見てこれ

（スマホを突きつけられた。）

（画面には、彼女の写真。）

（——ムキムキの、ポージング写真。）


#protagonist
お前、これ——

#gyaru
バズった

#protagonist
は？

#gyaru
10万いいね。まじウケる

（笑ってる。）

（いつもみたいに、笑ってる。）

（でも——）

#gyaru
"加工じゃないの？"とか"どこのジム？"とか、めっちゃリプきてる


#protagonist
……

（通知が、止まらない。）

（画面が、延々とリプライで埋まっている。）

[chara_hide pos="center"]

; ================================================================================
*gyaru_00_scene_2
; シーン2：屋上（承認への執着）
; ================================================================================

[bg storage="rooftop.png"]
[playbgm storage="bgm_isolation.mp3"]

#gyaru
あたしさ、前から思ってたんだよね。バズりたいって

（彼女は、空を見上げた。）

#gyaru
可愛い子なんていっぱいいるじゃん。あたしより可愛い子、いくらでも

#protagonist
……

#gyaru
でもこれはさ、あたしだけじゃん。唯一じゃん

（彼女の目が、キラキラしている。）

（でも——）

（それは、嬉しさじゃない。）

（何かに、憑かれているような目。）

#protagonist
お前——

#gyaru
だから続ける。もっとバズる

#protagonist
待て。それ、バレるぞ。学校に

#gyaru
バレたら何？

#protagonist
何って——

#gyaru
誰も関係ないじゃん。あたしの体でしょ

（彼女は、スマホをしまった。）

[chara_hide pos="center"]

; ================================================================================
*gyaru_00_scene_3
; シーン3：写真撮影の依頼
; ================================================================================

[bg storage="rooftop.png"]
[playbgm storage="bgm_romance.mp3"]

#gyaru
ね、今度写真撮ってよ。一人じゃ限界あるし

#protagonist
俺が？

#gyaru
他に誰がいんの

（じっと見てくる。）

#gyaru
……あんたに撮ってほしいの。だめ？

（その目だけは——）

（笑ってなかった。）

#protagonist
……


[glink target="gyaru_00_choice_a" text="わかった、撮ってやる"]
[glink target="gyaru_00_choice_b" text="やめとけ。危ないぞ"]
[s]
[chara_hide pos="center"]

; ================================================================================
*gyaru_00_scene_4a
; シーン4A：承諾後（距離が縮まる）
; ================================================================================

[bg storage="rooftop.png"]
[playbgm storage="bgm_romance.mp3"]

#gyaru
……ありがと

（小さく、そう言った。）

#protagonist
何が

#gyaru
あんたが撮ってくれるなら——

（彼女は、少し笑った。）

#gyaru
なんか、安心

#protagonist
……

#gyaru
変だよね。SNSに載せるのに

#protagonist
……変だな

#gyaru
でしょ

（彼女は、スマホを見た。）

（通知が、まだ増え続けている。）

#gyaru
……あたし、どこまで行けるかな

#protagonist
……

（俺は、嫌な予感がした。）

[jump target="gyaru_00_scene_5"]

[chara_hide pos="center"]

; ================================================================================
*gyaru_00_scene_4b
; シーン4B：拒絶後（孤立が深まる）
; ================================================================================

[bg storage="rooftop.png"]
[playbgm storage="bgm_isolation.mp3"]

（ギャルは、一人で階段を降りていった。）

#protagonist
（……まずかったか）

（でも、あれは危ない。）

（炎上するかもしれない。）

（身バレするかもしれない。）

#protagonist
（……）

（彼女の背中が、小さく見えた。）

[jump target="gyaru_00_scene_5"]

[chara_hide pos="center"]

; ================================================================================
*gyaru_00_scene_5
; シーン5：悪魔の囁き
; ================================================================================

[bg storage="rooftop.png"]
[playbgm storage="bgm_tension.mp3"]

（放課後。）

（屋上に、あいつがいた。）

[chara_show name="akuma" face="neutral_smile" pos="center"]

#akuma
面白いね、彼女

#protagonist
……

#akuma
10万いいね。すごいじゃない

#protagonist
お前、何を——

#akuma
何もしてないよ

（悪魔は、笑った。）

#akuma
ただ——

#akuma
筋肉は、バズる

#akuma
見てもらえる。注目される

#akuma
でも——

（悪魔の目が、冷たくなる。）

#akuma
見られすぎると、どうなるか

#protagonist
……

#akuma
楽しみだね


（影が、消えた。）


; ================================================================================

*gyaru_00_choice_a
#protagonist
わかった。撮ってやる

#gyaru
ほんと？

（彼女の顔が、明るくなる。）

#gyaru
やった！ じゃあ今度の日曜——

#protagonist
でも、条件がある

#gyaru
……なに

#protagonist
俺が見て、ダメだと思ったら投稿するな

#gyaru
……

（彼女は、少し考えた。）

#gyaru
……わかった




[jump target="gyaru_00_scene_4a"]

*gyaru_00_choice_b
#protagonist
やめとけ。SNSは危ない

#gyaru
……

（彼女の目が、冷たくなる。）

#gyaru
あっそ

#protagonist
おい——

#gyaru
わかった。自分で撮るし

（彼女は、背を向けた。）

#gyaru
もういい




[jump target="gyaru_00_scene_4b"]
