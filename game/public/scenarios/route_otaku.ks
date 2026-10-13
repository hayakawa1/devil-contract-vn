; route: オタク（神崎理香）
; 第3話の一週間後から。理香は、薬の正体を調べている。
*start
[jump target="otaku_01"]

; ================================================================================
; 第1話「欠番」
; ================================================================================
*otaku_01
[chara_hide_all]
[bg storage="science_prep_room.webp" time="1000"]
[playbgm storage="bgm_daily.mp3"]

（放課後。理科準備室。）[l][er]

（同好会の初日に、七人と俺が集まった部屋。）[l][er]
（今は、ほとんど、理香の私室になっている。）[l][er]

[chara_show name="otaku" face="default" pos="center" time="1000"]

#otaku
来てくれましたね。座ってください。そこ、試薬棚なので、もたれないでください[l][er]

（白衣を着ている。袖が、肘で止まっている。）[l][er]
（ボタンは、一つも、留まっていない。）[l][er]

#protagonist
白衣、パツパツだぞ[l][er]

#otaku
承知しています。科学部の備品で、一番大きいサイズです[l][er]

#otaku
それより、これを[l][er]

（机の上に、空き瓶が、七本、並んでいた。）[l][er]

#protagonist
……全員分、集めたのか[l][er]

#otaku
交渉しました。結衣さんは"捨てようと思ってた"、凛先輩は"証拠品として保管してあります"、美咲さんは"写真撮ってからね"[l][er]

#otaku
九条さんは、駅のゴミ箱を一緒に探してくれました[l][er]

#protagonist
……執念だな[l][er]

#otaku
科学です[l][er]

（理香は、瓶を一本、光に透かした。）[l][er]

#otaku
ラベルの下に、小さく番号が印字されています[l][er]

#otaku
03、07、12、13、14、15、16[l][er]

#protagonist
……連番じゃないな[l][er]

#otaku
はい。そして、一番小さいのが03[l][er]

#otaku
——01と02は、どこに行ったんでしょう[l][er]

（理香の目が、光っていた。）[l][er]
（眼鏡のレンズの反射じゃない。中から。）[l][er]

#otaku
悪魔は、"同じ薬を、七本配ってる"と言いました。でも、番号は十六まであります[l][er]

#otaku
つまり、私たちの前にも、誰かが、これを飲んでいる[l][er]

#otaku
調べたいんです。あの悪魔が何なのか。この薬が、何なのか[l][er]

#otaku
……それから、"二本目"が何なのか[l][er]

#protagonist
二本目のこと、知ってるのか[l][er]

#otaku
みんなが初めて集まった日の理科準備室で、悪魔が帰り際に、私にだけ、言いました[l][er]

#otaku
"君なら、二本目にも興味あるでしょ"と[l][er]

（背筋が、冷えた。）[l][er]

#otaku
手伝ってもらえませんか。記録係が、必要なんです[l][er]

#otaku
自分の体を測りながら、自分で記録するのは、限界があります[l][er]

[glink target="otaku_01_a" text="「手伝う。ただし、無茶はするな」"]
[glink target="otaku_01_b" text="「……二本目には、近づくな」"]
[s]

*otaku_01_a
[eval exp="f.otaku_help = true"]

#protagonist
手伝う。ただし、無茶はするな[l][er]

[chara_show name="otaku" face="smile" pos="center" time="500"]

#otaku
ありがとうございます。無茶の定義は、あとで、すり合わせましょう[l][er]

#protagonist
すり合わせる気、ないだろ[l][er]

#otaku
あります。九割くらいは[l][er]

（彼女は、新品のノートを、俺に差し出した。）[l][er]
（表紙に、"被験者R・観察記録"と書いてある。）[l][er]

#otaku
記録係さん。毎日、私の数値と——それから、私の様子を、書いてください[l][er]

#otaku
"様子"は、私には、測れないので[l][er]

[jump target="otaku_02"]

*otaku_01_b
#protagonist
……二本目には、近づくな[l][er]

[chara_show name="otaku" face="angry" pos="center" time="500"]

#otaku
近づきません。調べるだけです[l][er]

#protagonist
それが、近づくってことだろ[l][er]

#otaku
……[l][er]

#otaku
あなたは、私が"知りたい"と言うと、いつも少し、引きますね[l][er]

#otaku
いいです。一人でやります。慣れていますから[l][er]

（彼女は、俺から目をそらして、瓶を、一本ずつ、ケースにしまった。）[l][er]
（丁寧に。誰にも、触らせないように。）[l][er]

[jump target="otaku_02"]

; ================================================================================
; 第2話「三十年前の紀要」
; ================================================================================
*otaku_02
[chara_hide_all]
[bg storage="science_prep_room.webp" time="1000"]
[playbgm storage="bgm_tension.mp3"]

（一週間後。夜の理科準備室。）[l][er]

[if exp="f.otaku_help"]
（俺は、"被験者R・観察記録"の七ページ目を書いていた。）[l][er]
（"握力：測定不能。睡眠：三時間。夕飯：カロリーメイト二本。様子：楽しそう。でも、目の下にクマ"）[l][er]
[else]
（理香が、学校に泊まり込んでいる、と、凛から聞いた。）[l][er]
（"教員には、科学部の夜間観測ということにしてあります。三日目です"。）[l][er]
（俺は、夜の校舎に、忍び込んだ。）[l][er]
[endif]

[chara_show name="otaku" face="surprised" pos="center" time="1000"]

#otaku
——見つけました[l][er]

（理香が、古い冊子を、机に広げた。）[l][er]
（"本校科学部紀要　第十二号"。日付は、三十年前。）[l][er]

#otaku
図書室の書庫の、一番下の段にありました。誰も、借りた記録がない[l][er]

#otaku
ここを読んでください[l][er]

（"報告：在校女子生徒二名における、急激な筋肥大の事例"）[l][er]
（"事例一。肥大の数週間後、本人の訴えにより再検査。感情表出の著しい平板化を認める。本人は『静かになった』と述べた"）[l][er]
（"事例二。本人の希望により、記録を削除する"）[l][er]

#protagonist
……事例一[l][er]

#otaku
はい。おそらく、ボトル番号01の人です[l][er]

#otaku
"感情表出の平板化"。"静かになった"[l][er]

#otaku
……これが、二本目の作用だと思います[l][er]

（悪魔は、あの夜、俺の部屋で言っていた。）[l][er]
（"二本目は、心ごと作り変える。迷わない、揺れない、傷つかない"。）[l][er]

#otaku
事例二は、記録を削除した。つまり、本人が、自分の意志で、選べる状態だった[l][er]

#otaku
02番の人は、二本目を、飲まなかったんだと思います[l][er]

#otaku
……その人が、その後どうなったかは、どこにも、書いてありません[l][er]

[chara_show name="otaku" face="default" pos="center" time="500"]

#otaku
&f.main_nameさん。私、気づいてしまったんです[l][er]

#otaku
二本目の作用を、正確に記録した人は、まだ、誰もいない[l][er]

#otaku
事例一の報告者は、外から観察しただけ。中で何が起きるのかは、誰も知らない[l][er]

#protagonist
……理香[l][er]

#otaku
わかっています。わかっていますけど——[l][er]

#otaku
"前例がない"は、私にとって、麻薬なんです[l][er]

（理香は、笑った。）[l][er]
（いつもの、研究者の顔で。）[l][er]
（——その顔が、初めて、少しだけ、怖いと思った。）[l][er]

[jump target="otaku_03"]

; ================================================================================
; 第3話「測れないもの」
; ================================================================================
*otaku_03
[chara_hide_all]
[bg storage="science_room.webp" time="1000"]
[playbgm storage="bgm_sadness.mp3"]

（数日後。放課後の理科室。）[l][er]

[chara_show name="otaku" face="default" pos="center" time="1000"]

（理香は、心拍計を、自分の指につけていた。）[l][er]

#otaku
少し、実験に付き合ってください[l][er]

#protagonist
何の[l][er]

#otaku
あなたが部屋に入ってきたときの、私の心拍の変化を、測定しています[l][er]

#protagonist
……は？[l][er]

#otaku
入室前、毎分六十八。入室時、九十四。現在、八十八[l][er]

#otaku
有意な上昇です[l][er]

#protagonist
……それ、何の実験だ[l][er]

#otaku
私が、あなたに好意を持っているかどうかの、検証です[l][er]

（何も、言えなかった。）[l][er]

[chara_show name="otaku" face="sad" pos="center" time="500"]

#otaku
あの夜、悪魔に"彼の好み"と言われて、私は薬を飲みました[l][er]

#otaku
でも、私が飲んだ理由は、"最初の被験者になりたいから"だと、自分では思っています[l][er]

#otaku
好意が、理由だったのか。研究欲が、理由だったのか[l][er]

#otaku
……わからないんです。測れないので[l][er]

#otaku
心拍は、上がります。でも、それは、緊張でも、恐怖でも、上がる[l][er]

#otaku
"好き"だけを取り出して、測る方法が、ない[l][er]

#otaku
測れないものの存在を、私は、証明できない[l][er]

#protagonist
……証明できないと、ないのと同じか[l][er]

#otaku
私にとっては。……ずっと、そうやって生きてきました[l][er]

（心拍計の数字が、九十一に上がった。）[l][er]
（理香は、それを、困った顔で、見ていた。）[l][er]

[jump target="otaku_04"]

; ================================================================================
; 第4話「二本目」
; ================================================================================
*otaku_04
[chara_hide_all]
[bg storage="science_prep_room.webp" time="1000"]
[playbgm storage="bgm_isolation.mp3"]

（その週の金曜。夜。）[l][er]

[if exp="f.otaku_help"]
（観察記録をつけに、理科準備室へ行った。）[l][er]
[else]
（凛から、連絡があった。"神崎さんが、今夜も泊まり込むそうです。様子を、見てきてもらえませんか"。）[l][er]
[endif]

（ドアの隙間から、声が、聞こえた。）[l][er]

[chara_show name="otaku" face="default" pos="right" time="1000"]
[chara_show name="akuma" face="default" pos="left" time="1000"]
[playbgm storage="bgm_devil.mp3"]

#akuma
——だから、言ったでしょ。君なら、興味あるって[l][er]

#otaku
……ボトル番号は[l][er]

#akuma
17。君専用だよ[l][er]

（悪魔の前足に、小さな瓶。）[l][er]
（一本目と同じ形。中身の色だけが、少し、暗い。）[l][er]

#akuma
二本目。飲めば、作用の全部を、内側から観測できる[l][er]

#akuma
三十年前の報告書の、"続き"を書けるのは、君だけ[l][er]

#akuma
それにね。測れないノイズ——"好き"とか、"怖い"とか——そういうのも、全部消える[l][er]

#akuma
もう、証明できないもので、悩まなくていいよ。完璧な研究者になれる[l][er]

#otaku
……[l][er]

#otaku
……記録は、取れますか。飲んだあとも[l][er]

#akuma
取れるよ。むしろ、正確になる。主観が、入らなくなるから[l][er]

（理香の手が、瓶に、伸びかけた。）[l][er]

#protagonist
理香[l][er]

[chara_show name="otaku" face="surprised" pos="right" time="500"]

#otaku
……！　どうして[l][er]

#akuma
やあ。いいところに来たね[l][er]

#akuma
ちょうど、彼女の研究計画の話をしてたんだ。飲むかどうかは、彼女次第だけど[l][er]

（理香は、瓶を見ていた。）[l][er]
（三十年前の紀要を見つけたときと、同じ目で。）[l][er]

#otaku
……&f.main_nameさん。止めないでください[l][er]

#otaku
これは、私にしかできない研究なんです[l][er]

（——何を、言えばいい。）[l][er]

[glink target="otaku_04_refuse" text="「測れないままでいい。その記録は、俺がつける」"]
[glink target="otaku_04_accept" text="「……お前の研究だ。お前が決めろ」"]
[s]

*otaku_04_refuse
#protagonist
測れないままでいい[l][er]

#otaku
……[l][er]

#protagonist
お前の"好き"が測れないなら、俺が記録する[l][er]

#protagonist
心拍が上がったとか、そういうのじゃない。お前が、何に笑って、何に困って、何を怖がったか[l][er]

#protagonist
全部、俺が書く。主観で[l][er]

#otaku
……主観は、データとして、信頼性が——[l][er]

#protagonist
低くていい[l][er]

#protagonist
お前が二本目を飲んだら、その記録は、どこにも書けなくなる[l][er]

#protagonist
"感情表出の平板化"。一行で、終わりだ[l][er]

#protagonist
俺は、そんな一行のために、お前を記録してたんじゃない[l][er]

[chara_show name="otaku" face="crying" pos="right" time="500"]

#otaku
……[l][er]

#otaku
……今、心拍、測ってないのに[l][er]

#otaku
わかります。すごく、上がってる[l][er]

#otaku
……これ、緊張ですか。恐怖ですか[l][er]

#protagonist
知らない。お前が決めろ[l][er]

#otaku
……ずるい人ですね[l][er]

（理香は、瓶から、手を引いた。）[l][er]
（そして、ゆっくりと、眼鏡を外して、目を拭いた。）[l][er]

#otaku
……返却します[l][er]

#otaku
前例がないのは、魅力的です。でも、"前例がない"のは、こっちも同じなので[l][er]

[chara_show name="akuma" face="smile" pos="left" time="500"]

#akuma
……ふうん。返品か[l][er]

#akuma
十七番は、欠番になるね。いいよ。ゲームは、まだ続いてるしね[l][er]

[chara_hide name="akuma" time="1000"]

（影は、消えた。）[l][er]

[eval exp="f.otaku_refused = true"]
[jump target="otaku_05"]

*otaku_04_accept
#protagonist
……お前の研究だ。お前が決めろ[l][er]

（言った瞬間に、間違えた、とわかった。）[l][er]

[chara_show name="otaku" face="sad" pos="right" time="500"]

#otaku
……はい。そうですね[l][er]

#otaku
あなたは、いつも、私の研究を、尊重してくれる[l][er]

#otaku
……今は、止めてほしかったのかもしれません。わかりませんけど。測れないので[l][er]

（彼女は、瓶を取って、ラベルの番号を、ノートに書き写した。）[l][er]
（"No.17　摂取時刻：21時04分"）[l][er]

#protagonist
——待て！[l][er]

（遅かった。）[l][er]

[jump target="otaku_ending_bad"]

; ================================================================================
; 第5話「事例二」
; ================================================================================
*otaku_05
[chara_hide_all]
[bg storage="science_prep_room.webp" time="1000"]
[playbgm storage="bgm_daily.mp3"]

（一週間後。）[l][er]

[chara_show name="otaku" face="default" pos="center" time="1000"]

#otaku
二本目の研究は、中止しました[l][er]

#otaku
代わりに、別の研究を始めます[l][er]

#protagonist
別の？[l][er]

#otaku
"事例二"の、その後です[l][er]

#otaku
記録を削除した人。二本目を飲まなかった人。その人が、どう生きたか[l][er]

#otaku
私たちにとって、一番必要なデータは、たぶん、そっちなので[l][er]

[chara_show name="seitokai" face="default" pos="left" time="800"]

#seitokai
三十年前の卒業生名簿を、生徒会の書庫から出してきました[l][er]

[chara_show name="gyaru" face="smile" pos="right" time="800"]

#gyaru
あたし、OGのSNS、片っ端から当たってる！　"筋肉"で検索したら、それっぽい人いたよ！[l][er]

（同好会の全員が、少しずつ、手伝ってくれた。）[l][er]

（そして、三日後。）[l][er]

[chara_hide_all]
[chara_show name="otaku" face="surprised" pos="center" time="1000"]

#otaku
……返事が、来ました[l][er]

（美咲が見つけたアカウント。五十歳くらいの女性。）[l][er]
（プロフィール写真は、子どもと、旦那さんらしき人と、三人で笑っている写真。）[l][er]
（——その腕は、今でも、驚くほど、太かった。）[l][er]

#otaku
"ボトル02です。懐かしい"[l][er]

#otaku
"二本目は、飲みませんでした。飲もうとしたとき、隣にいた人が、止めてくれたので"[l][er]

#otaku
"今、その人と、結婚して二十五年です"[l][er]

#otaku
"体は、戻りませんでした。でも、戻らなくてよかったと、今は思っています"[l][er]

#otaku
"後輩さんへ。悪魔には、よろしく言わなくていいです"[l][er]

（理香は、画面を、長いあいだ、見ていた。）[l][er]

[chara_show name="otaku" face="smile" pos="center" time="500"]

#otaku
……n＝1です。統計的には、何も言えません[l][er]

#otaku
でも——[l][er]

#otaku
私、この一例を、一生、信じると思います[l][er]

[jump target="otaku_06"]

; ================================================================================
; 告白前夜：悪魔の味見
; ================================================================================
*otaku_06
[chara_hide_all]
[bg storage="rooftop_night.webp" time="1000"]
[playbgm storage="bgm_devil.mp3"]

（その夜。屋上。）[l][er]

[chara_show name="akuma" face="default" pos="center" time="1000"]

#akuma
やあ。今の君、どんな味？[l][er]

#protagonist
……02番の人のこと、知ってたのか[l][er]

#akuma
もちろん。あの子は、僕が負けた最初の一人だ[l][er]

#akuma
……三十年ぶりだよ。二本目を、二回も返品されるの[l][er]

#akuma
ねえ。理香の願いは、"最初の被験者になりたい"だった[l][er]

#akuma
でも、あの子、もう、最初じゃなくなったね。前例が、見つかっちゃった[l][er]

#protagonist
……それでも、あいつは、最初になるよ[l][er]

#protagonist
自分の気持ちを、測らずに信じる、っていう実験の[l][er]

#akuma
ふうん[l][er]

[chara_show name="akuma" face="smile" pos="center" time="500"]

#akuma
じゃあ、その論文の共著者が誰になるのか——楽しみにしてるよ[l][er]

[chara_hide name="akuma" time="1000"]

（影は、消えた。）[l][er]

[jump target="otaku_07"]

; ================================================================================
; 第6話「共著」
; ================================================================================
*otaku_07
[chara_hide_all]
[bg storage="science_prep_room.webp" time="1000"]
[playbgm storage="bgm_romance.mp3"]

（一週間後。夜の理科準備室。）[l][er]

[chara_show name="otaku" face="default" pos="center" time="1000"]

#otaku
論文を、書きました[l][er]

（理香が、ホチキスで留めた紙の束を、差し出した。）[l][er]
（表紙には——"悪魔の薬に関する観察報告　付・二本目を飲まないための手引き"。）[l][er]

#otaku
科学部紀要の、第五十一号に載せます。三十年後の、誰かのために[l][er]

#otaku
それで——著者欄が、まだ、空欄なんです[l][er]

#protagonist
お前の名前だろ[l][er]

#otaku
私の名前は、書きます。問題は、その隣です[l][er]

[chara_show name="otaku" face="blush" pos="center" time="500"]

#otaku
この報告の、後半の記録は、全部、あなたの主観です[l][er]

#otaku
私が、何に笑って、何に困って、何を怖がったか[l][er]

#otaku
……それを書いた人を、共著者に入れないのは、研究倫理に反します[l][er]

#otaku
それから——[l][er]

#otaku
私、あの夜から、ずっと考えていました。心拍の上昇の理由[l][er]

#otaku
結論が、出ました。測らずに、出しました[l][er]

#otaku
あなたが、好きです[l][er]

#otaku
……共著者に、なってくれますか[l][er]

[glink target="otaku_ending_good" text="「共著にしよう。この先の分も、ずっと」"]
[glink target="otaku_ending_normal" text="「……記録係のままで、いさせてくれ」"]
[s]

; ================================================================================
; GOOD END「n＝2」
; ================================================================================
*otaku_ending_good
#protagonist
共著にしよう[l][er]

#protagonist
この先の分も、ずっと。……俺も、お前が好きだ[l][er]

[chara_show name="otaku" face="surprised" pos="center" time="500"]

#otaku
……[l][er]

#otaku
……今、心拍計、つけておけばよかった[l][er]

#protagonist
測るな[l][er]

#otaku
……はい。測りません[l][er]

[chara_show name="otaku" face="smile" pos="center" time="500"]

（理香は、ペンを取って、著者欄に、二つの名前を書いた。）[l][er]
（自分の名前と、俺の名前。）[l][er]
（書き終わってから、少しだけ、字が震えていることに、二人で気づいて、笑った。）[l][er]

[chara_hide_all]
[bg storage="rooftop_night.webp" time="1000"]
[playbgm storage="bgm_devil.mp3"]

[chara_show name="akuma" face="smile" pos="center" time="1000"]

#akuma
——はい、ゲーム終了。君の勝ち[l][er]

#akuma
約束どおり、ご祝儀を一口だけ[l][er]

（悪魔の前足が、胸に、ちょんと触れた。）[l][er]
（何かが、ひとかけら、持っていかれた。）[l][er]
（——たぶん、震えた字を見て笑った瞬間の、その端っこ）[l][er]

#akuma
……うん。測れない味だ。僕にも、成分はわからない[l][er]

#akuma
三十年ぶりの、負けの味。じゃあね。もう、来ないよ[l][er]

[chara_hide name="akuma" time="1000"]

[chara_hide_all]
[bg storage="science_prep_room.webp" time="1000"]
[playbgm storage="bgm_ending.mp3"]

（数ヶ月後。）[l][er]

[bg storage="events/otaku_scienceroom.webp" time="1500"]

（科学部紀要・第五十一号は、図書室の書庫の、一番下の段に収められた。）[l][er]
（第十二号の、隣に。）[l][er]

#otaku
……&f.main_nameさん。今日の記録、つけましたか[l][er]

#protagonist
つけた。"様子：ずっと、こっちを見てた"[l][er]

#otaku
……主観が強すぎます[l][er]

#protagonist
共著者の権限だ[l][er]

#otaku
……ふふ。はい[l][er]

（神崎理香。）[l][er]
（何でも測りたかった女の子は、）[l][er]
（今、測らなくていいものを、ひとつ、信じている。）[l][er]

（GOOD END ——「n＝2」）[l][er]
[s]

; ================================================================================
; NORMAL END「記録係」
; ================================================================================
*otaku_ending_normal
#protagonist
……記録係のままで、いさせてくれ[l][er]

[chara_show name="otaku" face="sad" pos="center" time="500"]

#otaku
……[l][er]

#protagonist
お前の気持ちを、ちゃんと記録したい。でも、自分の気持ちのほうは、まだ、書ける自信がない[l][er]

#otaku
……そうですか[l][er]

#otaku
データ不足、ということですね[l][er]

[chara_show name="otaku" face="smile" pos="center" time="500"]

#otaku
わかりました。著者欄は、私の単著で出します[l][er]

#otaku
謝辞に、あなたの名前を入れます。"記録係"として[l][er]

#otaku
……追加データが揃ったら、改訂版を出しますから。覚悟しておいてください[l][er]

[chara_hide_all]
[bg storage="rooftop_night.webp" time="1000"]
[playbgm storage="bgm_devil.mp3"]

[chara_show name="akuma" face="default" pos="center" time="1000"]

#akuma
……保留、か[l][er]

#akuma
二本目は飲まなかった。でも、"本物"にも、ならなかった[l][er]

#akuma
僕はお腹が空いたまま。……まあ、改訂版、待つとするよ[l][er]

[chara_hide name="akuma" time="1000"]

[chara_hide_all]
[bg storage="science_prep_room.webp" time="1000"]
[playbgm storage="bgm_daily.mp3"]

（数ヶ月後。）[l][er]

（俺は、今も、"被験者R・観察記録"をつけている。）[l][er]
（ノートは、三冊目になった。）[l][er]

[chara_show name="otaku" face="smile" pos="center" time="1000"]

#otaku
今日の"様子"は？[l][er]

#protagonist
"新しい仮説を思いついて、うるさかった"[l][er]

#otaku
……正確です[l][er]

（改訂版の締め切りは、まだ、決まっていない。）[l][er]

（NORMAL END ——「記録係」）[l][er]
[s]

; ================================================================================
; BAD END「No.17」
; ================================================================================
*otaku_ending_bad
[playbgm storage="bgm_despair.mp3"]

（彼女は、一息に、飲んだ。）[l][er]

[chara_hide_all]
[bg storage="devil_space.webp" time="1500"]

（世界から、音が消えた。）[l][er]

（白衣が、背中から、裂けた。）[l][er]
（肩が、腕が、もう一段、ふくれあがる。）[l][er]

[status stage="stage2"]
[chara_show name="otaku" face="default" pos="center" time="2000"]

（——そして、それよりも、先に。）[l][er]
（眼鏡の奥の、あの、中から光るものが、消えた。）[l][er]

#otaku
……摂取後、三十秒。筋組織の再肥大を確認[l][er]

#otaku
感情表出——なし。心拍、毎分六十二。安定しています[l][er]

#otaku
……ああ。こういうことでしたか[l][er]

#otaku
とても、静かです[l][er]

#protagonist
理香……！[l][er]

#otaku
&f.main_nameさん。記録係は、もう、不要です[l][er]

#otaku
主観は、ノイズなので[l][er]

[chara_show name="akuma" face="smile" pos="left" time="1000"]

#akuma
——はい、ゲーム終了[l][er]

#akuma
じゃ、約束どおり。——頂きます[l][er]

（悪魔の前足が、俺の胸に、触れた。）[l][er]
（熱が、引いていく。）[l][er]
（悔しさが。怖さが。観察記録の、"様子"の欄に書いてきた言葉が。）[l][er]
（順番に、消えて——）[l][er]

[chara_hide_all]
[bg storage="black.webp" time="2000"]

（……。）[l][er]

[bg storage="science_prep_room.webp" time="1500"]
[playbgm storage="bgm_isolation.mp3"]

（数ヶ月後。）[l][er]

（科学部紀要・第五十一号には、"事例三"の報告が載った。）[l][er]
（著者は、神崎理香。被験者も、神崎理香。）[l][er]
（とても正確で、とても短い報告だった。）[l][er]

（俺は、それを、図書室で読んだ。）[l][er]
（よく書けている、と思った。）[l][er]
（それ以外は、何も、思わなかった。）[l][er]

（BAD END ——「No.17」）[l][er]
[s]
