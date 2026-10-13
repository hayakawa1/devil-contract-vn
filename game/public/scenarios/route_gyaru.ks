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

（昼休み。屋上。）[l][er]

[chara_show name="gyaru" face="smile" pos="center" time="1000"]

#gyaru
見て見て見て[l][er]

（美咲が、スマホを顔の前に突き出してきた。近すぎて、何も見えない。）[l][er]

#protagonist
近い[l][er]

#gyaru
いいから！　ほら！[l][er]

（画面には、体育館で撮った、彼女の写真。）[l][er]
（両腕を曲げて、力こぶを作っている。ピースの代わりに。）[l][er]
（同好会の"看板"として、一週間前に上げた一枚だ。）[l][er]

#gyaru
十万いいね。十万だよ？　前のあたし、最高で三百だったんだけど[l][er]

#gyaru
フォロワー、一週間で四万増えた。DMも、毎日百件くらい来る[l][er]

#protagonist
……すごいな[l][er]

#gyaru
でしょ？　あの猫、言ってたじゃん。"別ジャンルで、一位"って[l][er]

#gyaru
マジで一位。"筋肉JK"で検索したら、あたしが一番上に出てくんの[l][er]

（笑っている。いつもより、大きな声で。）[l][er]
（——でも、スマホを持つ手が、ずっと、画面を更新し続けている。）[l][er]
（話しながら。笑いながら。親指だけが、別の生き物みたいに。）[l][er]

#gyaru
でさ。お願いがあんだけど[l][er]

#gyaru
今夜から、毎晩、配信やろうと思ってて。体育館、凛先輩に許可もらったの[l][er]

#gyaru
カメラ、やってくんない？　三脚だと、いい角度撮れないんだよね[l][er]

#gyaru
あんたが一番、あたしの筋肉の"いいとこ"わかってそうだし[l][er]

#protagonist
……どういう意味だ[l][er]

#gyaru
そういう意味だよ、"彼の好み"くん[l][er]

（からかう声。でも、目は、本気だった。）[l][er]

[glink target="gyaru_01_a" text="「わかった。撮る」"]
[glink target="gyaru_01_b" text="「……毎晩は、やめとけ」"]
[s]

*gyaru_01_a
[eval exp="f.gyaru_camera = true"]

#protagonist
わかった。撮る[l][er]

[chara_show name="gyaru" face="smile" pos="center" time="500"]

#gyaru
マジ？　やった！[l][er]

#gyaru
じゃあ今日、七時ね。遅れたら、あんたの寝顔上げるから[l][er]

#protagonist
持ってないだろ、そんなの[l][er]

#gyaru
結衣ちゃんに頼めば、小学生のときのやつ、あると思う[l][er]

#protagonist
やめろ[l][er]

（彼女は、笑いながら、屋上を出ていった。）[l][er]
（——階段の途中で、また、スマホを開く音がした。）[l][er]

[jump target="gyaru_02"]

*gyaru_01_b
#protagonist
……毎晩は、やめとけ[l][er]

[chara_show name="gyaru" face="angry" pos="center" time="500"]

#gyaru
は？　なんで[l][er]

#protagonist
今、お前、俺と喋りながら、ずっと更新してる[l][er]

#gyaru
……してないし[l][er]

#protagonist
してる。今も[l][er]

（彼女は、親指を、止めた。）[l][er]
（止めた指が、少しだけ、震えていた。）[l][er]

#gyaru
……うっざ[l][er]

#gyaru
いいよ。三脚でやる。あんたに頼んだあたしがバカだった[l][er]

#gyaru
……やっと見つけてもらえたのに。邪魔すんなら、あんたも"アンチ"だからね[l][er]

（彼女は、屋上を出ていった。）[l][er]
（扉が、閉まる音が、少しだけ、強かった。）[l][er]

[jump target="gyaru_02"]

; ================================================================================
; 第2話「可愛い、が来ない」
; ================================================================================
*gyaru_02
[chara_hide_all]
[bg storage="gym.webp" time="1000"]
[playbgm storage="bgm_tension.mp3"]

（三日後。夜の体育館。）[l][er]

[if exp="f.gyaru_camera"]
（俺は、美咲のスマホを構えていた。）[l][er]
（リングライトの光の中で、彼女が、ポーズを取る。）[l][er]
[else]
（俺は、体育館の入り口に立っていた。）[l][er]
（"見るだけなら"と、凛が入れてくれた。）[l][er]
（三脚の前で、美咲が、一人でポーズを取っている。）[l][er]
[endif]

[chara_show name="gyaru" face="smile" pos="center" time="1000"]

#gyaru
はーい、今日もやってくよー！　同接、三千！　えぐ！[l][er]

#gyaru
リクエスト来てる。"背中見せて"？　いいよー[l][er]

（流れていくコメントが、画面の端に、滝みたいに落ちていく。）[l][er]

（"でかすぎw"）[l][er]
（"これ加工？"）[l][er]
（"ゴリラ"）[l][er]
（"すげえ、どうやったらこうなるの"）[l][er]
（"化け物で草"）[l][er]

#gyaru
化け物はひどくない？　あはは[l][er]

（笑っている。）[l][er]
（コメントを読み上げて、ツッコんで、笑っている。）[l][er]

（一時間。）[l][er]
（配信が終わった瞬間——彼女の顔から、全部、抜け落ちた。）[l][er]

[chara_show name="gyaru" face="sad" pos="center" time="500"]

#gyaru
……ねえ[l][er]

#protagonist
ん[l][er]

#gyaru
今日のコメント、何件か、知ってる？[l][er]

#protagonist
……いや[l][er]

#gyaru
八千二百件。全部読んだ[l][er]

#gyaru
"すごい"が千四百。"でかい"が九百。"化け物"系が六百くらい[l][er]

#gyaru
……"可愛い"は、四件だった[l][er]

#protagonist
……[l][er]

#gyaru
笑うよね。あたし、"可愛い"のレースから降りるために飲んだのに[l][er]

#gyaru
降りたら、降りたで、"可愛い"が欲しくなってんの[l][er]

#gyaru
唯一には、なれたよ。"化け物枠"の、唯一[l][er]

[if exp="f.gyaru_camera"]
#gyaru
……あんたさ。カメラ越しに、ずっとあたし見てたじゃん[l][er]

#gyaru
どうだった。……正直に[l][er]

#protagonist
……カメラ越しのお前は、ずっと笑ってた[l][er]

#protagonist
カメラを下ろしたら、今の顔だった。俺は、今のほうが、見てて痛い[l][er]

#gyaru
……そういうの、ズルい[l][er]
[else]
#gyaru
……あんた、なんで来たの。"やめとけ"って言ったくせに[l][er]

#protagonist
やめとけって言ったから、来た[l][er]

#gyaru
……意味わかんない[l][er]

#gyaru
……でも、終わったあと、誰もいない体育館で一人でこれ読むの、ちょっと無理だったから[l][er]

#gyaru
……来てくれて、たすかった。今日だけ[l][er]
[endif]

[jump target="gyaru_03"]

; ================================================================================
; 第3話「検証動画」
; ================================================================================
*gyaru_03
[chara_hide_all]
[bg storage="classroom.webp" time="1000"]
[playbgm storage="bgm_tension.mp3"]

（一週間後。朝の教室。）[l][er]

（美咲の席が、空いていた。）[l][er]

[chara_show name="otaku" face="default" pos="center" time="800"]

#otaku
これです[l][er]

（理香が、タブレットを差し出した。）[l][er]

（動画のタイトルは——"【検証】話題の筋肉JK、薬物使用の可能性について"。）[l][er]
（再生数、六十万。）[l][er]

#otaku
内容は、科学的にはでたらめです。ただ——[l][er]

#otaku
後半で、彼女の中学時代の写真と、今の写真が、並べられています[l][er]

#otaku
それから、制服から、学校名が特定されています[l][er]

#protagonist
……[l][er]

[chara_show name="seitokai" face="default" pos="right" time="800"]

#seitokai
今朝から、学校の電話が鳴り続けています[l][er]

#seitokai
"薬を使う部活があるのか"と[l][er]

#seitokai
同好会の活動は、しばらく、自粛するよう、指示が出ました[l][er]

#protagonist
星野は[l][er]

#seitokai
……昨夜、配信の最後に、"みんなごめん"と言って、アカウントを非公開にしたそうです[l][er]

#seitokai
今朝は、電話に出ません[l][er]

[chara_hide_all]
[chara_show name="osananajimi" face="sad" pos="left" time="800"]
[chara_show name="kakutogi" face="angry" pos="right" time="800"]

#osananajimi
美咲ちゃん、昨日、あたしにLINEくれたの。"同好会、潰したらごめん"って[l][er]

#kakutogi
……あいつのせいじゃない。動画を作ったやつのせいだ[l][er]

#osananajimi
うん。でも、美咲ちゃん、自分のせいだと思ってる[l][er]

#osananajimi
……&f.main_nameくん。探しに行って[l][er]

#osananajimi
今、美咲ちゃんが一番"見つけてほしい"の、たぶん、あんただから[l][er]

[jump target="gyaru_04"]

; ================================================================================
; 第4話「二本目」
; ================================================================================
*gyaru_04
[chara_hide_all]
[bg storage="park_night.webp" time="1000"]
[playbgm storage="bgm_isolation.mp3"]

（夜。駅の向こうの、公園。）[l][er]

（美咲の家の近く。小さい頃、よくここで写真を撮っていたと、前に言っていた。）[l][er]

[chara_show name="gyaru" face="crying" pos="right" time="1000"]

（ベンチの上で、膝を抱えて、スマホを見ていた。）[l][er]
（画面の光だけが、彼女の顔を照らしている。）[l][er]

#protagonist
……星野[l][er]

#gyaru
……見ないで[l][er]

#gyaru
今、可愛くないから。……前から、だけど[l][er]

#protagonist
……アカウント、非公開にしたんじゃないのか[l][er]

#gyaru
したよ。でも、エゴサは、やめらんない[l][er]

#gyaru
"ドーピング女"。"学校ごと終わり"。"整形前、普通にブスで草"[l][er]

#gyaru
……中学のときの写真、誰が流したんだろ。あたし、あれ、自分でも消したのに[l][er]

[chara_show name="akuma" face="default" pos="left" time="1000"]
[playbgm storage="bgm_devil.mp3"]

#akuma
読むの、やめられないよね[l][er]

#gyaru
……出たな、猫[l][er]

#akuma
悪魔だよ。……ねえ、君、ほんとはわかってるでしょ[l][er]

#akuma
君が欲しいのは、"いいね"じゃなくて、"見つけてもらうこと"[l][er]

#akuma
でも、画面の向こうには、見つけてくれる人なんていない。数字があるだけ[l][er]

#akuma
だからね。これ[l][er]

（悪魔の前足に、小さな瓶。）[l][er]
（一本目と同じ形。中身の色だけが、少し、暗い。）[l][er]

#akuma
二本目。これを飲めば、何を書かれても、何も感じない[l][er]

#akuma
"ブス"も、"化け物"も、"可愛い"も、全部、同じ数字に見える[l][er]

#akuma
永遠に笑って、永遠に配信できる。完璧なインフルエンサーだよ[l][er]

#akuma
もう、エゴサで泣かなくていい[l][er]

#gyaru
……[l][er]

（美咲の目が、瓶を見ていた。）[l][er]
（スマホの画面を見るのと、同じ目で。）[l][er]

#gyaru
……それ飲んだら、同好会のみんなに迷惑かけたことも、平気になる？[l][er]

#akuma
なるよ。気にならなくなる[l][er]

（悪魔は、瓶を、ベンチの上に置いた。）[l][er]

#akuma
飲むかどうかは、君次第[l][er]

（——今、言わなきゃいけない。）[l][er]
（画面の外から、言わなきゃいけない。）[l][er]

[glink target="gyaru_04_refuse" text="スマホを取り上げて「画面の外のお前を、見ろ」"]
[glink target="gyaru_04_accept" text="「……お前が、楽になれるなら」"]
[s]

*gyaru_04_refuse
（俺は、彼女の手から、スマホを、取り上げた。）[l][er]

[chara_show name="gyaru" face="surprised" pos="right" time="500"]

#gyaru
ちょっ——返して[l][er]

#protagonist
返さない[l][er]

#protagonist
画面の外のお前を、見ろ。俺が、今、見てる[l][er]

#protagonist
目が腫れてて、鼻が赤くて、髪がぐちゃぐちゃで、ベンチに体育座りしてる[l][er]

#gyaru
……最悪じゃん[l][er]

#protagonist
可愛いよ[l][er]

#gyaru
……は[l][er]

#protagonist
可愛い。五件目だ。数えとけ[l][er]

#gyaru
……っ[l][er]

#protagonist
"すごい"も"でかい"も、俺は言わない。それはもう、八千件も来てる[l][er]

#protagonist
俺は、画面に映らないほうのお前に、"可愛い"って言う。それしか、俺にはできない[l][er]

[chara_show name="gyaru" face="crying" pos="right" time="500"]

#gyaru
……ばか[l][er]

#gyaru
ばか。そういうの、今、言うな[l][er]

#gyaru
……飲めなくなるじゃん[l][er]

（彼女は、ベンチの上の瓶を、手の甲で、押しやった。）[l][er]

#gyaru
……いらない。猫、持って帰って[l][er]

[chara_show name="akuma" face="smile" pos="left" time="500"]

#akuma
……ふうん。返品か[l][er]

#akuma
いいよ。ゲームは、まだ続いてるしね[l][er]

[chara_hide name="akuma" time="1000"]

（影は、消えた。）[l][er]

（美咲は、俺の手から、スマホを取り返そうとしなかった。）[l][er]
（代わりに、俺の袖を、指先でつまんだ。）[l][er]

#gyaru
……今、何件目？[l][er]

#protagonist
何が[l][er]

#gyaru
"可愛い"[l][er]

#protagonist
……五件目[l][er]

#gyaru
……六件目、明日までに言って[l][er]

[eval exp="f.gyaru_refused = true"]
[jump target="gyaru_05"]

*gyaru_04_accept
#protagonist
……お前が、楽になれるなら[l][er]

（言った瞬間に、間違えた、とわかった。）[l][er]

[chara_show name="gyaru" face="sad" pos="right" time="500"]

#gyaru
……そっか[l][er]

#gyaru
あんたも、そう思うんだ。そのほうがいいって[l][er]

#gyaru
……だよね。今のあたし、めんどくさいもんね[l][er]

（違う、と言う前に。）[l][er]
（彼女は、瓶を取って——）[l][er]
（いつも配信でやるみたいに、カメラに向かって、ピースした。）[l][er]

#protagonist
——待て！[l][er]

（遅かった。）[l][er]

[jump target="gyaru_ending_bad"]

; ================================================================================
; 第5話「カウンター、オフ」
; ================================================================================
*gyaru_05
[chara_hide_all]
[bg storage="gym.webp" time="1000"]
[playbgm storage="bgm_tension.mp3"]

（三日後。夜の体育館。）[l][er]

（凛が、教頭に頭を下げて、一晩だけ、使用許可を取ってくれた。）[l][er]

[chara_show name="gyaru" face="default" pos="center" time="1000"]

#gyaru
……配信、するね[l][er]

#gyaru
アカウント、公開に戻す。で、一回だけ、ちゃんと喋る[l][er]

#protagonist
怖くないか[l][er]

#gyaru
怖いよ。めっちゃ怖い[l][er]

#gyaru
だから、あんた、カメラやって。今日は、三脚じゃ無理[l][er]

（俺は、スマホを構えた。）[l][er]
（画面の中の美咲は、いつもより、少しだけ、小さく見えた。）[l][er]

[chara_hide_all]
[bg storage="events/gyaru_stream.webp" time="1500"]
[playbgm storage="bgm_romance.mp3"]

#gyaru
……こんばんは。美咲です[l][er]

#gyaru
動画のこと、知ってる人、多いと思う。学校にも、いっぱい迷惑かけた[l][er]

#gyaru
この体になった理由は、言えない。言っても、たぶん信じてもらえない[l][er]

#gyaru
でも、ひとつだけ。誰かに無理やりやらされたんじゃない[l][er]

#gyaru
あたしが、自分で選んだ体です[l][er]

#gyaru
……それと、もうひとつ[l][er]

#gyaru
今日から、いいねの数、見るのやめます。カウンター、オフにした[l][er]

#gyaru
数字じゃなくて、来てくれた人の顔、見たいから[l][er]

（コメントが、流れる。）[l][er]
（"逃げんな"。"どうせ薬だろ"。）[l][er]
（——そして。）[l][er]

（"美咲ちゃんのクラスの者です。この子、ほんとに頑張ってます"）[l][er]
（"同じ学校。体育館でいつも一番最後まで残ってる"）[l][er]
（"中学の写真のとき、私、隣にいました。そのときから可愛かったよ"）[l][er]

#gyaru
……っ[l][er]

（画面の端に、ひょい、と、人影が入ってきた。）[l][er]

#kakutogi
星野。私も映っていいか[l][er]

#osananajimi
あたしも！　美咲ちゃんの隣、あいてる？[l][er]

#otaku
この体の筋繊維構成について、十分ほど解説してもいいですか[l][er]

#gyaru
ちょ、なに、みんな——[l][er]

#seitokai
同好会の活動です。生徒会長として、許可します[l][er]

（画面が、筋肉で、いっぱいになった。）[l][er]
（美咲は、泣きながら、笑っていた。）[l][er]
（カメラ越しじゃなくても、ちゃんと、笑っていた。）[l][er]

[jump target="gyaru_06"]

; ================================================================================
; 告白前夜：悪魔の味見
; ================================================================================
*gyaru_06
[chara_hide_all]
[bg storage="rooftop_night.webp" time="1000"]
[playbgm storage="bgm_devil.mp3"]

（配信のあと。屋上。）[l][er]

[chara_show name="akuma" face="default" pos="center" time="1000"]

#akuma
やあ。今の君、どんな味？[l][er]

#protagonist
……味見すんな[l][er]

#akuma
いいじゃない。今日の配信、僕も見てたよ。同接一万二千[l][er]

#akuma
……ねえ。あの子の願いは、"唯一になりたい"だった[l][er]

#akuma
僕は、"化け物枠の唯一"にしてあげた。そういう契約だから[l][er]

#akuma
でも、今日の画面には、七人映ってた。唯一じゃなくなったのに、あの子、一番いい顔してた[l][er]

#protagonist
……唯一じゃなくても、見つけてもらえるって、わかったんだろ[l][er]

#akuma
ふうん[l][er]

[chara_show name="akuma" face="smile" pos="center" time="500"]

#akuma
じゃあ、最後に残ってるのは、"画面に映らない唯一"だけだね[l][er]

#akuma
それをあげられるのは、カメラを持ってた人だけだよ[l][er]

[chara_hide name="akuma" time="1000"]

（影は、消えた。）[l][er]

[jump target="gyaru_07"]

; ================================================================================
; 第6話「投稿しない一枚」
; ================================================================================
*gyaru_07
[chara_hide_all]
[bg storage="rooftop.webp" time="1000"]
[playbgm storage="bgm_romance.mp3"]

（一週間後。昼休み。屋上。）[l][er]

（同好会の自粛は、解けた。あの配信のあと、学校への電話は、応援のほうが多くなったらしい。）[l][er]

[chara_show name="gyaru" face="default" pos="center" time="1000"]

#gyaru
ねえ。一枚、撮って[l][er]

#protagonist
また配信用か[l][er]

#gyaru
ううん。投稿しないやつ[l][er]

#gyaru
あんたのスマホで撮って。あんたのスマホにだけ、残しといて[l][er]

（彼女は、フェンスの前に立った。）[l][er]
（力こぶも、作らない。ピースも、しない。）[l][er]
（ただ、立って、こっちを見ている。）[l][er]

[chara_show name="gyaru" face="blush" pos="center" time="500"]

#gyaru
……"可愛い"の、六件目、まだ聞いてないんだけど[l][er]

#gyaru
てか、あたし、数えるのやめたんだった。いいねも、"可愛い"も[l][er]

#gyaru
だから、今度は、数じゃなくて——中身で、言って[l][er]

#gyaru
あたしのこと、どう思ってんの[l][er]

[glink target="gyaru_ending_good" text="シャッターを切って「好きだ。画面の外でも、中でも」"]
[glink target="gyaru_ending_normal" text="シャッターを切って「……最高の被写体だよ」"]
[s]

; ================================================================================
; GOOD END「投稿しない一枚」
; ================================================================================
*gyaru_ending_good
（シャッターを、切った。）[l][er]

#protagonist
好きだ[l][er]

#protagonist
画面の外でも、中でも。数えてない分も、全部[l][er]

[chara_show name="gyaru" face="surprised" pos="center" time="500"]

#gyaru
……[l][er]

#gyaru
……今の、撮った？[l][er]

#protagonist
撮った[l][er]

#gyaru
見せて[l][er]

（画面を、見せた。）[l][er]
（フェンスの前の美咲は、目を丸くして、口が半開きで——）[l][er]
（今まで見たどの写真よりも、間抜けで、可愛かった。）[l][er]

[chara_show name="gyaru" face="smile" pos="center" time="500"]

#gyaru
……ぶっさ[l][er]

#gyaru
……絶対、投稿すんなよ。これ、あんた専用[l][er]

#protagonist
しない[l][er]

#gyaru
……あたしも、好き[l][er]

#gyaru
十万いいねより、こっちのほうが、ずっといい[l][er]

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
（——たぶん、シャッターを切った瞬間の、指先の熱の端っこ）[l][er]

#akuma
……うん。画面越しじゃない味。炭酸みたいにはじける[l][er]

#akuma
じゃあね。もう、来ないよ[l][er]

[chara_hide name="akuma" time="1000"]

[chara_hide_all]
[bg storage="gym.webp" time="1000"]
[playbgm storage="bgm_ending.mp3"]

（数ヶ月後。）[l][er]

（美咲は、今も、週に一回、配信をしている。）[l][er]
（カウンターは、オフのまま。）[l][er]
（カメラは、だいたい、俺が持っている。）[l][er]

[chara_show name="gyaru" face="smile" pos="center" time="1000"]

#gyaru
はい、今日はここまで！　またね！[l][er]

（配信が終わる。）[l][er]
（彼女の顔から、何も、抜け落ちない。）[l][er]

#gyaru
ねえ、今日の"可愛い"は？[l][er]

#protagonist
……三回言った[l][er]

#gyaru
足りない。あと二回[l][er]

（俺のスマホの、鍵のかかったフォルダには、投稿されない写真が、今日も一枚、増えた。）[l][er]

（星野美咲。）[l][er]
（"唯一"になりたかった女の子は、）[l][er]
（今、数えなくていいものを、手に入れた。）[l][er]

（GOOD END ——「投稿しない一枚」）[l][er]
[s]

; ================================================================================
; NORMAL END「最高の被写体」
; ================================================================================
*gyaru_ending_normal
（シャッターを、切った。）[l][er]

#protagonist
……最高の被写体だよ[l][er]

[chara_show name="gyaru" face="default" pos="center" time="500"]

#gyaru
……被写体、ね[l][er]

#gyaru
……ふーん[l][er]

#protagonist
怒ったか[l][er]

#gyaru
怒ってない。ちょっと、悔しいだけ[l][er]

[chara_show name="gyaru" face="smile" pos="center" time="500"]

#gyaru
いいよ。じゃあ、カメラマンとして、これからもよろしく[l][er]

#gyaru
いつか、"被写体"じゃない言葉、言わせてみせるから[l][er]

[chara_hide_all]
[bg storage="rooftop_night.webp" time="1000"]
[playbgm storage="bgm_devil.mp3"]

[chara_show name="akuma" face="default" pos="center" time="1000"]

#akuma
……保留、か[l][er]

#akuma
二本目は飲まなかった。でも、"本物"にも、ならなかった[l][er]

#akuma
僕はお腹が空いたまま。……まあ、あの子、しつこそうだしね。続きを待つよ[l][er]

[chara_hide name="akuma" time="1000"]

[chara_hide_all]
[bg storage="gym.webp" time="1000"]
[playbgm storage="bgm_daily.mp3"]

（数ヶ月後。）[l][er]

（美咲の配信には、ときどき、同好会の全員が出る。）[l][er]
（"筋肉同好会チャンネル"は、学校公認になった。凛が、また判子を押した。）[l][er]

[chara_show name="gyaru" face="smile" pos="center" time="1000"]

#gyaru
カメラマーン、今の角度、最高！[l][er]

#protagonist
はいはい[l][er]

（彼女は、カメラ越しに、こっちを見て笑う。）[l][er]
（たまに、カメラじゃなくて、俺を見て。）[l][er]

（NORMAL END ——「最高の被写体」）[l][er]
[s]

; ================================================================================
; BAD END「永遠の配信」
; ================================================================================
*gyaru_ending_bad
[playbgm storage="bgm_despair.mp3"]

（彼女は、ピースしたまま、一息に、飲んだ。）[l][er]

[chara_hide_all]
[bg storage="devil_space.webp" time="1500"]

（世界から、音が消えた。）[l][er]

（ジャケットの袖が、裂けた。）[l][er]
（肩が、腕が、脚が、もう一段、ふくれあがる。）[l][er]

[status stage="stage2"]
[chara_show name="gyaru" face="smile" pos="center" time="2000"]

（——そして、それよりも、先に。）[l][er]
（泣き腫らした目が、ぴたりと、乾いた。）[l][er]

#gyaru
……あ。すご[l][er]

#gyaru
エゴサしても、なんも感じない。"ブス"も"可愛い"も、同じ[l][er]

#gyaru
これで、ずっと配信できるね。ずっと笑ってられる[l][er]

#protagonist
星野……！[l][er]

#gyaru
あ、カメラ、もういいよ。三脚でいい[l][er]

#gyaru
あんたが撮っても、三脚が撮っても、同じだし[l][er]

[chara_show name="akuma" face="smile" pos="left" time="1000"]

#akuma
——はい、ゲーム終了[l][er]

#akuma
じゃ、約束どおり。——頂きます[l][er]

（悪魔の前足が、俺の胸に、触れた。）[l][er]
（熱が、引いていく。）[l][er]
（悔しさが。怖さが。カメラ越しに彼女を見ていたときの、あの痛みが。）[l][er]
（順番に、消えて——）[l][er]

[chara_hide_all]
[bg storage="black.webp" time="2000"]

（……。）[l][er]

[bg storage="classroom.webp" time="1500"]
[playbgm storage="bgm_isolation.mp3"]

（数ヶ月後。）[l][er]

（美咲のフォロワーは、百万人を超えた。）[l][er]
（毎晩、八時間、配信している。いつ見ても、同じ笑顔で。）[l][er]

（クラスの誰かが、スマホの画面を見せてくる。"これ、星野さんだよね"。）[l][er]
（"ああ"と答える。）[l][er]
（それ以上、何も、思わない。）[l][er]

（画面の中の彼女も、たぶん、何も、思っていない。）[l][er]

（BAD END ——「永遠の配信」）[l][er]
[s]
