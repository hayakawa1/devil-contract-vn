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

（夜。格闘技部の道場。）[l][er]

（"話がある。道場に来い"——響からの、LINEは、それだけだった。）[l][er]

[chara_show name="kakutogi" face="default" pos="center" time="1000"]

（響は、サンドバッグの前に、立っていた。）[l][er]
（打っては、いなかった。）[l][er]

#kakutogi
来たか[l][er]

#protagonist
どうした、こんな時間に[l][er]

#kakutogi
……今日、顧問に言われた[l][er]

#kakutogi
"当面、部員とのスパーリングは禁止"[l][er]

#kakutogi
それから、来月の県大会。連盟から、"健康上の理由が確認できるまで、出場を見合わせるように"と[l][er]

#protagonist
……[l][er]

#kakutogi
当然だ。私が今、誰かと組んだら、相手は、骨が折れる[l][er]

#kakutogi
昨日、確かめた。軽く投げたつもりで、マットが、裂けた[l][er]

（道場の隅に、テープで補修されたマットが、立てかけてあった。）[l][er]

[chara_show name="kakutogi" face="sad" pos="center" time="500"]

#kakutogi
笑えるだろう[l][er]

#kakutogi
"今、強い君"になれる、と言われて、飲んだ。お前の前で、もう二度と負けないために[l][er]

#kakutogi
……強くなった。誰にも負けない[l][er]

#kakutogi
代わりに、誰とも、戦えなくなった[l][er]

#protagonist
……[l][er]

#kakutogi
それで、頼みがある[l][er]

#kakutogi
ミットを、持ってくれ[l][er]

#protagonist
……俺が？[l][er]

#kakutogi
同好会の連中は、私と同じ体だ。加減がわからなくなる[l][er]

#kakutogi
普通の体のお前が持っていれば、私は、絶対に加減を忘れない[l][er]

#kakutogi
……お前を壊すのだけは、死んでも、嫌だからな[l][er]

[glink target="kakutogi_01_a" text="「わかった。持つ」"]
[glink target="kakutogi_01_b" text="「……怖いから、やめとく」"]
[s]

*kakutogi_01_a
[eval exp="f.kakutogi_mitt = true"]

#protagonist
わかった。持つ[l][er]

[chara_show name="kakutogi" face="surprised" pos="center" time="500"]

#kakutogi
……いいのか[l][er]

#protagonist
お前が加減するって言ったんだろ。信じる[l][er]

#kakutogi
……っ[l][er]

[chara_show name="kakutogi" face="default" pos="center" time="500"]

（ミットを、両手で構えた。）[l][er]

（響の拳が、来た。）[l][er]

（——ぱすん、と。）[l][er]
（間の抜けた音がした。）[l][er]
（ミットに、羽毛が当たったみたいだった。）[l][er]

#protagonist
……え[l][er]

#kakutogi
……加減した[l][er]

#protagonist
しすぎだろ[l][er]

#kakutogi
うるさい。初日だ[l][er]

（響は、二発目を打った。）[l][er]
（今度は、少しだけ、音がした。）[l][er]
（打つたびに、ほんの少しずつ、音が大きくなる。）[l][er]
（——加減を、一から、覚え直しているみたいだった。）[l][er]

[jump target="kakutogi_01_end"]

*kakutogi_01_b
#protagonist
……怖いから、やめとく[l][er]

[chara_show name="kakutogi" face="sad" pos="center" time="500"]

#kakutogi
……そうか[l][er]

#kakutogi
正しい。お前は、正しい[l][er]

#kakutogi
私でも、私が怖い[l][er]

（響は、ミットを、棚に戻した。）[l][er]
（それから、サンドバッグに向き直って——打たなかった。）[l][er]
（拳を、握ったまま、下ろした。）[l][er]

#kakutogi
……帰っていいぞ。呼び出して、悪かった[l][er]

#protagonist
……いや。見てる。ここで[l][er]

#kakutogi
……好きにしろ[l][er]

[jump target="kakutogi_01_end"]

*kakutogi_01_end
#悪魔の声
——努力を飛ばした体で、努力をやり直すの？[l][er]

（道場の窓の外で、何かが、笑った気がした。）[l][er]
（振り返ったときには、もう、何もいなかった。）[l][er]

[jump target="kakutogi_02"]

; ================================================================================
; 第2話「意味のない練習」
; ================================================================================
*kakutogi_02
[chara_hide_all]
[bg storage="dojo.webp" time="1000"]
[playbgm storage="bgm_sadness.mp3"]

（一週間後。早朝の道場。）[l][er]

[chara_show name="kakutogi" face="default" pos="center" time="1000"]

（響は、毎朝、六時から、走り込みと、筋トレをしている。）[l][er]
（変わる前から、ずっと、そうしてきたらしい。）[l][er]

#kakutogi
……百。……百一[l][er]

（腕立て伏せ。）[l][er]
（汗一つ、かいていない。）[l][er]

#kakutogi
……三百[l][er]

（彼女は、床に手をついたまま、止まった。）[l][er]

[chara_show name="kakutogi" face="crying" pos="center" time="500"]

#kakutogi
……疲れないんだ[l][er]

#protagonist
……[l][er]

#kakutogi
いくらやっても、疲れない。筋肉が、張らない。昨日より、強くならない[l][er]

#kakutogi
もう、ここが天井なんだ。悪魔に、天井まで、連れていかれた[l][er]

#kakutogi
三年かけて、一段ずつ、登るつもりだった階段を[l][er]

#kakutogi
……毎朝、六時に起きる理由が、なくなった[l][er]

#kakutogi
私は、ズルをした[l][er]

#kakutogi
ずっと、"努力しない強さ"を、軽蔑してきたのに[l][er]

#kakutogi
今の私は、軽蔑してきたものそのものだ[l][er]

（響が泣くのを、初めて見た。）[l][er]
（泣いても、声が、震えなかった。）[l][er]
（体が、強すぎて。）[l][er]

[if exp="f.kakutogi_mitt"]
#protagonist
……でも、加減は、覚え直してるだろ[l][er]

#protagonist
最初は羽毛だった。昨日は、ちゃんと、ミット越しに手が痺れた[l][er]

#protagonist
あれは、薬がくれたもんじゃない。お前が、毎晩、やり直したやつだ[l][er]

#kakutogi
……[l][er]

#kakutogi
……加減なんて、強さじゃない[l][er]

#protagonist
そうか？　お前、今、それが一番、難しいだろ[l][er]

#kakutogi
……[l][er]
[else]
#protagonist
……響[l][er]

#kakutogi
慰めは、いらない[l][er]

#kakutogi
……お前は、見てるって言った。それで、十分だ[l][er]
[endif]

[jump target="kakutogi_03"]

; ================================================================================
; 第3話「教えるということ」
; ================================================================================
*kakutogi_03
[chara_hide_all]
[bg storage="gym.webp" time="1000"]
[playbgm storage="bgm_daily.mp3"]

（放課後。同好会の活動日。）[l][er]

[chara_show name="osananajimi" face="surprised" pos="left" time="800"]
[chara_show name="imouto" face="flustered" pos="right" time="800"]

#osananajimi
響ちゃん、ごめん！　また、マット、破れちゃった……[l][er]

#imouto
私、ジャンプしただけなんです……着地しただけなんです……[l][er]

（同好会の連中は、まだ、自分の体の扱いに慣れていない。）[l][er]
（階段で手すりを曲げた、とか。ドアノブを取った、とか。毎日、誰かが何かを壊す。）[l][er]

[chara_show name="kakutogi" face="default" pos="center" time="800"]

#kakutogi
……着地の仕方が、悪い[l][er]

#kakutogi
膝を、伸ばしたまま落ちるな。足首、膝、股関節。三つで、受けろ[l][er]

#imouto
三つで……？[l][er]

#kakutogi
見てろ[l][er]

（響が、跳んだ。）[l][er]
（天井に届きそうな高さから——音もなく、降りた。）[l][er]
（マットが、かすかに、沈んだだけだった。）[l][er]

#osananajimi
……すご[l][er]

#imouto
猫みたい……[l][er]

#kakutogi
受け身だ。小学生のときから、毎日、千回やった[l][er]

（言ってから、響は、自分の足元を見た。）[l][er]

#kakutogi
……千回、やった[l][er]

（その日、響は、全員に、受け身と、力の逃がし方を教えた。）[l][er]
（帰る頃には、誰も、何も、壊さなくなっていた。）[l][er]

[chara_hide_all]
[bg storage="dojo.webp" time="1000"]
[playbgm storage="bgm_romance.mp3"]

（帰り道。夕方の道場の前。）[l][er]

[chara_show name="kakutogi" face="default" pos="center" time="1000"]

#kakutogi
……なあ[l][er]

#protagonist
ん[l][er]

#kakutogi
今日、気づいた[l][er]

#kakutogi
この体は、悪魔のものだ。力も、速さも、もらいものだ[l][er]

#kakutogi
でも、受け身は、私のだ[l][er]

#kakutogi
足の運びも。呼吸も。力を、逃がす場所も。全部、三年分、私が積んだやつだ[l][er]

#kakutogi
……それは、薬じゃ、上書きされてなかった[l][er]

#protagonist
……ああ[l][er]

[chara_show name="kakutogi" face="smile" pos="center" time="500"]

#kakutogi
大会、組手は出られない。でも、"型"の部門なら、相手がいない[l][er]

#kakutogi
型は、力じゃ、点が出ない。正確さと、積み重ねだけだ[l][er]

#kakutogi
……出る。連盟に、頼んでみる[l][er]

#kakutogi
"強い私"じゃなくて、"積んだ私"を、お前に見せたい[l][er]

[jump target="kakutogi_04"]

; ================================================================================
; 第4話「二本目」
; ================================================================================
*kakutogi_04
[chara_hide_all]
[bg storage="dojo_night.webp" time="1000"]
[playbgm storage="bgm_tension.mp3"]

（大会の、前の晩。）[l][er]

（夕方、響から、一行だけ、LINEが来た。）[l][er]
（"だめだった"）[l][er]

[chara_show name="kakutogi" face="angry" pos="right" time="1000"]

（道場の真ん中に、響が、正座していた。）[l][er]
（膝の上で、拳が、握られていた。）[l][er]

#kakutogi
……型の部門も、だめだそうだ[l][er]

#kakutogi
"他の選手への心理的影響"。"前例がない"[l][er]

#kakutogi
……前例がないのは、私のせいか？[l][er]

#protagonist
響[l][er]

#kakutogi
悔しい[l][er]

#kakutogi
悔しい。悔しい。悔しい[l][er]

#kakutogi
三年分、積んできたものを、見せる場所すら、ない[l][er]

[chara_show name="akuma" face="default" pos="left" time="1000"]
[playbgm storage="bgm_devil.mp3"]

#akuma
悔しいの、つらいよね[l][er]

#kakutogi
……お前[l][er]

#akuma
はい、これ[l][er]

（悪魔の前足に、小さな瓶。）[l][er]
（一本目と同じ形。中身の色だけが、少し、暗い。）[l][er]

#akuma
二本目。飲めば、もう、悔しくない[l][er]

#akuma
勝ちたいとも、負けたくないとも、思わない。誰とも、比べない[l][er]

#akuma
試合に出られなくても、平気。毎朝六時に起きる理由がなくても、平気[l][er]

#akuma
——"努力"なんて、最初から、要らなかったことになる[l][er]

#kakutogi
……[l][er]

#akuma
君、ずっと、"努力"と"今の強さ"の間で、引き裂かれてるでしょ[l][er]

#akuma
これで、楽になれるよ[l][er]

（悪魔は、瓶を、畳の上に置いた。）[l][er]

#akuma
飲むかどうかは、君次第[l][er]

（響は、瓶を、見下ろしていた。）[l][er]
（握っていた拳が、ゆっくり、開いていく。）[l][er]

#kakutogi
……悔しくなくなれば、もう、泣かなくて済む[l][er]

（——言わなきゃいけない。）[l][er]

[glink target="kakutogi_04_refuse" text="「悔しいままでいい。お前の型を、俺に見せろ」"]
[glink target="kakutogi_04_accept" text="「……お前が、楽になれるなら」"]
[s]

*kakutogi_04_refuse
#protagonist
悔しいままでいい[l][er]

[chara_show name="kakutogi" face="surprised" pos="right" time="500"]

#protagonist
悔しいのは、積んだからだろ[l][er]

#protagonist
三年分、毎朝六時に起きたから、見せる場所がないのが、悔しいんだろ[l][er]

#protagonist
それ飲んだら、その三年が、"要らなかった"ことになる。悪魔が、今そう言った[l][er]

#protagonist
大会がだめなら——ここで見せろ。俺に[l][er]

#protagonist
審判もいない。点数も出ない。でも、俺は、ちゃんと見る[l][er]

#kakutogi
……[l][er]

#kakutogi
……お前は、型のこと、何もわからないだろう[l][er]

#protagonist
わからない。だから、説明しながらやれ[l][er]

#kakutogi
……っ[l][er]

[chara_show name="kakutogi" face="crying" pos="right" time="500"]

#kakutogi
……バカか、お前は[l][er]

（響は、瓶を、指で弾いた。）[l][er]
（瓶は、畳の上を転がって、悪魔の足元で、止まった。）[l][er]

#kakutogi
返す[l][er]

#kakutogi
悔しいのは、私のだ。お前に、やるものか[l][er]

[chara_show name="akuma" face="smile" pos="left" time="500"]

#akuma
……ふうん。返品か[l][er]

#akuma
いいよ。ゲームは、まだ続いてるしね[l][er]

[chara_hide name="akuma" time="1000"]

（影は、消えた。）[l][er]

（響は、立ち上がった。）[l][er]
（袖で、顔を、乱暴に拭いた。）[l][er]

#kakutogi
……座れ。正座だ[l][er]

#protagonist
今やるのか[l][er]

#kakutogi
今だ。気が変わる前に[l][er]

[eval exp="f.kakutogi_refused = true"]
[jump target="kakutogi_05"]

*kakutogi_04_accept
#protagonist
……お前が、楽になれるなら[l][er]

（言った瞬間に、間違えた、とわかった。）[l][er]

[chara_show name="kakutogi" face="sad" pos="right" time="500"]

#kakutogi
……そうか[l][er]

#kakutogi
お前も、そう思うか。私の三年は、もう、どうでもいいと[l][er]

（違う、と言う前に。）[l][er]
（響は、試合の前にいつもそうするように、一礼して——）[l][er]
（瓶を、取った。）[l][er]

#protagonist
——待て！[l][er]

（遅かった。）[l][er]

[jump target="kakutogi_ending_bad"]

; ================================================================================
; 第5話「観客一人の演武」
; ================================================================================
*kakutogi_05
[chara_hide_all]
[bg storage="dojo_night.webp" time="1000"]
[playbgm storage="bgm_fight.mp3"]

（夜の道場。）[l][er]

（観客は、俺一人。）[l][er]

[chara_show name="kakutogi" face="default" pos="center" time="1000"]

#kakutogi
……型、"三十二手"。始める[l][er]

（響が、構えた。）[l][er]

#kakutogi
一手目。前足の、親指の付け根に、体重を乗せる。かかとは、紙一枚、浮かせる[l][er]

（説明しながら、動く。）[l][er]
（声と、体が、ぴったり重なっている。）[l][er]

#kakutogi
四手目。突きは、拳じゃなくて、背中で出す。小学四年のとき、師範に、千回、直された[l][er]

#kakutogi
十一手目。ここで、息を吐く。吐かないと、次の受けが、半拍、遅れる[l][er]

（あの体で、と思った。）[l][er]
（壁みたいな背中で。丸太みたいな腕で。）[l][er]
（——それでも、一つも、力任せの動きがない。）[l][er]
（全部、細い糸の上を歩くみたいに、正確だった。）[l][er]

#kakutogi
二十六手目。……ここは、まだ、師範に、一回も褒められたことがない[l][er]

（汗が、落ちた。）[l][er]
（腕立て三百回でも出なかった汗が、型の途中で、落ちた。）[l][er]

#kakutogi
……三十二手目。残心[l][er]

（響は、構えたまま、止まった。）[l][er]
（それから、ゆっくりと、礼をした。）[l][er]

（俺は、拍手した。）[l][er]
（一人ぶんの拍手が、道場に、響いた。）[l][er]

[chara_show name="kakutogi" face="smile" pos="center" time="500"]

#kakutogi
……どうだった[l][er]

#protagonist
わからない。型のことは[l][er]

#protagonist
でも、汗、かいてたぞ[l][er]

#kakutogi
……！[l][er]

#kakutogi
……ほんとだ[l][er]

（響は、自分の手のひらを見て、笑った。）[l][er]
（初めて、泣きそうじゃない顔で、笑った。）[l][er]

（——道場の入り口で、誰かが、咳払いをした。）[l][er]

#顧問
……いいもん見せてもらった[l][er]

#kakutogi
！　先生……[l][er]

#顧問
今の型、連盟の人間にも見せてやれ。動画、撮っといたから[l][er]

#顧問
"前例がない"なら、作るしかない。……三年分の型だったよ、虎谷[l][er]

[jump target="kakutogi_06"]

; ================================================================================
; 告白前夜：悪魔の味見
; ================================================================================
*kakutogi_06
[chara_hide_all]
[bg storage="rooftop_night.webp" time="1000"]
[playbgm storage="bgm_devil.mp3"]

（その夜。屋上。）[l][er]

[chara_show name="akuma" face="default" pos="center" time="1000"]

#akuma
やあ。今の君、どんな味？[l][er]

#protagonist
……拍手しすぎて、手が痛い味だよ[l][er]

#akuma
あはは。いいね[l][er]

#akuma
……ねえ。あの子の願いは、"努力を飛ばして、今、強くなる"だった[l][er]

#akuma
叶えたよ。でも、飛ばしたはずの努力が、型の中に、全部残ってた[l][er]

#akuma
僕の薬は、体は書き換えられても、三年分の"千回"は、消せないらしい[l][er]

#protagonist
……そりゃそうだろ[l][er]

[chara_show name="akuma" face="smile" pos="center" time="500"]

#akuma
で、あの子、明日、たぶん、君に勝負を挑んでくるよ[l][er]

#akuma
負けたら、どうするか——考えておいたら？[l][er]

[chara_hide name="akuma" time="1000"]

（影は、消えた。）[l][er]

[jump target="kakutogi_07"]

; ================================================================================
; 第6話「腕相撲」
; ================================================================================
*kakutogi_07
[chara_hide_all]
[bg storage="dojo.webp" time="1000"]
[playbgm storage="bgm_romance.mp3"]

（一週間後。夕方の道場。）[l][er]

（連盟から、返事が来た。"次の大会から、型の部門への出場を認める"。）[l][er]
（顧問の撮った動画が、何十人もの指導者に回ったらしい。）[l][er]

[chara_show name="kakutogi" face="default" pos="center" time="1000"]

#kakutogi
勝負しろ[l][er]

#protagonist
……は？[l][er]

#kakutogi
腕相撲だ[l][er]

#protagonist
勝てるわけないだろ[l][er]

#kakutogi
知ってる。私が勝つ。加減して、ぎりぎりで勝つ[l][er]

#kakutogi
それが、今の私の、一番難しい技だ[l][er]

（畳の上に、二人で、うつ伏せになった。）[l][er]
（手を、組んだ。）[l][er]
（俺の手のひらが、彼女の手の中に、すっぽり収まった。）[l][er]

#kakutogi
……行くぞ[l][er]

（——押してくる。）[l][er]
（押し返す。全力で。）[l][er]
（腕が、震える。俺の腕だけが。）[l][er]

（彼女の腕は、少しも震えずに、俺の全力と、ぴったり同じ力で、押してくる。）[l][er]
（一ミリずつ。一ミリずつ。）[l][er]

（三十秒かけて、俺の手の甲が、畳についた。）[l][er]

[chara_show name="kakutogi" face="blush" pos="center" time="500"]

#kakutogi
……勝った[l][er]

#protagonist
……知ってた[l][er]

#kakutogi
……なあ。最初に、お前の前で負けたとき[l][er]

#kakutogi
悔しかったのは、負けたからじゃない[l][er]

#kakutogi
お前に、"弱い私"を見られたと思ったからだ[l][er]

#kakutogi
でも、お前は、弱い私を見ても、強い私を見ても、同じ顔をする[l][er]

#kakutogi
……泣いてる私を見ても。汗をかいてる私を見ても[l][er]

（手は、まだ、組んだままだった。）[l][er]

#kakutogi
勝ったから、言う。私は、お前が好きだ[l][er]

#kakutogi
……負けたお前の返事を、聞かせろ[l][er]

[glink target="kakutogi_ending_good" text="手を握り返して「俺も好きだ。次は勝つ」"]
[glink target="kakutogi_ending_normal" text="「……お前は、最高の稽古相手だ」"]
[s]

; ================================================================================
; GOOD END「二人の強さ」
; ================================================================================
*kakutogi_ending_good
（組んだままの手を、握り返した。）[l][er]

#protagonist
俺も好きだ[l][er]

#protagonist
それと——次は、勝つ[l][er]

[chara_show name="kakutogi" face="surprised" pos="center" time="500"]

#kakutogi
……一生、無理だろう[l][er]

#protagonist
一生かけて、やる[l][er]

#kakutogi
……[l][er]

[chara_show name="kakutogi" face="smile" pos="center" time="500"]

#kakutogi
……一生、か[l][er]

#kakutogi
いいな。それは、毎朝六時に起きる理由になる[l][er]

[chara_hide_all]
[bg storage="rooftop_night.webp" time="1000"]
[playbgm storage="bgm_devil.mp3"]

[chara_show name="akuma" face="smile" pos="center" time="1000"]

#akuma
——はい、ゲーム終了。君の勝ち。……腕相撲は負けたけどね[l][er]

#akuma
約束どおり、ご祝儀を一口だけ[l][er]

（悪魔の前足が、胸に、ちょんと触れた。）[l][er]
（何かが、ひとかけら、持っていかれた。）[l][er]
（——たぶん、手の甲が畳についた瞬間の、悔しさの端っこ）[l][er]

#akuma
……うん。汗の味がする。いい稽古の味だ[l][er]

#akuma
じゃあね。もう、来ないよ[l][er]

[chara_hide name="akuma" time="1000"]

[chara_hide_all]
[bg storage="dojo.webp" time="1000"]
[playbgm storage="bgm_ending.mp3"]

（数ヶ月後。県大会、型の部門。）[l][er]

（響は、準優勝だった。）[l][er]
（二十六手目で、ほんの少しだけ、足がぶれたらしい。）[l][er]

[bg storage="events/kakutogi_handup.webp" time="1500"]

#kakutogi
……悔しい[l][er]

#protagonist
そうか[l][er]

#kakutogi
悔しい。すごく、悔しい[l][er]

#kakutogi
——だから、明日も、六時に起きる[l][er]

（夕方の道場。今日も、腕相撲に負けた俺に、響が手を差し出す。）[l][er]
（その手を取って、立ち上がる。）[l][er]

（虎谷響。）[l][er]
（努力を飛ばした女の子は、）[l][er]
（今、もう一度、一段ずつ、階段を登っている。）[l][er]
（——俺と、手をつないで。）[l][er]

（GOOD END ——「二人の強さ」）[l][er]
[s]

; ================================================================================
; NORMAL END「最高の稽古相手」
; ================================================================================
*kakutogi_ending_normal
#protagonist
……お前は、最高の稽古相手だ[l][er]

[chara_show name="kakutogi" face="default" pos="center" time="500"]

#kakutogi
……稽古相手[l][er]

#kakutogi
……そうか[l][er]

（響は、組んでいた手を、ゆっくり、離した。）[l][er]

[chara_show name="kakutogi" face="smile" pos="center" time="500"]

#kakutogi
いい。今は、それでいい[l][er]

#kakutogi
腕相撲と同じだ。一回で勝てないなら、毎日やる[l][er]

#kakutogi
……いつか、"稽古相手"以外の言葉で、負けさせてやる[l][er]

[chara_hide_all]
[bg storage="rooftop_night.webp" time="1000"]
[playbgm storage="bgm_devil.mp3"]

[chara_show name="akuma" face="default" pos="center" time="1000"]

#akuma
……保留、か[l][er]

#akuma
二本目は飲まなかった。でも、"本物"にも、ならなかった[l][er]

#akuma
僕はお腹が空いたまま。……まあ、あの子、粘り強いからね。待つよ[l][er]

[chara_hide name="akuma" time="1000"]

[chara_hide_all]
[bg storage="dojo.webp" time="1000"]
[playbgm storage="bgm_daily.mp3"]

（数ヶ月後。）[l][er]

（俺は、毎朝六時に、道場でミットを持っている。）[l][er]
（響の拳は、もう、羽毛じゃない。でも、俺の手は、一度も、痺れすぎたことがない。）[l][er]

[chara_show name="kakutogi" face="smile" pos="center" time="1000"]

#kakutogi
よし。今日の稽古は、ここまで[l][er]

#kakutogi
……明日も、来るか[l][er]

#protagonist
来る[l][er]

#kakutogi
……そうか[l][er]

（毎朝、同じ会話。）[l][er]
（それでも、響は、毎朝、少しだけ嬉しそうに、礼をする。）[l][er]

（NORMAL END ——「最高の稽古相手」）[l][er]
[s]

; ================================================================================
; BAD END「天井の上」
; ================================================================================
*kakutogi_ending_bad
[playbgm storage="bgm_despair.mp3"]

（彼女は、一息に、飲んだ。）[l][er]

[chara_hide_all]
[bg storage="devil_space.webp" time="1500"]

（世界から、音が消えた。）[l][er]

（道着の袖が、裂けた。）[l][er]
（肩が、背中が、天井を押し上げるみたいに、もう一段、ふくれあがる。）[l][er]

[status stage="stage2"]
[chara_show name="kakutogi" face="default" pos="center" time="2000"]

（——そして、それよりも、先に。）[l][er]
（握っていた拳から、力が、ふっと抜けた。）[l][er]

#kakutogi
……ああ[l][er]

#kakutogi
悔しくない[l][er]

#kakutogi
大会に出られなくても、何とも思わない。……変だな。あんなに、悔しかったのに[l][er]

#protagonist
響……！[l][er]

#kakutogi
帰っていいぞ。もう、ミットも、要らない[l][er]

#kakutogi
練習する理由が、ないからな[l][er]

[chara_show name="akuma" face="smile" pos="left" time="1000"]

#akuma
——はい、ゲーム終了[l][er]

#akuma
じゃ、約束どおり。——頂きます[l][er]

（悪魔の前足が、俺の胸に、触れた。）[l][er]
（熱が、引いていく。）[l][er]
（悔しさが。怖さが。ミット越しに、手が痺れた夜の記憶が。）[l][er]
（順番に、消えて——）[l][er]

[chara_hide_all]
[bg storage="black.webp" time="2000"]

（……。）[l][er]

[bg storage="dojo.webp" time="1500"]
[playbgm storage="bgm_isolation.mp3"]

（数ヶ月後。）[l][er]

（響は、格闘技部を、辞めた。）[l][er]
（朝六時の道場には、もう、誰も来ない。）[l][er]

（廊下ですれ違うと、彼女は、穏やかに会釈をする。）[l][er]
（俺も、会釈を返す。）[l][er]

（あの子が、昔、毎朝千回、何かをしていた気がする。）[l][er]
（何だったかは、もう、思い出せない。）[l][er]

（BAD END ——「天井の上」）[l][er]
[s]
