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

（放課後。同好会が終わって、みんなが帰ったあとの体育館。）[l][er]

[chara_show name="osananajimi" face="default" pos="center" time="1000"]

（結衣は、まだ、ストレッチをしていた。）[l][er]
（昨日も。おとといも。最後まで残っていた。）[l][er]

#protagonist
……帰らないのか[l][er]

#osananajimi
帰るよ。もうちょっとしたら[l][er]

#protagonist
昨日も、そう言ってた[l][er]

#osananajimi
……[l][er]

（結衣は、床に座ったまま、膝を抱えた。）[l][er]
（膝を抱える腕が、太い。抱えられている膝も、太い。）[l][er]
（昔、同じ格好で、うちの玄関で泣いていた子と、同じ姿勢なのに。）[l][er]

[chara_show name="osananajimi" face="sad" pos="center" time="500"]

#osananajimi
お母さんがさ[l][er]

#osananajimi
あの日から、あたしの顔、見ないの[l][er]

#protagonist
……[l][er]

#osananajimi
怒鳴ったりは、しないよ。ご飯も作ってくれる[l][er]

#osananajimi
でも、あたしが帰ると、台所に行っちゃう。ご飯は、あたしの部屋の前に置いてある[l][er]

#osananajimi
ドア越しに、"おかえり"って言うの。顔見ないで[l][er]

#osananajimi
……まあ、そうだよね。娘が一晩で、こうなったら[l][er]

（笑おうとして、失敗した顔だった。）[l][er]

#osananajimi
ねえ。今日、一緒に帰ってくれない？[l][er]

#protagonist
家まで？[l][er]

#osananajimi
うん。玄関まで[l][er]

#osananajimi
あんたが一緒だと、お母さん、ちょっとだけ"いつもの顔"するから[l][er]

#osananajimi
小さいときから、あんたは、うちの風景の一部だもん[l][er]

（——風景。）[l][er]
（家具、と、あの夜、彼女は悪魔に言われていた。）[l][er]
（その"家具"を、今、彼女は、頼っている。）[l][er]

#protagonist
……わかった。行く[l][er]

[chara_hide_all]
[bg storage="street_evening.webp" time="1000"]
[playbgm storage="bgm_sadness.mp3"]

（藤咲家の前。うちから、三軒先。）[l][er]

（玄関のドアが、開いた。）[l][er]

[chara_show name="mother" face="neutral" pos="left" time="1000"]
[chara_show name="osananajimi" face="default" pos="right" time="1000"]

#mother
……あら、&f.main_nameくん[l][er]

#mother
久しぶりね。上がっていく？[l][er]

（おばさんの目は、俺を見ていた。）[l][er]
（隣に立つ結衣の、肩より下を、見ないようにしていた。）[l][er]

#osananajimi
……ただいま[l][er]

#mother
……おかえり。ご飯、できてるから[l][er]

（おばさんは、それだけ言って、背中を向けかけた。）[l][er]

#protagonist
——あの[l][er]

#mother
……なあに？[l][er]

（言うなら、今しかない、と思った。）[l][er]

[glink target="osananajimi_01_a" text="「結衣がこうなったのは、俺のせいです」"]
[glink target="osananajimi_01_b" text="「結衣、部活で、すごく頑張ってて」"]
[s]

*osananajimi_01_a
[eval exp="f.osa_honest = true"]

#protagonist
結衣がこうなったのは、俺のせいです[l][er]

[chara_show name="osananajimi" face="surprised" pos="right" time="500"]

#osananajimi
ちょっ——[l][er]

#mother
……どういう、こと[l][er]

#protagonist
全部は、説明できません。信じてもらえないと思います[l][er]

#protagonist
でも、きっかけは、俺です。俺が、願ったことが、原因です[l][er]

#protagonist
だから——結衣を、見てあげてください。怒るなら、俺に怒ってください[l][er]

（おばさんは、長いあいだ、俺を見ていた。）[l][er]
（それから、初めて、結衣を見た。）[l][er]
（肩を。腕を。それから、顔を。）[l][er]

#mother
……あなたたち、昔から、そう[l][er]

#mother
どっちかが何か壊すと、もう片方が"自分がやった"って言いに来るの[l][er]

#mother
……ご飯、三人分、あるから。上がって[l][er]

（おばさんは、台所に戻っていった。）[l][er]
（でも、今度は、ドアを、閉めなかった。）[l][er]

[jump target="osananajimi_01_end"]

*osananajimi_01_b
[eval exp="f.osa_lie = true"]

#protagonist
結衣、部活で、すごく頑張ってて[l][er]

#protagonist
筋肉同好会っていうのを、みんなで作ったんです。それで、急に——[l][er]

#mother
……急に、で、こうはならないでしょう[l][er]

#protagonist
……[l][er]

#mother
いいのよ。あなたが庇ってくれてるのは、わかるから[l][er]

#mother
昔から、そういう子だもの[l][er]

（おばさんは、少しだけ笑った。）[l][er]
（でも、結衣のことは、最後まで、見なかった。）[l][er]

#mother
ご飯、あの子の部屋の前に置いておくわね[l][er]

[chara_show name="osananajimi" face="sad" pos="right" time="500"]

#osananajimi
……[l][er]

[jump target="osananajimi_01_end"]

*osananajimi_01_end
[chara_hide name="mother" time="500"]

[chara_show name="osananajimi" face="default" pos="center" time="500"]

#osananajimi
……ありがと。玄関まで来てくれて[l][er]

#protagonist
玄関までしか、行けなかった[l][er]

#osananajimi
それでも、いい[l][er]

#osananajimi
……ねえ。あたしさ[l][er]

#osananajimi
"家具を辞めたい"って思って、薬、飲んだの[l][er]

#osananajimi
なのに今日、あたし、あんたを家具みたいに使った。"いてくれるだけでいい"って[l][er]

#osananajimi
……ずるいよね[l][er]

#protagonist
ずるくない[l][er]

#osananajimi
ずるいよ。ずるいって思わないと、あたし、甘えちゃう[l][er]

（玄関のドアが、閉まった。）[l][er]
（三軒先の自分の家まで、俺は、いつもよりゆっくり歩いた。）[l][er]

[jump target="osananajimi_02"]

; ================================================================================
; 第2話「鏡の前の他人」
; ================================================================================
*osananajimi_02
[chara_hide_all]
[bg storage="gym.webp" time="1000"]
[playbgm storage="bgm_isolation.mp3"]

（数日後。体育館の、ステージ脇の大鏡の前。）[l][er]

[chara_show name="osananajimi" face="default" pos="center" time="1000"]

（結衣は、鏡の中の自分を、じっと見ていた。）[l][er]

#osananajimi
……ねえ。この人、誰だと思う？[l][er]

#protagonist
結衣だろ[l][er]

#osananajimi
即答だね[l][er]

#protagonist
迷う理由がない[l][er]

#osananajimi
……そこなんだよね[l][er]

[chara_show name="osananajimi" face="angry" pos="center" time="500"]

#osananajimi
お母さんは、あたしを見られなくなった。クラスの子は、あたしを"ネタ"として見るようになった[l][er]

#osananajimi
みんな、あたしを、前と違う目で見る[l][er]

#osananajimi
なのに、あんただけ、前と同じ目で見る[l][er]

#protagonist
……悪いことか、それ[l][er]

#osananajimi
悪くないよ。すごく、助かってる[l][er]

#osananajimi
でもさ——[l][er]

（結衣が、振り返った。）[l][er]
（鏡の中と、同じ顔で。）[l][er]

#osananajimi
あたしが変わりたかったのは、"あんたの目"の中でだったんだよ[l][er]

#osananajimi
体がこんなになっても、あんたにとっては、"いつもの結衣"のまま[l][er]

#osananajimi
……それって、結局、家具のままってことじゃん[l][er]

（言い返そうとして、言葉が、出なかった。）[l][er]

（前と同じ目で見ること。）[l][er]
（それは、俺が、彼女にあげられる、いちばんの優しさだと思っていた。）[l][er]
（——彼女が、いちばん、もらいたくなかったものだった。）[l][er]

[chara_show name="osananajimi" face="sad" pos="center" time="500"]

#osananajimi
……ごめん。八つ当たり[l][er]

#osananajimi
あんたのせいじゃないのに、あんたに言っちゃう。昔から[l][er]

#protagonist
……昔から、それでいい[l][er]

#osananajimi
よくないよ[l][er]

（彼女は、タオルを肩にかけて、体育館を出ていった。）[l][er]
（鏡には、俺だけが残っていた。）[l][er]
（何も変わっていない、俺だけが。）[l][er]

[jump target="osananajimi_03"]

; ================================================================================
; 第3話「おばさんの電話」
; ================================================================================
*osananajimi_03
[chara_hide_all]
[bg storage="protagonist_room_night.webp" time="1000"]
[playbgm storage="bgm_sadness.mp3"]

（その週の、金曜の夜。）[l][er]

（スマホが鳴った。）[l][er]
（画面に出た名前は——"藤咲さん（ゆいママ）"。）[l][er]
（小学校の頃、母さんが登録してくれた番号だった。）[l][er]

#mother
……&f.main_nameくん？　ごめんなさいね、夜に[l][er]

#protagonist
いえ[l][er]

[if exp="f.osa_honest"]
#mother
この前、"俺のせいです"って、言ってくれたでしょう[l][er]

#mother
あれから、ずっと考えてたの。あの子の体のこと[l][er]

#mother
……あなたのせいかどうかは、正直、どうでもいいの[l][er]

#mother
私が知りたいのは、ひとつだけ[l][er]

#mother
あの子、学校で、笑ってる？[l][er]

#protagonist
……笑ってます。無理してるときも、あるけど[l][er]

#mother
そう[l][er]

#mother
……家では、もう、笑わないの。私が、笑わせてあげられないから[l][er]
[else]
#mother
今日、あの子の部屋の前にご飯を置きに行ったら、ドアが少し開いてて[l][er]

#mother
スマホの画面が見えたの。"筋肉同好会"って、星野さん？　あの子のお友達の投稿[l][er]

#mother
……部活で急に、なんて、嘘だってことくらい、わかってたのよ[l][er]

#mother
でも、あの写真のあの子、すごく楽しそうに笑ってた[l][er]

#mother
……家では、もう、笑わないのに[l][er]
[endif]

#mother
ねえ。私、どうしたらいいのかしら[l][er]

#mother
あの子を見ると、"前の結衣"を探しちゃうの。顔の中に。声の中に[l][er]

#mother
見つかると、ほっとして。見つからないと、怖くなって[l][er]

#mother
……そんな目で見られたら、あの子、嫌よね[l][er]

#protagonist
……[l][er]

（同じだ、と思った。）[l][er]
（俺は"前の結衣"しか見ていなくて、おばさんは"前の結衣"を探している。）[l][er]
（——結衣は、どっちにも、今の自分を見てもらえていない。）[l][er]

#protagonist
……おばさん[l][er]

#protagonist
明日、結衣と、ちゃんと話しませんか。俺も、行きます[l][er]

#mother
……ええ。お願い[l][er]

[jump target="osananajimi_04"]

; ================================================================================
; 第4話「二本目」
; ================================================================================
*osananajimi_04
[chara_hide_all]
[bg storage="street_evening.webp" time="1000"]
[playbgm storage="bgm_tension.mp3"]

（土曜日の夕方。藤咲家の前。）[l][er]

（約束の時間より、早く着いた。）[l][er]

（——玄関の中から、声が、聞こえた。）[l][er]

#mother
……だから、前みたいに、髪だけでも——[l][er]

#osananajimi
髪を戻しても、腕は戻んないよ！[l][er]

#mother
戻してほしいなんて、言ってないでしょう！[l][er]

#osananajimi
言ってる！　ずっと、目で言ってる！[l][er]

#mother
……[l][er]

#mother
……じゃあ、言うわよ[l][er]

#mother
返してほしいわよ。前の結衣を[l][er]

（音が、止まった。）[l][er]

（玄関のドアが、乱暴に開いた。）[l][er]

[chara_show name="osananajimi" face="crying" pos="center" time="500"]

（結衣が、飛び出してきた。）[l][er]
（俺に、気づかなかった。）[l][er]
（そのまま、走っていった。夕暮れの道を、まっすぐ。）[l][er]

#protagonist
結衣！[l][er]

[chara_hide_all]
[bg storage="park_night.webp" time="1000"]
[playbgm storage="bgm_isolation.mp3"]

（見つけたのは、日が沈んでからだった。）[l][er]

（小さい頃、二人でよく来た公園。）[l][er]
（ブランコの横に、結衣が、立っていた。）[l][er]

[chara_show name="osananajimi" face="crying" pos="right" time="1000"]
[chara_show name="akuma" face="default" pos="left" time="1000"]
[playbgm storage="bgm_devil.mp3"]

（——その隣に、黒い影が、いた。）[l][er]

#akuma
……ね。だから言ったでしょ。"見慣れた結衣"じゃなくなるって[l][er]

#akuma
君は、家具を辞めた。でも、家具じゃない君の居場所は、まだ、どこにもない[l][er]

#osananajimi
……[l][er]

#akuma
これ、あげる[l][er]

（悪魔の前足に、小さな瓶。）[l][er]
（一本目と同じ形。中身の色だけが、少し、暗い。）[l][er]

#akuma
二本目。飲めば、もう泣かない。怒らない[l][er]

#akuma
お母さんが"前の結衣"を探しても、平気で、前の結衣の顔をしてあげられる[l][er]

#akuma
何を言われても、にこにこ笑って、"おかえり"に、"ただいま"って言える[l][er]

#akuma
誰の邪魔もしない。誰にも何も求めない。——完璧な、いい子だよ[l][er]

#osananajimi
……それ、家具じゃん[l][er]

#akuma
うん。でも、もう、痛くない家具[l][er]

（結衣の手が、瓶に向かって、ゆっくり、伸びた。）[l][er]

#osananajimi
……痛くないなら、いいかな[l][er]

#osananajimi
お母さんも、そのほうが、楽だし[l][er]

#protagonist
——結衣[l][er]

[chara_show name="osananajimi" face="surprised" pos="right" time="500"]

#osananajimi
……なんで、いるの[l][er]

#akuma
やあ。いいところに来たね[l][er]

#akuma
ちょうど、この子の"これから"の話をしてたんだ。飲むかどうかは、彼女次第だけど[l][er]

（言わなきゃいけないことが、ある。）[l][er]
（ずっと、言わずに、"いつもの目"で、ごまかしてきたことが。）[l][er]

[glink target="osananajimi_04_refuse" text="「今のお前が、好きだ。前の結衣じゃなくて」"]
[glink target="osananajimi_04_accept" text="「……お前が、楽なほうでいい」"]
[s]

*osananajimi_04_refuse
#protagonist
今のお前が、好きだ[l][er]

#osananajimi
……[l][er]

#protagonist
"前の結衣"じゃない。"いつもの結衣"でもない[l][er]

#protagonist
腕が太くて、母親とケンカして、俺に八つ当たりして、公園で泣いてる、今のお前が[l][er]

#protagonist
……ずっと、"いつも通り"の目で見てたのは、それが楽だったからだ[l][er]

#protagonist
お前が隣にいるのが当たり前だと思ってれば、何も、選ばなくて済んだから[l][er]

#protagonist
家具にしてたのは、俺だ。ごめん[l][er]

[chara_show name="osananajimi" face="crying" pos="right" time="500"]

#osananajimi
……ずるい[l][er]

#osananajimi
今、それ言うの、ずるいよ[l][er]

#protagonist
知ってる[l][er]

#osananajimi
……っ[l][er]

（結衣の手が、瓶の手前で、止まった。）[l][er]
（それから——拳に、なった。）[l][er]

#osananajimi
……いらない[l][er]

#osananajimi
痛くても、いい。今の、"好き"って言われた感じ、なくなるなら、いらない[l][er]

[chara_show name="akuma" face="smile" pos="left" time="500"]

#akuma
……あーあ。返品か[l][er]

#akuma
いいよ。ゲームは、まだ続いてるしね[l][er]

[chara_hide name="akuma" time="1000"]

（影は、消えた。）[l][er]

（結衣は、ブランコに座った。）[l][er]
（鎖が、ぎしぎし鳴った。小さい頃は、鳴らなかったのに。）[l][er]

#osananajimi
……ブランコ、壊れたら、あんたのせいね[l][er]

#protagonist
なんでだよ[l][er]

#osananajimi
昔から、そう決まってる[l][er]

（泣きながら、少しだけ、笑っていた。）[l][er]

[eval exp="f.osa_refused = true"]
[jump target="osananajimi_05"]

*osananajimi_04_accept
#protagonist
……お前が、楽なほうでいい[l][er]

（言った瞬間に、間違えた、とわかった。）[l][er]

[chara_show name="osananajimi" face="sad" pos="right" time="500"]

#osananajimi
……そっか[l][er]

#osananajimi
やっぱり、あんたにとっても、そっちのほうがいいよね[l][er]

#osananajimi
いつもの結衣のほうが[l][er]

（違う、と言う前に。）[l][er]
（彼女は、瓶を、取っていた。）[l][er]

#protagonist
——待て！[l][er]

（遅かった。）[l][er]

[jump target="osananajimi_ending_bad"]

; ================================================================================
; 第5話「ただいま」
; ================================================================================
*osananajimi_05
[chara_hide_all]
[bg storage="street_evening.webp" time="1000"]
[playbgm storage="bgm_sadness.mp3"]

（翌日の夕方。藤咲家の前。）[l][er]

[chara_show name="osananajimi" face="default" pos="right" time="1000"]

#osananajimi
……玄関まで、じゃなくて[l][er]

#osananajimi
今日は、中まで、来て[l][er]

#protagonist
ああ[l][er]

（玄関のドアを、結衣が、自分で開けた。）[l][er]

[chara_show name="mother" face="neutral" pos="left" time="1000"]

#mother
……結衣[l][er]

#osananajimi
……ただいま[l][er]

#mother
……おかえり[l][er]

（おばさんは、台所に、行かなかった。）[l][er]
（玄関に、立ったままだった。）[l][er]

#osananajimi
お母さん。あたし、言わなきゃいけないことがある[l][er]

#osananajimi
この体、勝手にこうなったんじゃない[l][er]

#osananajimi
"飲んだら、元に戻れない"って言われて、それでも、自分で選んで飲んだの[l][er]

#mother
……どうして[l][er]

#osananajimi
変わりたかったから。ずっと同じ場所にいる自分が、嫌だったから[l][er]

#osananajimi
……ごめんね。前の結衣、返してあげられない[l][er]

#osananajimi
でも、今の結衣も、お母さんの子だよ[l][er]

（おばさんは、何も言わなかった。）[l][er]
（言わないまま、手を伸ばして——結衣の腕に、触れた。）[l][er]

（太い腕だった。おばさんの手のひらでは、半分も、覆えなかった。）[l][er]

#mother
……あったかい[l][er]

#mother
熱出したとき、氷枕、作ってあげたでしょう。あのときと、同じ[l][er]

#mother
……結衣の、体温だわ[l][er]

[chara_show name="osananajimi" face="crying" pos="right" time="500"]

#osananajimi
……っ[l][er]

#mother
ひどいこと言って、ごめんね[l][er]

#mother
前の結衣を探すの、すぐには、やめられないかもしれない[l][er]

#mother
でも——探しながら、今のあなたを、ちゃんと見るから[l][er]

#mother
……ご飯、台所で、一緒に食べましょう。三人で[l][er]

（結衣は、子どもみたいに、声を上げて泣いた。）[l][er]
（おばさんも、泣いていた。）[l][er]

（俺は、玄関で、靴を脱ぐのを、少しだけ、遅らせた。）[l][er]

[jump target="osananajimi_06"]

; ================================================================================
; 告白前夜：悪魔の味見
; ================================================================================
*osananajimi_06
[chara_hide_all]
[bg storage="protagonist_room_night.webp" time="1000"]
[playbgm storage="bgm_devil.mp3"]

（その夜。自分の部屋。）[l][er]

[chara_show name="akuma" face="default" pos="center" time="1000"]

#akuma
やあ。今の君、どんな味？[l][er]

#protagonist
……人の部屋に出るなって、言っただろ[l][er]

#akuma
いいじゃない。三軒先の家、今日はにぎやかだったね[l][er]

#akuma
……ねえ。あの子の願いは、"家具を辞める"だった[l][er]

#akuma
辞めたあとの居場所は、僕は用意してない。そういう契約だから[l][er]

#akuma
あの子は、それを、自分で作った。お母さんと、君と[l][er]

#protagonist
……[l][er]

[chara_show name="akuma" face="smile" pos="center" time="500"]

#akuma
で、最後の席は、まだ空いてる[l][er]

#akuma
"幼なじみ"の席を辞めた子の、次の席。何て名前にするのか——それは、君が決めることだよ[l][er]

[chara_hide name="akuma" time="1000"]

（影は、消えた。）[l][er]

（窓の外。三軒先の家の、二階の明かりが、まだついていた。）[l][er]

[jump target="osananajimi_07"]

; ================================================================================
; 第6話「三軒先」
; ================================================================================
*osananajimi_07
[chara_hide_all]
[bg storage="street_evening.webp" time="1000"]
[playbgm storage="bgm_romance.mp3"]

（一週間後。同好会の帰り道。）[l][er]

（家まで、あと、三軒。）[l][er]

[chara_show name="osananajimi" face="default" pos="center" time="1000"]

#osananajimi
……ねえ[l][er]

#protagonist
ん[l][er]

#osananajimi
最近、お母さん、あたしの写真撮るの。勝手に[l][er]

#osananajimi
"記録よ、記録"とか言って。前の写真の隣に、並べてるの[l][er]

#protagonist
……いいじゃん[l][er]

#osananajimi
うん。いい[l][er]

（夕焼けの中で、彼女は、立ち止まった。）[l][er]
（俺の家の前でもなく、彼女の家の前でもない。ちょうど、真ん中。）[l][er]

[chara_show name="osananajimi" face="blush" pos="center" time="500"]

#osananajimi
あのさ。公園で言ってくれたこと[l][er]

#osananajimi
あれ、まだ、有効？[l][er]

#protagonist
……[l][er]

#osananajimi
"今のお前が好きだ"って[l][er]

#osananajimi
あたし、あれから毎晩、思い出してる。思い出すたびに、ブランコ壊しそうになってる[l][er]

#osananajimi
……だから、ちゃんと聞きたい[l][er]

#osananajimi
あたし、"幼なじみ"、辞めてもいい？[l][er]

[glink target="osananajimi_ending_good" text="「辞めてくれ。それで、俺の彼女になってくれ」"]
[glink target="osananajimi_ending_normal" text="「……幼なじみも、辞めないでほしい」"]
[s]

; ================================================================================
; GOOD END「真ん中の場所」
; ================================================================================
*osananajimi_ending_good
#protagonist
辞めてくれ[l][er]

#protagonist
それで——俺の彼女に、なってくれ[l][er]

[chara_show name="osananajimi" face="surprised" pos="center" time="500"]

#osananajimi
……[l][er]

#osananajimi
……今の、録音しとけばよかった[l][er]

#protagonist
二回は言わないぞ[l][er]

#osananajimi
言わせるもん。これから、何回でも[l][er]

[chara_show name="osananajimi" face="smile" pos="center" time="500"]

（結衣が、手を差し出した。）[l][er]
（小さい頃、毎朝、こうやって手を引かれて、幼稚園に行った。）[l][er]

（握った手は、あの頃より、ずっと大きくて、強くて——）[l][er]
（あの頃と同じくらい、汗をかいていた。）[l][er]

#osananajimi
……ふふ。あんたの手、ちっちゃ[l][er]

#protagonist
お前がでかいんだよ[l][er]

#osananajimi
知ってる。——自分で、選んだから[l][er]

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
（——たぶん、夕焼けの中で手を握った瞬間の、汗の端っこ）[l][er]

#akuma
……うん。こんなに長く煮込まれた味、初めてだ。十年ものだね[l][er]

#akuma
じゃあね。もう、来ないよ[l][er]

[chara_hide name="akuma" time="1000"]

[chara_hide_all]
[bg storage="school_gate.webp" time="1000"]
[playbgm storage="bgm_ending.mp3"]

（数ヶ月後。）[l][er]

（朝。三軒先の家から、結衣が出てくる。）[l][er]
（玄関から、おばさんが、スマホを構えて、手を振っている。）[l][er]

[chara_hide_all]
[bg storage="events/osananajimi_schoolgate.webp" time="1500"]

#osananajimi
おはよ。……ほら[l][er]

（差し出された手を、握る。）[l][er]
（毎朝のことなのに、毎朝、少しだけ、心臓が鳴る。）[l][er]

#osananajimi
ねえ。あたしたち、もう"いつもの"じゃないよね[l][er]

#protagonist
ああ[l][er]

#osananajimi
……ふふ。毎日、ちょっとずつ違う[l][er]

（藤咲結衣。）[l][er]
（"幼なじみ"を辞めた女の子は、）[l][er]
（今、俺の隣の、新しい場所にいる。）[l][er]

（GOOD END ——「真ん中の場所」）[l][er]
[s]

; ================================================================================
; NORMAL END「三軒先の幼なじみ」
; ================================================================================
*osananajimi_ending_normal
#protagonist
……幼なじみも、辞めないでほしい[l][er]

[chara_show name="osananajimi" face="sad" pos="center" time="500"]

#osananajimi
……[l][er]

#protagonist
今のお前が大事だ。それは、本当だ[l][er]

#protagonist
でも、十年分の"いつも"を、まだ、全部は捨てられない[l][er]

#osananajimi
……そっか[l][er]

#osananajimi
ずるいね。……でも、あんたらしい[l][er]

[chara_show name="osananajimi" face="smile" pos="center" time="500"]

#osananajimi
じゃあ、待つ。あんたが"いつも"を捨てられるまで[l][er]

#osananajimi
あたし、もう家具じゃないから。待ってる間も、勝手に動くからね[l][er]

#protagonist
……覚悟しとく[l][er]

[chara_hide_all]
[bg storage="protagonist_room_night.webp" time="1000"]
[playbgm storage="bgm_devil.mp3"]

[chara_show name="akuma" face="default" pos="center" time="1000"]

#akuma
……保留、か[l][er]

#akuma
二本目は飲まなかった。でも、"本物"にも、ならなかった[l][er]

#akuma
僕はお腹が空いたまま。……まあ、十年待った子だもの。あと少しくらい、待てるか[l][er]

[chara_hide name="akuma" time="1000"]

[chara_hide_all]
[bg storage="street_evening.webp" time="1000"]
[playbgm storage="bgm_daily.mp3"]

（数ヶ月後。）[l][er]

（同好会の帰り道。三軒先まで、二人で歩く。）[l][er]

[chara_show name="osananajimi" face="smile" pos="center" time="1000"]

#osananajimi
じゃ、また明日[l][er]

#protagonist
ああ。また明日[l][er]

（毎日、同じ言葉。）[l][er]
（でも、彼女は、ときどき、言ったあとに、振り返る。）[l][er]
（"いつも"の中に、少しだけ、"いつもじゃないもの"を混ぜるみたいに。）[l][er]

（NORMAL END ——「三軒先の幼なじみ」）[l][er]
[s]

; ================================================================================
; BAD END「完璧な家具」
; ================================================================================
*osananajimi_ending_bad
[playbgm storage="bgm_despair.mp3"]

（彼女は、一息に、飲んだ。）[l][er]

[chara_hide_all]
[bg storage="devil_space.webp" time="1500"]

（世界から、音が消えた。）[l][er]

（制服の袖が、裂けた。）[l][er]
（肩が、腕が、もう一段、ふくれあがる。）[l][er]

[status stage="stage2"]
[chara_show name="osananajimi" face="smile" pos="center" time="2000"]

（——そして、それよりも、先に。）[l][er]
（泣き腫らしていた目から、涙が、すっと引いた。）[l][er]

#osananajimi
……あ。平気だ[l][er]

#osananajimi
もう、全然、痛くない[l][er]

#protagonist
結衣……！[l][er]

#osananajimi
帰ろっか。お母さん、心配してるよね[l][er]

#osananajimi
ちゃんと謝る。"前の結衣"みたいに、笑って[l][er]

（いつもの、笑顔だった。）[l][er]
（十年間、隣で見てきた、いつもの笑顔。）[l][er]
（——いつもすぎて、どこにも、結衣がいなかった。）[l][er]

[chara_show name="akuma" face="smile" pos="left" time="1000"]

#akuma
——はい、ゲーム終了[l][er]

#akuma
じゃ、約束どおり。——頂きます[l][er]

（悪魔の前足が、俺の胸に、触れた。）[l][er]
（熱が、引いていく。）[l][er]
（悔しさが。怖さが。夕焼けの中で手を引かれた記憶の、温度が。）[l][er]
（順番に、消えて——）[l][er]

[chara_hide_all]
[bg storage="black.webp" time="2000"]

（……。）[l][er]

[bg storage="school_gate.webp" time="1500"]
[playbgm storage="bgm_isolation.mp3"]

（数ヶ月後。）[l][er]

（三軒先の結衣は、毎朝、にこにこ笑って、"おはよ"と言う。）[l][er]
（おばさんとも、うまくやっているらしい。ケンカは、一度もしないそうだ。）[l][er]

（俺も、"おはよう"と返す。）[l][er]
（それだけだ。）[l][er]
（彼女は何も求めないし、俺も、何も感じない。）[l][er]

（まるで、昔から、そこにある家具みたいに。）[l][er]

（BAD END ——「完璧な家具」）[l][er]
[s]
