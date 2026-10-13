; route: 不良（九条冴）
; 第3話の一週間後から。冴は同好会の外部協力者で、主人公とは朝の電車で会う。
*start
[jump target="furyo_01"]

; ================================================================================
; 第1話「空いた座席」
; ================================================================================
*furyo_01
[chara_hide_all]
[bg storage="train_interior.webp" time="1000"]
[playbgm storage="bgm_daily.mp3"]

（朝。七時四十二分発の、各駅停車。）[l][er]

（屋上で悪魔に答えてから、俺はこの電車に乗るようになった。）[l][er]
（いつもより、一本早い電車。）[l][er]
（——九条冴が、乗っている電車。）[l][er]

[chara_show name="furyo" face="default" pos="right" time="1000"]

（彼女は、いつもドアの横に立っている。）[l][er]

（そして、彼女の周りだけ、席が空いている。）[l][er]

（混んでいるのに。立っている人がいるのに。）[l][er]
（彼女の前の長い座席には、誰も、座らない。）[l][er]

#protagonist
（……一週間前より、空いてる）[l][er]

（理由は、わかっている。）[l][er]
（黒いコートの肩が、ドアの幅を、半分、ふさいでいる。）[l][er]
（"近づくと殴られる"——その噂に、今は、見た目が追いついてしまった。）[l][er]

（俺は、空いた座席の、彼女にいちばん近い端に、座った。）[l][er]

#furyo
……[l][er]

#furyo
またか[l][er]

#protagonist
おはよう[l][er]

#furyo
……おはよ[l][er]

（返事はする。目は、窓の外のまま。）[l][er]
（それが、この一週間で、変わったことだった。）[l][er]

#furyo
あんたさ[l][er]

#protagonist
ん[l][er]

#furyo
毎朝それやるの、やめたら[l][er]

#protagonist
それ？[l][er]

#furyo
わざわざ、隣に座るやつ[l][er]

#furyo
周り、見てみなよ[l][er]

（見なくても、わかる。）[l][er]
（何人かが、スマホ越しに、こっちを見ている。）[l][er]
（"あの化け物の隣に座ってるやつ"。）[l][er]

#furyo
悪魔が言ってた。"近づかれないを極めたら、わざわざ近づいてくる人がわかる"って[l][er]

#furyo
……わかったよ。あんただった[l][er]

#protagonist
……[l][er]

#furyo
でも、聞いとく[l][er]

[chara_show name="furyo" face="angry" pos="right" time="500"]

（初めて、彼女がこっちを向いた。）[l][er]

#furyo
それ、"責任"でやってんの？[l][er]

#furyo
自分の願いのせいで、あたしがこうなったから。だから、せめて隣に座ってやろう、って[l][er]

#furyo
——そういうのなら、いらない[l][er]

（電車が、揺れた。）[l][er]

（彼女の指が、つり革を握り直す。）[l][er]
（金属の輪が、小さく、軋んだ。）[l][er]

[glink target="furyo_01_a" text="「責任もある。でも、それだけじゃない」"]
[glink target="furyo_01_b" text="「……責任だ。俺がやったことだから」"]
[s]

*furyo_01_a
[eval exp="f.furyo_honest = true"]

#protagonist
責任も、ある[l][er]

#protagonist
でも、それだけなら、同好会で会えば済む[l][er]

#protagonist
わざわざ一本早い電車に乗る理由には、ならない[l][er]

#furyo
……[l][er]

[chara_show name="furyo" face="flustered" pos="right" time="500"]

#furyo
……は？[l][er]

#protagonist
電車で初めて目が合ったとき、そらさなかったのは——責任じゃなかっただろ。まだ何も起きてなかった[l][er]

#furyo
……[l][er]

（彼女は、窓の外に、顔を戻した。）[l][er]
（耳だけが、赤かった。）[l][er]

#furyo
……バカじゃないの[l][er]

[jump target="furyo_01_end"]

*furyo_01_b
#protagonist
……責任だ[l][er]

#protagonist
俺がやったことだから。それは、ごまかしたくない[l][er]

#furyo
……そ[l][er]

[chara_show name="furyo" face="default" pos="right" time="500"]

#furyo
正直なのは、嫌いじゃない[l][er]

#furyo
でも——[l][er]

（彼女は、少しだけ、俺から離れた。）[l][er]
（座席一個ぶん。）[l][er]

#furyo
責任で隣に座られるのは、"近づかれない"より、ちょっとだけ寒い[l][er]

（言い返す言葉が、なかった。）[l][er]

[jump target="furyo_01_end"]

*furyo_01_end
（次の駅で、彼女は降りた。）[l][er]
（ホームに降りたあと、一度だけ、振り返った。）[l][er]

[chara_hide name="furyo" time="500"]

#protagonist
（……放課後、同好会に来る日だ）[l][er]

（俺は、手のひらの汗を、ズボンで拭いた。）[l][er]

[jump target="furyo_02"]

; ================================================================================
; 第2話「外部協力者」
; ================================================================================
*furyo_02
[chara_hide_all]
[bg storage="gym.webp" time="1000"]
[playbgm storage="bgm_daily.mp3"]

（放課後。体育館の隅。筋肉同好会の、活動日。）[l][er]

（冴は、週に二回、ここに来る。）[l][er]
（他校の生徒が入るために、凛が毎回、来校者届を出している。）[l][er]

[chara_show name="kakutogi" face="default" pos="left" time="800"]
[chara_show name="furyo" face="default" pos="right" time="800"]

#kakutogi
九条。今日こそ、手合わせしろ[l][er]

#furyo
……やだ[l][er]

#kakutogi
なぜだ。お前、強いだろう[l][er]

#furyo
強いから、やなの[l][er]

#kakutogi
……意味がわからん[l][er]

[chara_show name="gyaru" face="smile" pos="center" time="800"]

#gyaru
はいはい、響ステイ。冴ちゃん困ってんじゃん[l][er]

#gyaru
てか冴ちゃん、写真一枚撮らせてよ。その肩、絶対バズる[l][er]

#furyo
……もっとやだ[l][er]

#gyaru
えー[l][er]

（同好会の中では、冴は、少しだけ、喋る。）[l][er]
（全員が、同じくらい"変"だからだ。）[l][er]
（ここにいる限り、誰も彼女から、席一個ぶん離れない。）[l][er]

[chara_hide_all]
[chara_show name="seitokai" face="default" pos="center" time="800"]

#seitokai
&f.main_nameさん。少し、いいですか[l][er]

#protagonist
ああ[l][er]

#seitokai
九条さんの学校から、こちらの学校に問い合わせがありました[l][er]

#protagonist
……問い合わせ？[l][er]

#seitokai
"御校の生徒が、うちの九条に何かを飲ませたという噂がある"と[l][er]

#protagonist
……[l][er]

#seitokai
担任の先生が対応しました。"そのような事実は確認されていない"と[l][er]

#seitokai
事実ではありますが、真実ではありません[l][er]

#protagonist
……向こうの学校で、九条は、どうなってる[l][er]

#seitokai
私には、わかりません[l][er]

#seitokai
ただ——ここに来る日、彼女はいつも、制服の袖に、上履きの跡をつけています[l][er]

（上履きの、跡。）[l][er]
（誰かが、蹴った跡。）[l][er]
（——蹴られても、彼女は、やり返していない。）[l][er]

[chara_hide_all]
[bg storage="station.webp" time="1000"]
[playbgm storage="bgm_sadness.mp3"]

（帰り道。駅のホーム。）[l][er]

[chara_show name="furyo" face="default" pos="center" time="1000"]

#protagonist
九条[l][er]

#furyo
なに[l][er]

#protagonist
袖[l][er]

#furyo
……[l][er]

（彼女は、袖を、手で払った。）[l][er]
（跡は、もう、ほとんど落ちていた。）[l][er]

#furyo
気づくなよ、そういうの[l][er]

#protagonist
誰にやられた[l][er]

#furyo
聞いてどうすんの[l][er]

#protagonist
……[l][er]

#furyo
殴り返せって？[l][er]

[chara_show name="furyo" face="sad" pos="center" time="500"]

#furyo
今のあたしが殴ったら、たぶん、相手、死ぬよ[l][er]

（冗談の、声じゃなかった。）[l][er]

#furyo
前の体のときでも、一回、やりすぎた[l][er]

#furyo
中学のとき。友達が、高校生に絡まれて。あたしが全員ぶっ飛ばして[l][er]

#furyo
——次の週、その子だけ、仕返しされた。あたしがいない時に[l][er]

#protagonist
……[l][er]

#furyo
千夏っていうの。それっきり、会ってない[l][er]

#furyo
あたしが近くにいると、周りが怪我する。だから、近づかれない方がいい[l][er]

#furyo
"噂"、訂正しなかったのは、そういうこと[l][er]

（電車が、来た。）[l][er]

#furyo
だからさ。あんたも——[l][er]

[if exp="f.furyo_honest"]
#furyo
……いや。いい。あんたは、どうせ明日も座るんでしょ[l][er]

#protagonist
座る[l][er]

#furyo
……知ってる[l][er]

（ドアが閉まる直前、彼女は、ほんの少しだけ、笑った。）[l][er]
[else]
#furyo
あんたも、責任で座るくらいなら、もう座んなくていい[l][er]

#protagonist
……[l][er]

（ドアが閉まった。）[l][er]
（俺は、ホームに残った。）[l][er]
（——次の朝も、同じ電車に乗ろう、と、それだけを決めた。）[l][er]
[endif]

[jump target="furyo_03"]

; ================================================================================
; 第3話「化け物」
; ================================================================================
*furyo_03
[chara_hide_all]
[bg storage="classroom.webp" time="1000"]
[playbgm storage="bgm_tension.mp3"]

（三日後。昼休み。）[l][er]

[chara_show name="gyaru" face="angry" pos="center" time="800"]

#gyaru
ねえ、これ見て[l][er]

（美咲が、スマホを突き出した。）[l][er]

（短い動画。駅のホーム。黒いコートの背中。）[l][er]
（"隣町の化け物女、ついに薬キメた説"——というタイトル。）[l][er]
（再生数は、四万。）[l][er]

#gyaru
これ上げたアカウント、中学のときに冴ちゃんと揉めた連中らしい。コメ欄で自慢してる[l][er]

#gyaru
"今日の放課後、駅裏で決着つける"って[l][er]

#protagonist
……決着[l][er]

#gyaru
あたしが通報しても、こういうの、消えるまで三日かかんの。知ってる[l][er]

#gyaru
……どうする？[l][er]

[chara_hide_all]
[bg storage="street_evening.webp" time="1000"]
[playbgm storage="bgm_tension.mp3"]

（放課後。駅の裏の、細い道。）[l][er]

（走ってきた。息が、上がっている。）[l][er]
（俺の体は、普通だ。七人みたいには、走れない。）[l][er]

[chara_show name="furyo" face="angry" pos="center" time="800"]

（——間に合った、のかどうか。）[l][er]

（冴が、壁際に立っている。）[l][er]
（その前に、男が五人。スマホを構えたのが、二人。）[l][er]

#不良A
ほら来た、化け物[l][er]

#不良B
撮れ撮れ。殴ったら炎上、殴らなかったらダサい。どっちでもいいわ[l][er]

#不良A
なあ九条。千夏ちゃん、元気？[l][er]

[chara_show name="furyo" face="angry" pos="center" time="300"]

（冴の拳が、握られた。）[l][er]

（音がした。）[l][er]
（彼女の拳の中で、自分の指の関節が、鳴る音。）[l][er]

（——あれが振られたら、終わる。）[l][er]
（相手が、じゃない。冴が、だ。）[l][er]

#protagonist
九条！[l][er]

#furyo
——来んな！[l][er]

（俺は、彼女と男たちの間に、入った。）[l][er]
（入っただけだ。それ以外、俺には、何もできない。）[l][er]

#不良A
なんだお前[l][er]

#protagonist
……撮るなら、俺を撮れ[l][er]

#protagonist
この子に薬を飲ませたのは、俺だ。それで、いいだろ[l][er]

#不良B
は？　何言ってんのこいつ[l][er]

（胸を、突き飛ばされた。）[l][er]
（背中が、冴の体に、ぶつかった。）[l][er]
（——壁みたいに、硬かった。でも、震えていた。）[l][er]

#furyo
……どいて[l][er]

#protagonist
どかない[l][er]

#furyo
どいてよ。あんたが殴られる[l][er]

#protagonist
殴られてもいい。お前が殴るよりは、ずっといい[l][er]

#furyo
……っ[l][er]

（遠くで、サイレンが鳴った。）[l][er]
（走る前に、美咲に頼んで、駅に連絡してもらっていた。）[l][er]

#不良A
……チッ。行くぞ[l][er]

（男たちは、スマホを下ろして、散っていった。）[l][er]

[chara_show name="furyo" face="sad" pos="center" time="800"]

#furyo
……[l][er]

#protagonist
……怪我、ないか[l][er]

#furyo
それ、こっちの台詞[l][er]

（彼女は、俺の胸のあたりを、見ていた。）[l][er]
（突き飛ばされたところ。シャツに、靴の跡がついている。）[l][er]

#furyo
……袖の跡と、おそろいだ[l][er]

#protagonist
笑えないな[l][er]

#furyo
笑ってない[l][er]

（彼女は、俺のシャツの跡を、指で払おうとして——）[l][er]
（途中で、手を止めた。）[l][er]

#furyo
……触ったら、壊しそう[l][er]

[jump target="furyo_04"]

; ================================================================================
; 第4話「二本目」
; ================================================================================
*furyo_04
[chara_hide_all]
[bg storage="park_night.webp" time="1000"]
[playbgm storage="bgm_isolation.mp3"]

（その夜。）[l][er]

（眠れなくて、コンビニに行った帰り。）[l][er]
（駅の近くの公園に、黒いコートが、見えた。）[l][er]

[chara_show name="furyo" face="sad" pos="right" time="1000"]

（冴が、ベンチの前に、立っていた。）[l][er]

（ベンチの背もたれの、鉄のパイプが——）[l][er]
（握った形のまま、ぐにゃりと、曲がっていた。）[l][er]

#furyo
……見んなよ[l][er]

#protagonist
……九条[l][er]

#furyo
座ろうとしただけ。昼間のこと、思い出して、ちょっと、力入っただけ[l][er]

#furyo
それで、これ[l][er]

（彼女は、自分の右手を、見ていた。）[l][er]
（怖いものを見る目で。）[l][er]

#furyo
あたし、昼間、殴る寸前だった[l][er]

#furyo
あんたが来なかったら、殴ってた。絶対[l][er]

#furyo
……そしたら、あいつら、どうなってた？[l][er]

（答えられなかった。）[l][er]

[chara_show name="akuma" face="default" pos="left" time="1000"]
[playbgm storage="bgm_devil.mp3"]

#akuma
答えてあげようか[l][er]

#furyo
……！[l][er]

#akuma
三人は病院。一人は、たぶん、もう歩けない[l][er]

#akuma
で、君は、二度と誰にも近づかれない。今度は、噂じゃなくて、事実で[l][er]

#protagonist
……何しに来た[l][er]

#akuma
やだなあ。お届けものだよ[l][er]

（悪魔の前足に、小さな瓶が、ぶら下がっていた。）[l][er]
（一本目と、同じ形。中身の色だけが、少し、暗い。）[l][er]

#akuma
二本目[l][er]

#akuma
これを飲めば、もう揺れない。怒らない。手も、震えない[l][er]

#akuma
誰に何を言われても、何も感じないから、誰も殴らない[l][er]

#akuma
——"近づかれない"のも、もう、痛くないよ[l][er]

#furyo
……[l][er]

（冴の目が、瓶を見ていた。）[l][er]
（駅のホームで、"近づかれない方がいい"と言ったときと、同じ目だった。）[l][er]

#furyo
……それ飲んだら、誰も、怪我しない？[l][er]

#akuma
しないね。君が、誰のことも気にしなくなるから[l][er]

#furyo
……千夏みたいなこと、もう、起きない？[l][er]

#akuma
起きない[l][er]

（悪魔は、瓶を、彼女の手の届くところに、置いた。）[l][er]

#akuma
飲むかどうかは、君次第[l][er]

（彼女の手が、動いた。）[l][er]

（——何か、言わないと。）[l][er]

[glink target="furyo_04_refuse" text="「痛いままでいい。俺が、隣に座る」"]
[glink target="furyo_04_accept" text="「……お前が、決めろ」"]
[s]

*furyo_04_refuse
#protagonist
痛いままでいい[l][er]

[chara_show name="furyo" face="surprised" pos="right" time="500"]

#furyo
……え[l][er]

#protagonist
怒るのも、震えるのも、そのままでいい[l][er]

#protagonist
今日、お前は殴らなかった。殴りたかったのに、止まった[l][er]

#protagonist
それができるのは、怖いって思えるやつだけだ[l][er]

#protagonist
それを捨てたら、"誰も殴らない"んじゃなくて——"誰のことも、どうでもいい"になる[l][er]

#furyo
……[l][er]

#protagonist
怖いなら、俺が隣に座る。毎朝。お前が手を止められなくなったら、俺がまた、間に入る[l][er]

#furyo
……あんた、普通の体じゃん[l][er]

#protagonist
知ってる[l][er]

#furyo
あたしが本気で振ったら、あんたも、壊れるよ[l][er]

#protagonist
でも、お前は、振らないだろ[l][er]

（長い、沈黙。）[l][er]

（それから——彼女は、瓶から、手を引いた。）[l][er]

[chara_show name="furyo" face="crying" pos="right" time="500"]

#furyo
……いらない[l][er]

#furyo
いらない。持って帰って[l][er]

[chara_show name="akuma" face="smile" pos="left" time="500"]

#akuma
……ふうん[l][er]

#akuma
いいよ。ゲームは、まだ続いてるしね[l][er]

[chara_hide name="akuma" time="1000"]

（瓶ごと、影は消えた。）[l][er]

（曲がったベンチの前で、冴は、しばらく、泣いていた。）[l][er]
（声を出さずに。肩だけで。）[l][er]

（俺は、曲がっていない方の端に、座った。）[l][er]

#furyo
……座れんの、それ[l][er]

#protagonist
ギリギリな[l][er]

#furyo
……バカ[l][er]

[eval exp="f.furyo_refused = true"]
[jump target="furyo_05"]

*furyo_04_accept
#protagonist
……お前が、決めろ[l][er]

（言った瞬間に、間違えた、とわかった。）[l][er]

[chara_show name="furyo" face="sad" pos="right" time="500"]

#furyo
……そっか[l][er]

#furyo
そうだよね。あたしのことだし[l][er]

（彼女は、ずっと、一人で決めてきた。）[l][er]
（噂を訂正しないことも。誰にも近づかないことも。）[l][er]
（——だから、たぶん、いちばん欲しかったのは、）[l][er]
（"決めろ"じゃなかった。）[l][er]

#furyo
もう、誰も怪我させたくないから[l][er]

（彼女の手が、瓶を、取った。）[l][er]

#protagonist
——待て[l][er]

（遅かった。）[l][er]

[jump target="furyo_ending_bad"]

; ================================================================================
; 第5話「千夏」
; ================================================================================
*furyo_05
[chara_hide_all]
[bg storage="gym.webp" time="1000"]
[playbgm storage="bgm_daily.mp3"]

（一週間後。）[l][er]

（あの動画は、消えていた。）[l][er]
（美咲が、三日間、毎晩、通報し続けた結果だった。）[l][er]

[chara_show name="gyaru" face="smile" pos="left" time="800"]

#gyaru
あとさ。これ、言っていいのかわかんないんだけど[l][er]

#gyaru
動画のコメ欄で、一人だけ、ずっと冴ちゃんのこと庇ってる子がいたの[l][er]

#gyaru
アカウント名、"chinatsu_0412"[l][er]

#protagonist
……千夏[l][er]

[chara_show name="otaku" face="default" pos="right" time="800"]

#otaku
本人確認は、取れています。DMで、二回、やりとりしました[l][er]

#otaku
"会いたい。でも、冴が嫌がるなら、いい"——とのことです[l][er]

#protagonist
……お前ら[l][er]

#gyaru
勝手にごめんね。でもさ[l][er]

#gyaru
"近づかれない"子に近づくの、一人じゃ、無理じゃん[l][er]

[chara_hide_all]
[bg storage="station.webp" time="1000"]
[playbgm storage="bgm_sadness.mp3"]

（土曜日。駅のホーム。）[l][er]

[chara_show name="furyo" face="default" pos="right" time="1000"]

#furyo
……ほんとに、来んの[l][er]

#protagonist
来るって言ってた[l][er]

#furyo
あたしのこと見たら、たぶん、帰るよ[l][er]

#furyo
こんな体になってるなんて、知らないし[l][er]

#protagonist
動画で、見てるはずだ。見たうえで、庇ってた[l][er]

#furyo
……[l][er]

（電車が、着いた。）[l][er]
（降りてきた人の中に、小柄な女の子が、一人。）[l][er]

#千夏
……冴？[l][er]

[chara_show name="furyo" face="surprised" pos="right" time="500"]

#furyo
……千夏[l][er]

#千夏
冴だ。ほんとに、冴だ[l][er]

#千夏
すごい。おっきくなったね[l][er]

#furyo
……引かないの[l][er]

#千夏
引くよ。ちょっとは[l][er]

#千夏
でも、冴が中学のとき、私の前に立ってくれたときも、ちょっと引いたもん。強すぎて[l][er]

#furyo
……[l][er]

#千夏
あのあと、私がやられたの、冴のせいだと思ってるでしょ[l][er]

#千夏
違うよ。悪いのは、やった人たち[l][er]

#千夏
冴は、守ってくれた人。私は、ずっと、お礼が言いたかった[l][er]

#千夏
なのに冴、次の日から、私のこと避けるんだもん[l][er]

[chara_show name="furyo" face="crying" pos="right" time="500"]

#furyo
……だって[l][er]

#furyo
だって、あたしが近くにいたら、また——[l][er]

#千夏
うん。だから、今日は、私から近づいた[l][er]

（千夏は、冴の前まで歩いて、その太い腕に、抱きついた。）[l][er]
（腕が、一周も、回っていなかった。）[l][er]

#千夏
……かったい[l][er]

#furyo
……うるさい[l][er]

（冴は、泣きながら、抱き返さなかった。）[l][er]
（抱き返したら、壊してしまう気がして。）[l][er]
（——だから、ただ、ゆっくり、千夏の頭に、手のひらを乗せた。）[l][er]

（その手は、少しも、震えていなかった。）[l][er]

[jump target="furyo_06"]

; ================================================================================
; 告白前夜：悪魔の味見
; ================================================================================
*furyo_06
[chara_hide_all]
[bg storage="rooftop_night.webp" time="1000"]
[playbgm storage="bgm_devil.mp3"]

（その夜。屋上。）[l][er]

[chara_show name="akuma" face="default" pos="center" time="1000"]

#akuma
やあ。今の君、どんな味？[l][er]

#protagonist
……勝手に味見すんな[l][er]

#akuma
いいじゃない。二本目、返品されたんだから。少しくらい[l][er]

#akuma
……ねえ。あの子の願いは、"近づかれない"だった[l][er]

#akuma
君は、それを叶えさせなかった。毎朝、隣に座って[l][er]

#akuma
契約違反じゃないけど、契約妨害だよ、それ[l][er]

#protagonist
近づいたのは、俺だけじゃない[l][er]

#protagonist
美咲も、理香も、千夏も。……あいつが、近づかせたんだ[l][er]

#akuma
ふうん[l][er]

[chara_show name="akuma" face="smile" pos="center" time="500"]

#akuma
じゃあ、最後の質問は、君にしかできないね[l][er]

#akuma
"隣に座る人"と、"隣にいる人"は、違うよ[l][er]

#akuma
どっちになるのか、明日の電車で、決めておいで[l][er]

[chara_hide name="akuma" time="1000"]

（影は、消えた。）[l][er]

[jump target="furyo_07"]

; ================================================================================
; 第6話「七時四十二分」
; ================================================================================
*furyo_07
[chara_hide_all]
[bg storage="train_interior.webp" time="1000"]
[playbgm storage="bgm_romance.mp3"]

（月曜日。七時四十二分発。）[l][er]

（冴の前の座席は、相変わらず、空いていた。）[l][er]
（でも、一週間前より、少しだけ、人が近い。）[l][er]
（あの動画が消えて、代わりに、千夏が上げた一枚の写真が、ちょっとだけ回ったせいだ。）[l][er]
（"中学からの親友。めっちゃ強いけど、めっちゃ優しい"。）[l][er]

[chara_show name="furyo" face="default" pos="center" time="1000"]

（俺は、いつもの端に、座った。）[l][er]

#furyo
……おはよ[l][er]

#protagonist
おはよう[l][er]

#furyo
……[l][er]

（電車が、揺れる。）[l][er]

#furyo
ねえ[l][er]

#protagonist
ん[l][er]

#furyo
あたしたちってさ、何なの[l][er]

#furyo
毎朝、あんたが座って。あたしが立ってて[l][er]

#furyo
同好会では、"外部協力者"と、"発起人の一人"[l][er]

#furyo
……それだけ？[l][er]

（答える言葉を、探した。）[l][er]

（言葉にすると、消える気がした。）[l][er]
（でも——"言葉にしなよ"と、最初に俺の背中を押したのは、あの悪魔だった。）[l][er]
（あいつの思い通りに、なるのは癪だ。）[l][er]
（だから、俺は——）[l][er]

[glink target="furyo_ending_good" text="隣の席を空けて、「座れよ」と言う"]
[glink target="furyo_ending_normal" text="拳を、軽く差し出す"]
[s]

; ================================================================================
; GOOD END「隣にいる」
; ================================================================================
*furyo_ending_good
#protagonist
座れよ[l][er]

（隣の席を、手で、示した。）[l][er]

[chara_show name="furyo" face="surprised" pos="center" time="500"]

#furyo
……は？[l][er]

#protagonist
毎朝、俺が隣に座ってた。今日は、お前が座れ[l][er]

#protagonist
責任とか、願いとか、関係ない。俺が、お前に隣にいてほしい[l][er]

#furyo
……[l][er]

#furyo
……あたしが座ったら、席、二人ぶん使うよ[l][er]

#protagonist
いい[l][er]

#furyo
肩、当たるよ[l][er]

#protagonist
いい[l][er]

#furyo
……周り、また見るよ[l][er]

#protagonist
見せとけ[l][er]

[chara_show name="furyo" face="blush" pos="center" time="500"]

（彼女は、座った。）[l][er]
（隣に。）[l][er]

（座席が、少し、沈んだ。）[l][er]
（肩が、当たった。硬くて、あたたかかった。）[l][er]

#furyo
……戻さなくて、いい？　肩[l][er]

#protagonist
戻さない[l][er]

#furyo
……そ[l][er]

（電車が、彼女の降りる駅に着いた。）[l][er]

（——彼女は、降りなかった。）[l][er]

#protagonist
……遅刻するぞ[l][er]

#furyo
一回くらい、いい。あんたの駅まで、乗ってく[l][er]

#furyo
……冴でいいよ。九条じゃなくて[l][er]

#protagonist
……冴[l][er]

#furyo
……ん[l][er]

[chara_hide_all]
[bg storage="rooftop_night.webp" time="1000"]
[playbgm storage="bgm_devil.mp3"]

[chara_show name="akuma" face="smile" pos="center" time="1000"]

#akuma
——はい、ゲーム終了。君の勝ち[l][er]

#protagonist
……来ると思った[l][er]

#akuma
約束だからね。ご祝儀を、一口だけ[l][er]

（悪魔の前足が、俺の胸に、ちょんと触れた。）[l][er]
（何かが、ほんのひとかけら、持っていかれた。）[l][er]
（——たぶん、今朝、隣の席が沈んだ瞬間の、あの感じの、端っこ）[l][er]

#akuma
……うん。甘い。思ってたより、ずっと[l][er]

#akuma
"近づかれない"を極めた子の、"隣"の味だ[l][er]

#akuma
じゃあね。もう、来ないよ[l][er]

[chara_hide name="akuma" time="1000"]

[chara_hide_all]
[bg storage="train_interior.webp" time="1000"]
[playbgm storage="bgm_ending.mp3"]

（数ヶ月後。）[l][er]

（七時四十二分発の電車は、相変わらず、混んでいる。）[l][er]
（冴の前の座席は、もう、空いていない。）[l][er]

（俺と、冴が、座っているから。）[l][er]

[chara_hide_all]
[bg storage="events/furyo_station.webp" time="1500"]

#furyo
……ねえ[l][er]

#protagonist
ん[l][er]

#furyo
最初にあんたと目が合ったとき、なんで、そらさなかったの[l][er]

#protagonist
……かっこいいと思ったから[l][er]

#furyo
……体、変わる前だよ[l][er]

#protagonist
変わる前から[l][er]

#furyo
……そ[l][er]

（彼女は、窓の外を向いた。）[l][er]
（耳だけが、赤かった。）[l][er]
（——肩は、ずっと、当たったままだった。）[l][er]

（九条冴。）[l][er]
（近づかれないことを選んだ女の子は、）[l][er]
（今、俺の隣に、座っている。）[l][er]

（GOOD END ——「隣にいる」）[l][er]
[s]

; ================================================================================
; NORMAL END「拳の約束」
; ================================================================================
*furyo_ending_normal
（俺は、言葉の代わりに、拳を、軽く差し出した。）[l][er]

[chara_show name="furyo" face="default" pos="center" time="500"]

#furyo
……何それ[l][er]

#protagonist
仲間の、挨拶[l][er]

#furyo
……あんた、殴り合いしたことないでしょ[l][er]

#protagonist
ない[l][er]

#furyo
……そ[l][er]

（彼女は、少しだけ迷ってから、自分の拳を、俺の拳に、合わせた。）[l][er]
（触れるだけ。壊さないように、そっと。）[l][er]

[chara_show name="furyo" face="smile" pos="center" time="500"]

#furyo
……悪くない[l][er]

#furyo
"それだけ"でも、悪くない。今は[l][er]

（次の駅で、彼女は降りた。）[l][er]
（ホームで振り返って、もう一度、拳を上げた。）[l][er]

[chara_hide_all]
[bg storage="rooftop_night.webp" time="1000"]
[playbgm storage="bgm_devil.mp3"]

[chara_show name="akuma" face="default" pos="center" time="1000"]

#akuma
……保留、か[l][er]

#akuma
二本目は飲まなかった。でも、"本物"にも、ならなかった[l][er]

#akuma
僕はお腹が空いたまま。君は、勝ってないまま[l][er]

#protagonist
……悪いか[l][er]

#akuma
ううん。待つのは、得意だから[l][er]

#akuma
電車、明日も乗るんでしょ。続き、楽しみにしてるよ[l][er]

[chara_hide name="akuma" time="1000"]

[chara_hide_all]
[bg storage="gym.webp" time="1000"]
[playbgm storage="bgm_daily.mp3"]

（数ヶ月後。）[l][er]

（筋肉同好会の活動日。冴は、週に二回、来る。）[l][er]

[chara_show name="kakutogi" face="smile" pos="left" time="800"]
[chara_show name="furyo" face="smile" pos="right" time="800"]

#kakutogi
九条。今日こそ、手合わせだ[l][er]

#furyo
……いいよ。寸止めなら[l][er]

#kakutogi
！　本当か[l][er]

#furyo
あんたなら、壊れなさそうだし[l][er]

（体育館の真ん中で、二人が向き合う。）[l][er]
（みんなが、周りを囲む。）[l][er]
（冴の周りに、席一個ぶんの隙間は、もう、ない。）[l][er]

（俺たちは、恋人じゃない。）[l][er]
（でも、毎朝、同じ電車に乗っている。）[l][er]
（——今は、それでいい。）[l][er]

（NORMAL END ——「拳の約束」）[l][er]
[s]

; ================================================================================
; BAD END「静かな電車」
; ================================================================================
*furyo_ending_bad
[playbgm storage="bgm_despair.mp3"]

（彼女は、一息に、飲んだ。）[l][er]

[chara_hide_all]
[bg storage="devil_space.webp" time="1500"]

（世界から、音が消えた。）[l][er]

（コートの縫い目が、裂けた。）[l][er]
（肩が、背中が、もう一段、ふくれあがる。）[l][er]

[status stage="stage2"]
[chara_show name="furyo" face="default" pos="center" time="2000"]

（——そして、それよりも、先に。）[l][er]
（目から、震えが、消えた。）[l][er]

#furyo
……ああ[l][er]

#furyo
静か[l][er]

#protagonist
九条……九条！[l][er]

#furyo
大丈夫。もう、誰も殴らない[l][er]

#furyo
殴りたいって、思わないから[l][er]

#furyo
……あんたのことも、もう、どうでもいい[l][er]

（責める声じゃなかった。）[l][er]
（事実を、読み上げる声だった。）[l][er]

[chara_show name="akuma" face="smile" pos="left" time="1000"]

#akuma
——はい、ゲーム終了[l][er]

#protagonist
戻せ[l][er]

#akuma
無理だよ。一本目より、ずっと深いところを書き換えたから[l][er]

#akuma
じゃ、約束どおり。——頂きます[l][er]

（悪魔の前足が、俺の胸に、触れた。）[l][er]
（熱が、引いていく。）[l][er]
（悔しさが。怖さが。毎朝、隣に座っていた理由が。）[l][er]
（順番に、消えて——）[l][er]

[chara_hide_all]
[bg storage="black.webp" time="2000"]

（……。）[l][er]

[bg storage="train_interior.webp" time="1500"]
[playbgm storage="bgm_isolation.mp3"]

（数ヶ月後。七時四十二分発。）[l][er]

（ドアの横に、大きな、黒いコートの女の子が、立っている。）[l][er]
（周りの席は、空いている。）[l][er]
（彼女は、それを、少しも気にしていない。）[l][er]

（俺は、つり革につかまって、窓の外を見ている。）[l][er]
（あの子の隣に座ろうとは、思わない。）[l][er]
（——なぜ、前は座っていたんだろう、と、ときどき思う。）[l][er]

（BAD END ——「静かな電車」）[l][er]
[s]
