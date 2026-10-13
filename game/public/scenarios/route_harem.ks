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
……まだ、誰も選ばない？[l][er]

#protagonist
ああ[l][er]

#akuma
言ったよね。君が全員にいい顔をしてる間に、誰かが二本目に手を伸ばすかもしれない[l][er]

#protagonist
わかってる[l][er]

#protagonist
だから、全員に、話す[l][er]

#akuma
……何を[l][er]

#protagonist
お前のゲームのこと。二本目のこと。俺が負けたら、どうなるか。全部[l][er]

[chara_show name="akuma" face="smile" pos="center" time="500"]

#akuma
……へえ[l][er]

#akuma
いいよ。ルールに、"内緒にしろ"とは、書いてないしね[l][er]

#akuma
でも、知ったら、あの子たち、怒るよ？　自分の心が、賭けの景品だったって[l][er]

#protagonist
怒られるために、話すんだ[l][er]

[chara_hide name="akuma" time="1000"]

[chara_hide_all]
[bg storage="science_prep_room.webp" time="1000"]
[playbgm storage="bgm_tension.mp3"]

（翌日の放課後。理科準備室。）[l][er]
（全員が初めて集まった、あの部屋に、もう一度、七人を呼んだ。）[l][er]

[chara_show name="seitokai" face="default" pos="center" time="800"]

#seitokai
全員、揃いました。&f.main_nameさん、議題をどうぞ[l][er]

#protagonist
……悪魔のことで、まだ、話してないことがある[l][er]

（俺は、全部、話した。）[l][er]

（あの夜、悪魔が俺の部屋に来たこと。）[l][er]
（"これはゲームだ"と言われたこと。）[l][er]
（俺が、七人の誰かと"本物"になれたら、俺の勝ち。）[l][er]
（七人の誰かが、自分を捨てて"二本目"を飲んだら、悪魔の勝ち。）[l][er]
（二本目は、体をもっと変えて、心ごと作り変える。迷わない、揺れない、傷つかない心に。）[l][er]
（そして、悪魔が勝ったら、俺の感情が、まとめて食べられること。）[l][er]

（——話し終わったとき、部屋は、静かだった。）[l][er]

[chara_hide_all]
[chara_show name="gyaru" face="angry" pos="left" time="800"]
[chara_show name="furyo" face="angry" pos="right" time="800"]

#gyaru
……は？[l][er]

#gyaru
なにそれ。うちらの心、賭けの景品ってこと？[l][er]

#furyo
……勝手に賭けんな[l][er]

#protagonist
賭けたのは、俺じゃない。でも、俺が始めたことだ[l][er]

#protagonist
……ごめん。もっと早く、言うべきだった[l][er]

[chara_hide_all]
[chara_show name="otaku" face="default" pos="center" time="800"]

#otaku
……二本目の存在は、私は、少しだけ、聞いていました[l][er]

#otaku
"君なら、二本目にも興味あるでしょ"と、悪魔に[l][er]

#otaku
……正直に言うと、興味は、ありました[l][er]

[chara_hide_all]
[chara_show name="kakutogi" face="default" pos="left" time="800"]
[chara_show name="osananajimi" face="sad" pos="right" time="800"]

#kakutogi
……つまり、こういうことか[l][er]

#kakutogi
私たちの誰かが、一番弱った夜に、あいつが瓶を持ってくる[l][er]

#osananajimi
……で、飲んだら、もう泣かなくて済む、って言われるんだ[l][er]

#osananajimi
……それ、たぶん、あたし、飲んじゃう日、あると思う[l][er]

（結衣が、笑おうとして、失敗した。）[l][er]
（誰も、笑わなかった。全員、同じことを、思っていた。）[l][er]

[chara_hide_all]
[chara_show name="imouto" face="sad" pos="center" time="800"]

#imouto
……先輩は、どうしたいんですか[l][er]

#imouto
誰か一人を選べば、ゲームは終わるんですよね[l][er]

#protagonist
……選べない。今は、まだ[l][er]

#protagonist
誰か一人と向き合ってる間に、他の誰かが、一人で瓶を受け取るかもしれない[l][er]

#protagonist
それが、一番、怖い[l][er]

#protagonist
だから——頼みがある[l][er]

#protagonist
二本目が来たら、一人で受け取らないでくれ[l][er]

#protagonist
俺を呼んでくれ。俺じゃなくてもいい。ここにいる誰かを[l][er]

#protagonist
一人のときに、一番弱いときに、あいつは来る。だったら——一人にしない[l][er]

（長い、沈黙。）[l][er]

[chara_hide_all]
[chara_show name="seitokai" face="default" pos="center" time="800"]

#seitokai
……議事録に、書きます[l][er]

#seitokai
"二本目協定"。第一条。二本目を差し出された者は、その場で受け取らず、同好会員の誰かに連絡する[l][er]

#seitokai
第二条。連絡を受けた者は、時間と場所を問わず、駆けつける[l][er]

#seitokai
第三条——[l][er]

#seitokai
……第三条は、&f.main_nameさんへの罰則です[l][er]

#protagonist
……え[l][er]

#seitokai
"発起人は、一人で全部を背負わない"[l][er]

#seitokai
以上。賛成の方は[l][er]

（七本の、太い腕が、上がった。）[l][er]

[jump target="harem_02"]

; ================================================================================
; 第2話「夜の電話」
; ================================================================================
*harem_02
[chara_hide_all]
[bg storage="black.webp" time="1000"]
[playbgm storage="bgm_isolation.mp3"]

（それから、一ヶ月。）[l][er]

（悪魔は、来た。）[l][er]
（言った通り、一番弱った夜に。）[l][er]

[chara_hide_all]
[bg storage="park_night.webp" time="1000"]

[chara_show name="gyaru" face="crying" pos="left" time="800"]

（——最初は、美咲だった。）[l][er]
（アンチのコメントを読み続けた、午前二時。）[l][er]

#gyaru
……結衣ちゃん、ごめん、こんな時間に。今、猫が、いる[l][er]

[chara_show name="osananajimi" face="default" pos="right" time="800"]

#osananajimi
今行く！　パジャマだけど！　三分で行く！[l][er]

（結衣は、本当に、三分で着いた。）[l][er]
（二人で、ベンチに座って、朝まで喋った。）[l][er]
（悪魔は、瓶を持ったまま、つまらなそうに、帰っていった。）[l][er]

[chara_hide_all]
[bg storage="dojo_night.webp" time="1000"]

[chara_show name="kakutogi" face="angry" pos="left" time="800"]

（——次は、響だった。）[l][er]
（大会への出場停止が、正式に決まった夜。）[l][er]

#kakutogi
……九条。来てくれ。道場だ[l][er]

[chara_show name="furyo" face="default" pos="right" time="800"]

#furyo
……なんで、あたし[l][er]

#kakutogi
お前が一番、"殴りたいのに殴らない"のが、上手いからだ[l][er]

#furyo
……褒めてんの、それ[l][er]

（冴は、電車を乗り継いで、来た。）[l][er]
（二人で、一晩中、寸止めの組手をした。）[l][er]
（悪魔は、道場の隅で、あくびをしていた。）[l][er]

[chara_hide_all]
[bg storage="science_prep_room.webp" time="1000"]

[chara_show name="otaku" face="default" pos="left" time="800"]

（——理香は、自分から、凛に電話した。）[l][er]

#otaku
凛先輩。瓶を、渡されました。まだ、開けていません[l][er]

#otaku
……開けたいです。すごく[l][er]

[chara_show name="seitokai" face="default" pos="right" time="800"]

#seitokai
わかりました。では、その瓶を、"証拠品"として、生徒会で預かります[l][er]

#seitokai
保管庫の鍵は、私と、&f.main_nameさんと、二人の合意がないと開きません[l][er]

#otaku
……ずるいですね[l][er]

#seitokai
手続きです[l][er]

（瓶は、生徒会室の金庫に、しまわれた。）[l][er]
（悪魔は、金庫を、三回ノックして、帰っていった。）[l][er]

[chara_hide_all]
[bg storage="friend_house.webp" time="1000"]

[chara_show name="imouto" face="crying" pos="center" time="800"]

（——美羽は、俺に、電話してきた。）[l][er]
（友樹と、大喧嘩した夜。）[l][er]

#imouto
……先輩。来て、くれますか[l][er]

#imouto
……第二条、ですよね[l][er]

（行った。）[l][er]
（玄関を開けたのは、友樹だった。）[l][er]
（"美羽が、お前を呼んだって"。それだけ言って、俺を、中に入れてくれた。）[l][er]

（その夜、高橋家の台所で、三人で、クッキーを焼いた。）[l][er]
（悪魔は、窓の外で、焦げた匂いに顔をしかめていた。）[l][er]

[chara_hide_all]
[bg storage="street_evening.webp" time="1000"]

[chara_show name="osananajimi" face="sad" pos="left" time="800"]
[chara_show name="seitokai" face="sad" pos="right" time="800"]

（——結衣は、母親と喧嘩した夕方に、凛に電話した。）[l][er]
（凛は、生徒会の仕事でミスをした夜に、結衣に電話した。）[l][er]
（冴は、駅で絡まれた日に、美咲に電話した。）[l][er]

（電話は、毎晩、どこかで、鳴った。）[l][er]
（そのたびに、誰かが、走った。）[l][er]

（一ヶ月で、悪魔は、十一回、来た。）[l][er]
（瓶は、十一回とも、開けられなかった。）[l][er]

[jump target="harem_03"]

; ================================================================================
; 第3話「最後のセール」
; ================================================================================
*harem_03
[chara_hide_all]
[bg storage="gym.webp" time="1000"]
[playbgm storage="bgm_devil.mp3"]

（一ヶ月後の夜。体育館。）[l][er]

（同好会の練習が終わって、全員が、帰ろうとしたとき。）[l][er]
（体育館の照明が、一斉に、消えた。）[l][er]

[chara_show name="akuma" face="default" pos="center" time="1000"]

#akuma
……あのさあ[l][er]

#akuma
ずるくない？[l][er]

（暗い体育館の真ん中に、悪魔が、浮かんでいた。）[l][er]
（その周りに——小さな瓶が、七本。宙に、並んでいた。）[l][er]

#akuma
一ヶ月、十一回。全部、電話一本で、台無し[l][er]

#akuma
僕のゲームは、"一番弱った夜に、一人で選ばせる"ゲームなんだけど[l][er]

#akuma
一人にならないの、反則でしょ[l][er]

#protagonist
ルールに、"一人で受け取れ"とは、書いてないだろ[l][er]

#akuma
……君、性格悪くなったね[l][er]

[chara_show name="akuma" face="smile" pos="center" time="500"]

#akuma
いいよ。じゃあ、最後のセール[l][er]

#akuma
七本。全員分。今夜、ここで、全員の前で、配ってあげる[l][er]

#akuma
一人も弱ってない夜に、一人も一人じゃない場所で——それでも、誰か、手を伸ばすかどうか[l][er]

#akuma
一人でも飲んだら、僕の勝ち。誰も飲まなかったら——[l][er]

#akuma
……誰も飲まなかったら、どうしようかな。考えてなかった[l][er]

（瓶が、一本ずつ、七人の前に、降りていった。）[l][er]

[chara_hide_all]
[chara_show name="osananajimi" face="default" pos="left" time="800"]

#osananajimi
……いらない[l][er]

#osananajimi
あたし、まだ、お母さんと仲直りの途中だもん。泣かなくなったら、仲直りの意味、なくなる[l][er]

[chara_show name="seitokai" face="default" pos="right" time="800"]

#seitokai
不要です。議事録の第一条により、受け取りを拒否します[l][er]

#seitokai
……それに、揺れない私では、結衣さんに電話できません[l][er]

[chara_hide_all]
[chara_show name="gyaru" face="smile" pos="left" time="800"]

#gyaru
いらねー。てか、これ飲んだら、エゴサで泣いたときに、結衣ちゃんがパジャマで来てくれるの、なくなるじゃん[l][er]

#gyaru
あれ、普通に、一番うれしかったし[l][er]

[chara_show name="otaku" face="default" pos="right" time="800"]

#otaku
金庫の中の一本と合わせて、二本目のサンプルが、二本になりますね[l][er]

#otaku
……返却します。研究対象は、"飲まなかった人の、その後"に変更したので[l][er]

[chara_hide_all]
[chara_show name="kakutogi" face="default" pos="left" time="800"]

#kakutogi
いらん。悔しいのは、私のだ[l][er]

[chara_show name="furyo" face="default" pos="right" time="800"]

#furyo
……いらない[l][er]

#furyo
あたし、"近づかれない"のは、もう、やめたから[l][er]

[chara_hide_all]
[chara_show name="imouto" face="default" pos="center" time="800"]

#imouto
……いりません[l][er]

#imouto
泣き虫のまま、大人になるって、決めたので[l][er]

（七本の瓶が、宙に、浮いたまま、残った。）[l][er]

[chara_hide_all]
[chara_show name="akuma" face="default" pos="center" time="1000"]

#akuma
……[l][er]

#akuma
……君は？[l][er]

#protagonist
俺？[l][er]

#akuma
君にも、一本あげようか。特別に[l][er]

#akuma
飲めば、迷わない。七人の誰も選べなくても、何も痛くない[l][er]

#akuma
"誰も選ばない"の、一番楽なやり方だよ[l][er]

（悪魔の前足に、八本目の瓶が、ぶら下がっていた。）[l][er]

[glink target="harem_03_refuse" text="「いらない。迷うのは、俺の仕事だ」"]
[glink target="harem_03_accept" text="「……それで、誰も傷つかないなら」"]
[s]

*harem_03_refuse
#protagonist
いらない[l][er]

#protagonist
迷うのは、俺の仕事だ[l][er]

#protagonist
七人とも、今、迷いながら、断った。俺だけ楽になるわけには、いかない[l][er]

#protagonist
それに——第三条。"発起人は、一人で全部を背負わない"[l][er]

#protagonist
迷ったら、こいつらに電話する[l][er]

[chara_show name="akuma" face="smile" pos="center" time="500"]

#akuma
……っ、あはは[l][er]

#akuma
あはははは！[l][er]

（悪魔が、笑った。）[l][er]
（初めて見る、腹を抱えるみたいな、笑い方だった。）[l][er]

#akuma
八本、全部、返品。こんな負け方、したことない[l][er]

[jump target="harem_end"]

*harem_03_accept
#protagonist
……それで、誰も傷つかないなら[l][er]

[chara_hide_all]
[chara_show name="osananajimi" face="angry" pos="left" time="500"]
[chara_show name="kakutogi" face="angry" pos="right" time="500"]

#osananajimi
——ばか！[l][er]

（結衣の手が、俺の手首を、掴んだ。）[l][er]
（響の手が、悪魔の瓶を、はたき落とした。）[l][er]

#kakutogi
第三条違反だ[l][er]

#osananajimi
一人で背負うなって、凛先輩が書いたでしょ！[l][er]

[chara_hide_all]
[chara_show name="seitokai" face="angry" pos="center" time="500"]

#seitokai
……罰則を、追加します[l][er]

#seitokai
"発起人は、今後一年間、同好会の掃除当番を務める"[l][er]

#protagonist
……重いな[l][er]

#seitokai
軽いほうです[l][er]

（七人に、囲まれていた。）[l][er]
（全員、怒っていて——全員、泣きそうだった。）[l][er]

#protagonist
……ごめん。いらない。やっぱり、いらない[l][er]

[chara_show name="akuma" face="smile" pos="left" time="500"]

#akuma
……あーあ。今度は、仲間に止められちゃった[l][er]

#akuma
八本、全部、返品[l][er]

[jump target="harem_end"]

; ================================================================================
; SPECIAL END「八本の返品」
; ================================================================================
*harem_end
[chara_hide_all]
[chara_show name="akuma" face="default" pos="center" time="1000"]
[playbgm storage="bgm_sadness.mp3"]

#akuma
……ねえ。判定、どうしようか[l][er]

#akuma
誰も、二本目を飲まなかった。だから、僕の勝ちじゃない[l][er]

#akuma
でも、誰も、君と"本物"になってない。だから、君の勝ちでもない[l][er]

#akuma
……判定不能[l][er]

#akuma
七人分の、揺れてる心が、ずっと目の前にあるのに、一口も食べられない[l][er]

#akuma
最悪のゲームだよ。こんなの、初めてだ[l][er]

#protagonist
……悪かったな[l][er]

#akuma
ほんとにね[l][er]

（八本の瓶が、ぱらぱらと、悪魔の影の中に、吸い込まれていった。）[l][er]

#akuma
……でも、覚えておいて[l][er]

#akuma
ゲームが終わったわけじゃない。君はいつか、誰かを選ぶかもしれない。誰も選ばないかもしれない[l][er]

#akuma
そのとき、誰かが、一人きりの夜を過ごしたら——僕は、また来るよ[l][er]

#protagonist
……来ても、電話が鳴るだけだ[l][er]

[chara_show name="akuma" face="smile" pos="center" time="500"]

#akuma
……ふふ。そうだろうね[l][er]

#akuma
じゃあね。お腹を空かせたまま、たまに、見に来るよ[l][er]

[chara_hide name="akuma" time="1000"]

（体育館の照明が、一斉に、ついた。）[l][er]

[chara_hide_all]
[bg storage="gym.webp" time="1000"]
[playbgm storage="bgm_ending.mp3"]

（それから、半年。）[l][er]

[bg storage="events/harem_gym.webp" time="1500"]

（筋肉同好会は、今日も、体育館の隅で、活動している。）[l][er]

（結衣は、母親と、たまに喧嘩して、たまに仲直りしている。）[l][er]
（凛の議事録には、"二本目協定"のページが、今も残っている。）[l][er]
（美咲の配信には、ときどき、全員が映る。）[l][er]
（理香の研究テーマは、"飲まなかった人の、その後"。今も、データを集めている。）[l][er]
（響は、型の部門で、大会に出られるようになった。）[l][er]
（冴は、週に二回、電車を乗り継いで、来る。）[l][er]
（美羽のクッキーは、もう、一枚も、崩れない。）[l][er]

（俺は、まだ、誰も選んでいない。）[l][er]
（それが、正しいのかは、わからない。）[l][er]

（でも——夜中に、スマホが鳴ったら、走る。）[l][er]
（七人の誰かが鳴らしても。七人の誰かが、俺のために鳴らしても。）[l][er]

（誰も、一人きりの夜を、過ごさない。）[l][er]
（——それが、今の俺たちの、答えだ。）[l][er]

（SPECIAL END ——「八本の返品」）[l][er]
[s]
