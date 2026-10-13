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

（日曜日。昼。近所の公園。）[l][er]

（友樹に、呼び出された。）[l][er]
（中学からの親友。高校は別々になったけど、今でも、月に何回かは会う。）[l][er]

#友樹
悪いな、急に[l][er]

#protagonist
いいよ。どうした[l][er]

#友樹
……美羽のことなんだけど[l][er]

（心臓が、一回、変な打ち方をした。）[l][er]

#友樹
あいつ、この一週間、俺と目を合わせないんだ[l][er]

#友樹
家の中でも、ずっと、俺のでかいパーカー着てる。フード被って[l][er]

#友樹
飯も、自分の部屋で食う。風呂も、俺が寝てから入る[l][er]

#友樹
母さんは"思春期でしょ"って言うけどさ。……思春期で、ドアノブ壊すか？[l][er]

#protagonist
……ドアノブ[l][er]

#友樹
握ったら、取れたんだって。根元から[l][er]

#友樹
お前、美羽と同じ学校だろ。何か、知らないか[l][er]

#友樹
……いじめられてるとか、そういうのじゃ、ないよな？[l][er]

（美羽からのLINEを、思い出した。）[l][er]
（"先輩、お兄ちゃんには、まだ言わないでください。おねがいします"。）[l][er]

[glink target="imouto_01_a" text="「……美羽ちゃんに、直接聞いてやってくれ」"]
[glink target="imouto_01_b" text="「……いや、知らない」"]
[s]

*imouto_01_a
#protagonist
……美羽ちゃんに、直接聞いてやってくれ[l][er]

#protagonist
俺から言うことじゃない。でも、いじめじゃない。それは、約束する[l][er]

#友樹
……知ってるんだな[l][er]

#protagonist
……ああ[l][er]

#友樹
……わかった[l][er]

#友樹
お前がそう言うなら、待つ。あいつが自分で言うまで[l][er]

#友樹
……でも、もし、あいつが泣くようなことだったら、お前にも、怒るからな[l][er]

#protagonist
……わかってる[l][er]

[jump target="imouto_01_end"]

*imouto_01_b
[eval exp="f.imouto_lie = true"]

#protagonist
……いや、知らない[l][er]

#友樹
……そっか[l][er]

#友樹
悪い。変なこと聞いた。お前なら、何か知ってるかと思ったんだけど[l][er]

（友樹は、笑った。）[l][er]
（俺を、少しも、疑っていない顔だった。）[l][er]
（——その顔が、一番、きつかった。）[l][er]

[jump target="imouto_01_end"]

*imouto_01_end
[chara_hide_all]
[bg storage="street_evening.webp" time="1000"]
[playbgm storage="bgm_sadness.mp3"]

（帰り道。高橋家の近く。）[l][er]

[chara_show name="imouto" face="surprised" pos="center" time="1000"]

（——角を曲がったところで、大きなパーカーと、ぶつかりかけた。）[l][er]

#imouto
わっ……せ、先輩[l][er]

（フードの下から、美羽の顔が、のぞいた。）[l][er]
（パーカーの袖が、二の腕で、ぱんぱんに張っている。）[l][er]
（友樹のパーカーなのに。友樹より、もう、肩幅が広い。）[l][er]

#imouto
……お兄ちゃんと、会ってました？[l][er]

#protagonist
……ああ[l][er]

[if exp="f.imouto_lie"]
#protagonist
何も、言ってない。"知らない"って言った[l][er]

[chara_show name="imouto" face="sad" pos="center" time="500"]

#imouto
……ありがとうございます[l][er]

#imouto
……でも、先輩に、嘘つかせちゃった[l][er]

#imouto
お兄ちゃんの、一番の友達なのに[l][er]
[else]
#protagonist
何も、言ってない。"美羽ちゃんに直接聞け"って言った[l][er]

[chara_show name="imouto" face="sad" pos="center" time="500"]

#imouto
……そう、ですよね。先輩は、そう言いますよね[l][er]

#imouto
……わかってます。いつまでも、隠せないって[l][er]
[endif]

#imouto
あと、先輩[l][er]

#imouto
"美羽ちゃん"、やめてもらえませんか[l][er]

#protagonist
……え[l][er]

#imouto
ちゃん付けされると、小学生のときに戻っちゃう気がするんです[l][er]

#imouto
……せっかく、こんな体になったのに[l][er]

[jump target="imouto_02"]

; ================================================================================
; 第2話「潰れたクッキー」
; ================================================================================
*imouto_02
[chara_hide_all]
[bg storage="science_room.webp" time="1000"]
[playbgm storage="bgm_daily.mp3"]

（数日後。放課後の、家庭科室——が、空いていなかったので、理香に頼んで借りた理科室。）[l][er]

[chara_show name="imouto" face="flustered" pos="center" time="1000"]

#imouto
……また、割れた[l][er]

（美羽の手の中で、卵が、殻ごと、潰れていた。）[l][er]
（これで、四個目だった。）[l][er]

#imouto
前は、片手で割れたんです。お兄ちゃんに、自慢してたくらい[l][er]

#imouto
クッキー、焼くの、好きだったから[l][er]

#protagonist
……だった？[l][er]

#imouto
……子供っぽいって、思ってたんです。ずっと[l][er]

#imouto
"美羽はお菓子作りが好きなんだよな"って、お兄ちゃんが、先輩に言うたびに[l][er]

#imouto
ああ、私、まだ"お菓子作ってる小さい子"なんだ、って[l][er]

#imouto
だから、この体になったら、やめようと思ってて[l][er]

#imouto
……なのに、気づいたら、また、材料、買ってた[l][er]

（五個目の卵。）[l][er]
（今度は、指先だけで、そっと、ボウルの縁に当てた。）[l][er]
（ひびが入った。殻が、二つに割れた。）[l][er]

[chara_show name="imouto" face="smile" pos="center" time="500"]

#imouto
……割れた！　先輩、割れました！[l][er]

#protagonist
ああ。見てた[l][er]

（美羽は、子どもみたいに、跳ねた。）[l][er]
（床が、少しだけ、鳴った。）[l][er]

#imouto
……あ[l][er]

[chara_show name="imouto" face="sad" pos="center" time="500"]

#imouto
……今の、子供っぽかったですね[l][er]

#protagonist
……別に、いいだろ[l][er]

#imouto
よくないです。私、"妹"も"子供"も、置いていくって決めたんです[l][er]

#imouto
……先輩の前では、特に[l][er]

（その日、焼き上がったクッキーは、半分くらい、形が崩れていた。）[l][er]
（美羽は、崩れたほうを、全部、自分で食べた。）[l][er]

[jump target="imouto_03"]

; ================================================================================
; 第3話「兄」
; ================================================================================
*imouto_03
[chara_hide_all]
[bg storage="friend_house.webp" time="1000"]
[playbgm storage="bgm_tension.mp3"]

（その週の土曜日。高橋家。）[l][er]

（"クッキー、余ったから、取りに来てください"——美羽に呼ばれて、玄関に入った。）[l][er]
（台所から、声が聞こえた。）[l][er]

#友樹
——美羽、お前……[l][er]

（台所の入り口で、友樹が、固まっていた。）[l][er]

[chara_show name="imouto" face="surprised" pos="center" time="1000"]

（美羽が、パーカーを脱いで、オーブンの前に立っていた。）[l][er]
（暑かったのだろう。半袖のTシャツ一枚で。）[l][er]
（その腕を、肩を、背中を——友樹が、見ていた。）[l][er]

#imouto
……お、お兄ちゃん。今日、部活じゃ……[l][er]

#友樹
……休みになった。それより[l][er]

#友樹
何だよ、それ[l][er]

#imouto
……[l][er]

#友樹
病気か？　病院、行ったのか？　なあ[l][er]

（友樹が、振り返った。俺に、気づいた。）[l][er]

[if exp="f.imouto_lie"]
#友樹
……お前、"知らない"って、言ったよな[l][er]

#protagonist
……[l][er]

#友樹
知ってたんだな。全部[l][er]

#友樹
……俺が、どんだけ心配してたか、知ってて、"知らない"って言ったんだな[l][er]
[else]
#友樹
……お前が、"直接聞け"って言ったの、これか[l][er]

#友樹
……なんで、こんなことになってんだよ[l][er]
[endif]

#protagonist
……俺のせいだ[l][er]

#友樹
……は？[l][er]

#protagonist
説明は、うまくできない。でも、俺が原因だ。美羽は、悪くない[l][er]

（友樹の拳が、握られた。）[l][er]
（殴られる、と思った。）[l][er]

#imouto
——やめて！[l][er]

（美羽が、俺と友樹の間に、入った。）[l][er]
（友樹の拳は、美羽の肩に当たって、止まった。）[l][er]
（当たっただけで、止まった。美羽は、少しも、揺れなかった。）[l][er]

#友樹
……っ[l][er]

#imouto
先輩のせいじゃない。私が、自分で飲んだの[l][er]

#imouto
"妹"でいるのが、嫌だったから[l][er]

#友樹
……妹でいるのが、嫌？[l][er]

#imouto
お兄ちゃんは、私が何歳になっても、"小さい美羽"としか見ない[l][er]

#imouto
先輩も、お兄ちゃんの"妹"としか見ない[l][er]

#imouto
……だから、別人になりたかったの[l][er]

#友樹
……[l][er]

#友樹
……戻れ[l][er]

#imouto
……え[l][er]

#友樹
戻れよ。前の美羽に。……戻れるんだろ、なあ[l][er]

#imouto
……戻れないよ[l][er]

#友樹
……[l][er]

（友樹の顔が、くしゃっと、歪んだ。）[l][er]
（怒っている顔じゃなかった。）[l][er]
（小さい頃、美羽が転んで泣いたときと、同じ顔だった。）[l][er]

[chara_show name="imouto" face="crying" pos="center" time="500"]

#imouto
……お兄ちゃんの、ばか[l][er]

（美羽は、パーカーも持たずに、玄関を飛び出していった。）[l][er]

[jump target="imouto_04"]

; ================================================================================
; 第4話「二本目」
; ================================================================================
*imouto_04
[chara_hide_all]
[bg storage="park_night.webp" time="1000"]
[playbgm storage="bgm_isolation.mp3"]

（日が沈んでから、見つけた。）[l][er]

（日曜日に、友樹と話した公園。）[l][er]
（ジャングルジムの、一番上に、美羽が座っていた。）[l][er]

[chara_show name="imouto" face="crying" pos="right" time="1000"]

#imouto
……先輩[l][er]

#imouto
ここ、小さいとき、一番上まで登れなくて、いつも、お兄ちゃんに抱っこしてもらってたんです[l][er]

#imouto
今は、一歩で、登れちゃった[l][er]

#imouto
……ジャングルジム、ちょっと、曲がっちゃいました[l][er]

[chara_show name="akuma" face="default" pos="left" time="1000"]
[playbgm storage="bgm_devil.mp3"]

#akuma
小さかった頃の場所って、大きくなってから行くと、狭いよね[l][er]

#imouto
……あ[l][er]

#akuma
ねえ。お兄ちゃんに、"戻れ"って言われて、どうだった？[l][er]

#akuma
悲しかった？　それとも——"やっぱり子供扱いだ"って、悔しかった？[l][er]

#imouto
……両方[l][er]

#akuma
だよね。だから、これ[l][er]

（悪魔の前足に、小さな瓶。）[l][er]
（一本目と同じ形。中身の色だけが、少し、暗い。）[l][er]

#akuma
二本目。飲めば、もう泣かない。甘えない。お兄ちゃんに何を言われても、平気[l][er]

#akuma
誰の妹でもない、ちゃんとした大人の女の人になれる[l][er]

#akuma
もう、誰にも、"子供"なんて言わせないよ[l][er]

#imouto
……[l][er]

（美羽の目が、瓶を見ていた。）[l][er]
（涙で濡れた目で。）[l][er]

#imouto
……泣かなくなったら、先輩も、私のこと、大人だって思ってくれますか[l][er]

#akuma
思うんじゃない？　泣かない子を、子供扱いする人はいないよ[l][er]

（悪魔は、瓶を、ジャングルジムの棒の上に、そっと置いた。）[l][er]

#akuma
飲むかどうかは、君次第[l][er]

（美羽の手が、動いた。）[l][er]

[glink target="imouto_04_refuse" text="「泣かないのは、大人じゃない。……降りてこい、美羽」"]
[glink target="imouto_04_accept" text="「……美羽ちゃんが、決めていい」"]
[s]

*imouto_04_refuse
#protagonist
泣かないのは、大人じゃない[l][er]

[chara_show name="imouto" face="surprised" pos="right" time="500"]

#protagonist
今日、お前、俺と友樹の間に入っただろ[l][er]

#protagonist
殴られるの、わかってて。……あれは、子供にはできない[l][er]

#protagonist
泣いたって、それは変わらない。泣きながら、間に入ったんだ。お前は[l][er]

#protagonist
……降りてこい、美羽[l][er]

#imouto
……[l][er]

#imouto
……今、"ちゃん"って、言わなかった[l][er]

#protagonist
言わないって、約束しただろ[l][er]

[chara_show name="imouto" face="crying" pos="right" time="500"]

#imouto
……っ[l][er]

（美羽は、瓶を、棒の上から、指で、はじき落とした。）[l][er]
（瓶は、砂場に落ちて、音もなく、埋まった。）[l][er]

#imouto
いらない[l][er]

#imouto
泣き虫のままで、いい。泣きながら、大人になる[l][er]

[chara_show name="akuma" face="smile" pos="left" time="500"]

#akuma
……ふうん。返品か[l][er]

#akuma
いいよ。ゲームは、まだ続いてるしね[l][er]

[chara_hide name="akuma" time="1000"]

（影は、消えた。）[l][er]

（美羽は、ジャングルジムから、跳んだ。）[l][er]
（響に教わった受け身で、音もなく、着地した。）[l][er]

#imouto
……先輩。お兄ちゃんのとこ、一緒に、帰ってくれますか[l][er]

#protagonist
ああ[l][er]

[eval exp="f.imouto_refused = true"]
[jump target="imouto_05"]

*imouto_04_accept
#protagonist
……美羽ちゃんが、決めていい[l][er]

（言った瞬間に、間違えた、とわかった。）[l][er]
（"ちゃん"が、口から、こぼれていた。）[l][er]

[chara_show name="imouto" face="sad" pos="right" time="500"]

#imouto
……あ[l][er]

#imouto
……また、"ちゃん"だ[l][er]

#imouto
……やっぱり、先輩にとっても、私は、ずっと"美羽ちゃん"なんですね[l][er]

（違う、と言う前に。）[l][er]
（美羽は、瓶を取っていた。）[l][er]

#protagonist
——待て！[l][er]

（遅かった。）[l][er]

[jump target="imouto_ending_bad"]

; ================================================================================
; 第5話「兄と妹のクッキー」
; ================================================================================
*imouto_05
[chara_hide_all]
[bg storage="friend_house.webp" time="1000"]
[playbgm storage="bgm_sadness.mp3"]

（高橋家。台所。）[l][er]

（友樹は、オーブンの前の床に、座り込んでいた。）[l][er]
（焦げたクッキーの匂いが、まだ、残っていた。）[l][er]

[chara_show name="imouto" face="sad" pos="center" time="1000"]

#imouto
……お兄ちゃん[l][er]

#友樹
……美羽[l][er]

#友樹
……ごめん。"戻れ"とか、言って[l][er]

#友樹
俺、怖かったんだ。お前が、知らない人になったみたいで[l][er]

#友樹
……小さい美羽が、いなくなるのが[l][er]

#imouto
……いなくならないよ[l][er]

#imouto
妹は、辞めない。お兄ちゃんの妹は、ずっと、私だけだもん[l][er]

#imouto
でも——子供は、辞める[l][er]

#imouto
もう、ジャングルジムのてっぺんまで、抱っこしてもらわなくていいから[l][er]

#友樹
……[l][er]

#友樹
……そっか[l][er]

#友樹
……でかくなったなあ、お前[l][er]

#imouto
……うん[l][er]

#友樹
……物理的に[l][er]

#imouto
……それ言う？[l][er]

（友樹は、泣きながら、笑った。）[l][er]
（美羽も、泣きながら、笑った。）[l][er]

[chara_show name="imouto" face="smile" pos="center" time="500"]

#imouto
ねえ、クッキー、もう一回焼こう。焦げちゃったから[l][er]

#imouto
お兄ちゃん、卵割って。……そっと。指先だけで[l][er]

#友樹
なんで俺に指導してんだよ[l][er]

#imouto
私、今、卵割るの、世界一、上手いから[l][er]

[if exp="f.imouto_lie"]
（帰り際、友樹が、玄関で俺を呼び止めた。）[l][er]

#友樹
……"知らない"って言ったこと、まだ、怒ってるからな[l][er]

#protagonist
……ああ[l][er]

#友樹
……でも、あいつを、公園から連れて帰ってきてくれたのは、お前だ[l][er]

#友樹
今度、焼肉おごれ。それで、チャラ[l][er]
[else]
（帰り際、友樹が、玄関で俺を呼び止めた。）[l][er]

#友樹
……"直接聞け"って言ってくれて、助かった[l][er]

#友樹
お前から聞いてたら、たぶん、お前を殴ってた。……殴る前に、美羽に止められただろうけど[l][er]
[endif]

[jump target="imouto_06"]

; ================================================================================
; 告白前夜：悪魔の味見
; ================================================================================
*imouto_06
[chara_hide_all]
[bg storage="protagonist_room_night.webp" time="1000"]
[playbgm storage="bgm_devil.mp3"]

（その夜。自分の部屋。）[l][er]

[chara_show name="akuma" face="default" pos="center" time="1000"]

#akuma
やあ。今の君、どんな味？[l][er]

#protagonist
……焦げたクッキーの味だよ[l][er]

#akuma
あはは。……ねえ。あの子の願いは、"妹を置いていく"だった[l][er]

#akuma
でも、あの子、妹を置いていかなかったね。子供だけ、置いてきた[l][er]

#akuma
契約書の想定外だよ、それ[l][er]

#protagonist
……想定してないことばっかりだな、お前の契約[l][er]

#akuma
人間って、そういうものだからね[l][er]

[chara_show name="akuma" face="smile" pos="center" time="500"]

#akuma
で、"子供じゃない美羽"を、君は、何て呼ぶの？[l][er]

#akuma
"友達の妹"の、次の呼び方。考えておいたら？[l][er]

[chara_hide name="akuma" time="1000"]

（影は、消えた。）[l][er]

[jump target="imouto_07"]

; ================================================================================
; 第6話「形の崩れていないクッキー」
; ================================================================================
*imouto_07
[chara_hide_all]
[bg storage="park.webp" time="1000"]
[playbgm storage="bgm_romance.mp3"]

（一週間後。夕方の公園。）[l][er]

（ジャングルジムは、少し曲がったまま、立っている。）[l][er]

[chara_show name="imouto" face="blush" pos="center" time="1000"]

#imouto
先輩、これ[l][er]

（小さな袋。リボンで、結んである。）[l][er]
（中のクッキーは、一枚も、形が崩れていなかった。）[l][er]

#imouto
全部、この手で作りました[l][er]

#imouto
卵も、生地も、絞り袋も。……一個も、潰さなかった[l][er]

#protagonist
……すごいな[l][er]

#imouto
はい。すごいんです、私[l][er]

#imouto
……それで、先輩[l][er]

#imouto
私、お兄ちゃんの妹は、辞めません[l][er]

#imouto
でも、先輩の"友達の妹"は、辞めたいです[l][er]

#imouto
……先輩のことが、好きだから[l][er]

#imouto
小学生のときから、ずっと[l][er]

[glink target="imouto_ending_good" text="クッキーを受け取って「俺も好きだ、美羽」"]
[glink target="imouto_ending_normal" text="クッキーを受け取って「……友樹の妹で、俺の大事な後輩だ」"]
[s]

; ================================================================================
; GOOD END「子供じゃない」
; ================================================================================
*imouto_ending_good
（クッキーを、受け取った。）[l][er]

#protagonist
俺も好きだ、美羽[l][er]

[chara_show name="imouto" face="surprised" pos="center" time="500"]

#imouto
……[l][er]

#imouto
……"友達の妹"として、じゃなくて？[l][er]

#protagonist
じゃなくて[l][er]

#imouto
……"後輩"として、でもなくて？[l][er]

#protagonist
でもなくて[l][er]

[chara_show name="imouto" face="crying" pos="center" time="500"]

#imouto
……っ、う、うわああん……[l][er]

#protagonist
泣くのか[l][er]

#imouto
泣きながら大人になるって、言ったじゃないですかぁ……[l][er]

[chara_hide_all]
[bg storage="protagonist_room_night.webp" time="1000"]
[playbgm storage="bgm_devil.mp3"]

[chara_show name="akuma" face="smile" pos="center" time="1000"]

#akuma
——はい、ゲーム終了。君の勝ち[l][er]

#akuma
約束どおり、ご祝儀を一口だけ[l][er]

（悪魔の前足が、胸に、ちょんと触れた。）[l][er]
（何かが、ひとかけら、持っていかれた。）[l][er]
（——たぶん、大泣きする美羽を見て、笑ってしまった瞬間の、その端っこ）[l][er]

#akuma
……うん。甘い。クッキーより、甘い[l][er]

#akuma
……あ、お兄ちゃんには、自分で言いなよ。それは、僕の契約の外だから[l][er]

#akuma
じゃあね。もう、来ないよ[l][er]

[chara_hide name="akuma" time="1000"]

[chara_hide_all]
[bg storage="park.webp" time="1000"]
[playbgm storage="bgm_ending.mp3"]

（数ヶ月後。）[l][er]

（友樹には、ちゃんと言った。）[l][er]
（焼肉、三回分で、許してもらった。）[l][er]

[bg storage="events/imouto_park.webp" time="1500"]

#imouto
先輩！　今日の分！[l][er]

（夕方の公園に、美羽が走ってくる。）[l][er]
（両手に、小さな袋を持って。）[l][er]
（地面が、少しだけ、鳴る。）[l][er]

#imouto
今日のは、お兄ちゃんと一緒に作ったんです。お兄ちゃん、卵、三個潰しました[l][er]

#protagonist
……成長したな、友樹[l][er]

#imouto
はい。私の指導がいいので[l][er]

（高橋美羽。）[l][er]
（"妹"を置いていきたかった女の子は、）[l][er]
（妹のまま、子供だけ、置いてきた。）[l][er]
（——今は、俺の隣で、ときどき、泣いて、たくさん笑う。）[l][er]

（GOOD END ——「子供じゃない」）[l][er]
[s]

; ================================================================================
; NORMAL END「大事な後輩」
; ================================================================================
*imouto_ending_normal
（クッキーを、受け取った。）[l][er]

#protagonist
……友樹の妹で、俺の大事な後輩だ[l][er]

[chara_show name="imouto" face="sad" pos="center" time="500"]

#imouto
……[l][er]

#imouto
……"ちゃん"は、つかなかった[l][er]

#imouto
それだけ、今日は、もらっておきます[l][er]

[chara_show name="imouto" face="smile" pos="center" time="500"]

#imouto
でも、先輩。私、待つの、得意なんです[l][er]

#imouto
小学生のときから、ずっと待ってたので。あと何年でも、待てます[l][er]

[chara_hide_all]
[bg storage="protagonist_room_night.webp" time="1000"]
[playbgm storage="bgm_devil.mp3"]

[chara_show name="akuma" face="default" pos="center" time="1000"]

#akuma
……保留、か[l][er]

#akuma
二本目は飲まなかった。でも、"本物"にも、ならなかった[l][er]

#akuma
僕はお腹が空いたまま。……まあ、待つのが得意な子らしいからね。僕も待つよ[l][er]

[chara_hide name="akuma" time="1000"]

[chara_hide_all]
[bg storage="friend_house.webp" time="1000"]
[playbgm storage="bgm_daily.mp3"]

（数ヶ月後。）[l][er]

（友樹の家に遊びに行くと、毎回、クッキーが出てくる。）[l][er]
（形は、一枚も、崩れていない。）[l][er]

[chara_show name="imouto" face="smile" pos="center" time="1000"]

#imouto
先輩、今日のは、自信作です[l][er]

#友樹
俺の分は？[l][er]

#imouto
お兄ちゃんは、自分で焼いて[l][er]

（友樹が、俺を見て、肩をすくめる。）[l][er]
（美羽は、俺の皿にだけ、一枚、多く乗せた。）[l][er]

（NORMAL END ——「大事な後輩」）[l][er]
[s]

; ================================================================================
; BAD END「大人の女の人」
; ================================================================================
*imouto_ending_bad
[playbgm storage="bgm_despair.mp3"]

（彼女は、一息に、飲んだ。）[l][er]

[chara_hide_all]
[bg storage="devil_space.webp" time="1500"]

（世界から、音が消えた。）[l][er]

（ブレザーの縫い目が、裂けた。）[l][er]
（肩が、腕が、もう一段、ふくれあがる。）[l][er]

[status stage="stage2"]
[chara_show name="imouto" face="default" pos="center" time="2000"]

（——そして、それよりも、先に。）[l][er]
（涙が、止まった。）[l][er]
（止まったというより、最初から、流れていなかったみたいに。）[l][er]

#imouto
……ああ。落ち着きました[l][er]

#imouto
お兄ちゃんに"戻れ"って言われたこと、もう、何とも思いません[l][er]

#protagonist
美羽……！[l][er]

#imouto
"美羽ちゃん"でいいですよ、先輩。どう呼ばれても、気にならないので[l][er]

#imouto
……帰りますね。お兄ちゃんには、私から、ちゃんと説明します。冷静に[l][er]

[chara_show name="akuma" face="smile" pos="left" time="1000"]

#akuma
——はい、ゲーム終了[l][er]

#akuma
じゃ、約束どおり。——頂きます[l][er]

（悪魔の前足が、俺の胸に、触れた。）[l][er]
（熱が、引いていく。）[l][er]
（悔しさが。怖さが。形の崩れたクッキーを、二人で笑った記憶が。）[l][er]
（順番に、消えて——）[l][er]

[chara_hide_all]
[bg storage="black.webp" time="2000"]

（……。）[l][er]

[bg storage="friend_house.webp" time="1500"]
[playbgm storage="bgm_isolation.mp3"]

（数ヶ月後。）[l][er]

（友樹の家に行くと、美羽が、静かにお茶を出してくれる。）[l][er]
（"いらっしゃいませ"。丁寧な、大人の声で。）[l][er]

（台所に、お菓子の材料は、もう、置いていない。）[l][er]
（友樹は、最近、あまり笑わなくなった。）[l][er]

（俺は、お茶を飲んで、帰る。）[l][er]
（美羽の焼いたクッキーの味を、思い出そうとして——思い出す理由が、見つからない。）[l][er]

（BAD END ——「大人の女の人」）[l][er]
[s]
