; route: 幼なじみ
*start
[jump target="osananajimi_00"]

; source: 00_ルート開始.txt
*osananajimi_00
; ■ 幼なじみルート「帰れない家」
; テーマ：家族との関係 / アイデンティティ

; ================================================================================
; 第1話「玄関が狭い」
; ================================================================================

[bg storage="school_gate.webp" time="1000"]
[playbgm storage="bgm_daily.mp3"]

[chara_hide_all]

（Day2地獄の朝。筋肉化。）[l][er]
（幼なじみは、最初に俺の袖を引いた。）[l][er]

#osananajimi
……ねえ[l][er]

#protagonist
ん？[l][er]

#osananajimi
今日、帰り……一緒に来て[l][er]

#protagonist
家？[l][er]

#osananajimi
……うん。たぶん、やばい[l][er]

（彼女は笑ってる。いつもの調子を装ってる。）[l][er]
（でも、声が薄い。）[l][er]


; ================================================================================
; 第2話「帰宅」
; ================================================================================

[chara_hide_all]
[bg storage="street_evening.webp" time="1000"]
[playbgm storage="bgm_sadness.mp3"]

（家の前まで来た。普通の家。）[l][er]
（でも幼なじみの足が止まる。）[l][er]

#osananajimi
……ごめん[l][er]

#protagonist
何が[l][er]

#osananajimi
たぶん、怒られるの、あたしだけじゃない[l][er]

#protagonist
俺も？[l][er]

#osananajimi
巻き込みたくないけど……来てほしい[l][er]

#protagonist
来た[l][er]

（玄関の扉を開ける。）[l][er]


#mother
……は？[l][er]

（母親の声が、一段低い。）[l][er]

#mother
……誰？[l][er]

#osananajimi
……お母さん[l][er]

#mother
誰？ って聞いてるの[l][er]

（幼なじみは、黙った。）[l][er]
（筋肉があるせいじゃない。）[l][er]
（"娘"と認識してもらえてない。）[l][er]

#protagonist
……[l][er]

#mother
まさか、冗談でしょ。[l][er]
うちの子、どこ[l][er]

#osananajimi
……ここ[l][er]

#mother
……近寄らないで[l][er]

（言い方が、刺さる。）[l][er]


; ================================================================================
; ★ 分岐ポイントA：母親との和解方法
; ================================================================================

[glink target="osananajimi_01" text="正直に話す（真実ルート）"]
[glink target="osananajimi_02" text="嘘をつく（偽装ルート）"]
[s]


; ================================================================================
; 第3話「風呂場の鏡」（共通シーン）
; ================================================================================

*osananajimi_00_common_mirror
[chara_hide_all]
[bg storage="protagonist_room_night.webp" time="1000"]
[playbgm storage="bgm_isolation.mp3"]

（夜。俺の部屋。家に戻りづらい幼なじみは、鏡の前に立っていた。）[l][er]

#osananajimi
……笑える[l][er]

#protagonist
笑ってない[l][er]

#osananajimi
笑ってるよ。[l][er]
だってさ、あたしの体、別人じゃん[l][er]

#protagonist
……お前だろ[l][er]

#osananajimi
……わかんないよ[l][er]

（鏡の中の筋肉は、彼女の思春期を踏み潰すみたいに張っている。）[l][er]

#osananajimi
ねえ[l][er]

#protagonist
ん[l][er]

#osananajimi
……触ってもいい？[l][er]

#protagonist
どこを[l][er]

#osananajimi
……自分の腕[l][er]

（彼女が、自分の腕をそっと撫でる。）[l][er]
（強さが、怖さに変わる瞬間。）[l][er]

#osananajimi
これ、あたしの"努力"じゃない[l][er]

#osananajimi
なのに、強い[l][er]

#protagonist
……[l][er]

#osananajimi
ずるいよね[l][er]

#protagonist
ずるくない[l][er]

#osananajimi
ずるいよ。[l][er]
ずるいって思わないと、あたし壊れる[l][er]


（→ 次は「第4話：悪魔の影」へ続く）[l][er]

[jump target="osananajimi_03"]

; source: 分岐A_真実ルート.txt
*osananajimi_01
; ■ 幼なじみルート - 分岐A：真実ルート
; 選択肢「正直に話す」を選んだ場合

; ================================================================================

[chara_hide_all]
[bg storage="friend_house.webp" time="1000"]

#protagonist
……お母さん、落ち着いて[l][er]

#mother
落ち着いて？[l][er]
知らない男が娘のフリして家に入ってきて？[l][er]

#osananajimi
男じゃない……[l][er]

#mother
じゃあ何？[l][er]

#osananajimi
……私[l][er]

（母親は震えた。怒りじゃない。）[l][er]
（恐怖だ。）[l][er]

#mother
……病院[l][er]

#osananajimi
行く[l][er]

#mother
警察——[l][er]

#protagonist
待って！[l][er]

（俺の声で、空気が止まる。）[l][er]

#protagonist
昨日から、学校全体で起きてる[l][er]

#protagonist
原因不明の……体の変化[l][er]

#mother
……そんなの[l][er]

#protagonist
信じられないのはわかる[l][er]

#protagonist
でも、本人が一番怖い[l][er]

（幼なじみが、息を吸う。）[l][er]

#osananajimi
……お母さん[l][er]

#osananajimi
私、声……わかる？[l][er]

#mother
……[l][er]

#osananajimi
小学校の時。[l][er]
熱出したとき、氷枕作ってくれた[l][er]

#osananajimi
そのとき……[l][er]
"泣くな"じゃなくて、"泣いていい"って言った[l][er]

（母の目が揺れる。）[l][er]

#mother
……[l][er]

#mother
……あなた、本当に[l][er]

#osananajimi
うん[l][er]

（母は、崩れた。）[l][er]

#mother
……気持ち悪い、って思った[l][er]

#osananajimi
……[l][er]

#mother
ごめん。ごめん……[l][er]

（抱きしめようとして、止まる。）[l][er]
（筋肉があるからじゃない。）[l][er]
（怖いからだ。）[l][er]

#osananajimi
……いいよ。[l][er]
今、怖いの普通だよ[l][er]

（彼女の方が大人みたいだった。）[l][er]


; ================================================================================
; 第5話「母の言葉」
; ================================================================================

[chara_hide_all]
[bg storage="friend_house.webp" time="1000"]
[playbgm storage="bgm_daily.mp3"]

（母親が味噌汁を作っている。）[l][er]
（幼なじみは黙って座っている。）[l][er]

#mother
……学校は、休みなさい[l][er]

#osananajimi
……[l][er]

#mother
その姿で出るの、危ないから[l][er]

（"危ない"＝世間が、ではない。）[l][er]
（"私の世界が壊れるから"だ。）[l][er]

#osananajimi
……私、隠すの嫌だ[l][er]

#mother
わがまま言わないで[l][er]

（幼なじみの呼吸が荒くなる。）[l][er]

#protagonist
……[l][er]

（ここで主人公が口を挟むと、母は"外敵"として扱う。）[l][er]
（だから——）[l][er]

#protagonist
……お母さん[l][er]

#protagonist
一回だけでいい。[l][er]
娘さんの話、聞いてあげてください[l][er]

#mother
……私は聞いてる！[l][er]

#protagonist
……聞いてるのは、"安心できる話"です[l][er]

（母の手が止まる。）[l][er]

#mother
……[l][er]

#mother
……わたしだって、怖いのよ[l][er]

#osananajimi
……あたしも怖い[l][er]

（初めて、母娘の恐怖が並んだ。）[l][er]


（→ 次は「第3話：風呂場の鏡」へ）[l][er]
[jump target="osananajimi_00_common_mirror"]

; source: 分岐A_偽装ルート.txt
*osananajimi_02
; ■ 幼なじみルート - 分岐A：偽装ルート
; 選択肢「嘘をつく（双子設定など）」を選んだ場合

; ================================================================================

[chara_hide_all]
[bg storage="friend_house.webp" time="1000"]

#protagonist
……お母さん、落ち着いて[l][er]

#mother
落ち着けるわけないでしょ！[l][er]

#osananajimi
……[l][er]

#protagonist
（ここで正面突破すると、壊れる）[l][er]

#protagonist
……双子です[l][er]

#mother
……は？[l][er]

#protagonist
幼なじみの、双子の姉[l][er]

#mother
うちの子に双子なんて——[l][er]

#protagonist
……事情があって[l][er]

（幼なじみが、目を見開く。）[l][er]

#osananajimi
……う、うん[l][er]

（声が震える。）[l][er]

#mother
……冗談でしょ[l][er]

#protagonist
冗談じゃないです[l][er]

#protagonist
本人は今……体調が悪くて[l][er]

#protagonist
だから、俺が代わりに来た[l][er]

#mother
……[l][er]

（母親は、疑いながらも"信じたい形"を選ぶ。）[l][er]
（信じたいのは娘じゃなく、"安心できる物語"だ。）[l][er]

#mother
……とにかく、上がって[l][er]

（通った。）[l][er]

（でも——）[l][er]

（この嘘は、後で必ず牙を剥く。）[l][er]


; ================================================================================
; 第5話「嘘の代償」
; ================================================================================

[chara_hide_all]
[bg storage="protagonist_room_night.webp" time="1000"]
[playbgm storage="bgm_sadness.mp3"]

（部屋の中。）[l][er]

#osananajimi
……ねえ[l][er]

#protagonist
なんだ[l][er]

#osananajimi
あたし、誰になったの？[l][er]

#protagonist
……[l][er]

#osananajimi
双子の姉？[l][er]
そんな人、いないのに[l][er]

#protagonist
仕方なかった[l][er]

#osananajimi
うん……仕方ないよね[l][er]

（彼女は笑う。）[l][er]

#osananajimi
お母さんは、[l][er]
"あたし"じゃない人を信じたんだ[l][er]

#protagonist
……[l][er]

#osananajimi
嘘でよかったのかな[l][er]

#protagonist
よくない[l][er]

#osananajimi
……じゃあ、いつ本当を話す？[l][er]

#protagonist
……[l][er]

（答えられない。）[l][er]

（嘘の中で、彼女は消えていく。）[l][er]


; ================================================================================
後日：嘘の露見（バッドルート確定の場合）[l][er]
; ================================================================================

[chara_hide_all]
[bg storage="friend_house.webp" time="1000"]
[playbgm storage="bgm_tension.mp3"]

#mother
……ねえ[l][er]

#osananajimi
なに[l][er]

#mother
あなた、本当に双子？[l][er]

#osananajimi
……[l][er]

#mother
戸籍、調べたの[l][er]

（空気が凍る。）[l][er]

#mother
双子なんて、いない[l][er]

#mother
あなた、誰？[l][er]

#osananajimi
……[l][er]

（嘘が、壊れた。）[l][er]

#mother
出てって[l][er]

#osananajimi
……え[l][er]

#mother
出てけって言ってるの！[l][er]

（母の叫びが、彼女を追い出す。）[l][er]


[jump target="osananajimi_ending_bad"]

; ================================================================================
; ■ 幼なじみルート - 第4話「悪魔の影」
; テーマ：代償 / 変化への恐怖
; ================================================================================

*osananajimi_03
[chara_hide_all]
[bg storage="school_gate.webp" time="1000"]
[playbgm storage="bgm_tension.mp3"]

（数日が経った。）[l][er]

（幼なじみは、家を出て俺の家に泊まっている。）[l][er]

（母親との関係は、まだ修復されていない。）[l][er]

[chara_show name="osananajimi" face="default" pos="center" time="1000"]

#osananajimi
……ねえ[l][er]

#protagonist
ん？[l][er]

#osananajimi
あたし、このままどうなるのかな[l][er]

#protagonist
……[l][er]

#osananajimi
筋肉は——戻らないの？[l][er]

#protagonist
わからない[l][er]

#osananajimi
……だよね[l][er]

（彼女は、自分の腕を見た。）[l][er]

#osananajimi
悪魔は、何も言わなかった？[l][er]

#protagonist
いや——[l][er]

[chara_hide name="osananajimi" time="1000"]

; ================================================================================
*osananajimi_03_scene_2
; シーン2：悪魔の登場
; ================================================================================

[bg storage="school_gate.webp" time="1000"]
[playbgm storage="bgm_devil.mp3"]

[chara_show name="akuma" face="default" pos="left" time="1000"]

#akuma
呼んだ？[l][er]

#protagonist
！[l][er]

#osananajimi
……あんた[l][er]

#akuma
久しぶり。元気そうだね[l][er]

#osananajimi
元気なわけないでしょ[l][er]

#akuma
そう？筋肉はいい感じじゃない[l][er]

（悪魔は、にやりと笑う。）[l][er]

#osananajimi
……戻して[l][er]

#akuma
戻す？[l][er]

#osananajimi
元の体に。戻して[l][er]

#akuma
……[l][er]

（悪魔は、少し考えるふりをした。）[l][er]

#akuma
無理だね[l][er]

#osananajimi
……！[l][er]

#akuma
契約は契約[l][er]

#akuma
体は、元には戻らない[l][er]

#osananajimi
あたしは願ってない！[l][er]

#akuma
なら、そう言い切ればいい[l][er]

（悪魔の目が、冷たく光る。）[l][er]

#akuma
君の中に、ひとつもなかった？[l][er]

#akuma
強くなりたい、って声[l][er]

#osananajimi
……[l][er]

#akuma
僕が決めることじゃない[l][er]

#akuma
君が、自分で言えばいい[l][er]

（彼女は、何も言えなかった。）[l][er]

[chara_hide name="akuma" time="1000"]
[chara_hide_all]

; ================================================================================
*osananajimi_03_scene_3
; シーン3：本音
; ================================================================================

[bg storage="protagonist_room_night.webp" time="1000"]
[playbgm storage="bgm_sadness.mp3"]

（夜。俺の部屋。）[l][er]

[chara_show name="osananajimi" face="crying" pos="center" time="1000"]

#osananajimi
……ねえ[l][er]

#protagonist
ん[l][er]

#osananajimi
悪魔に、全部決められたくない[l][er]

#protagonist
……[l][er]

#osananajimi
でも[l][er]

#osananajimi
強くなりたいって、思ったことはある[l][er]

#protagonist
弱くないだろ[l][er]

#osananajimi
弱いよ[l][er]

（彼女は、膝を抱えた。）[l][er]

#osananajimi
いつも、誰かに守ってもらってる気がしてた[l][er]

#osananajimi
親に。友達に。あんたに[l][er]

#protagonist
……[l][er]

#osananajimi
一人じゃ何もできないって[l][er]

#osananajimi
そう思ってた[l][er]

#protagonist
……[l][er]

#osananajimi
だから[l][er]

#osananajimi
この体を、悪魔のせいだけにしたら[l][er]

#osananajimi
あたし、また逃げる気がする[l][er]

（涙が、こぼれた。）[l][er]

[chara_hide name="osananajimi" time="1000"]

; ================================================================================
*osananajimi_03_scene_4
; シーン4：励まし
; ================================================================================

[bg storage="protagonist_room_night.webp" time="1000"]
[playbgm storage="bgm_romance.mp3"]

#protagonist
……お前は、弱くない[l][er]

[chara_show name="osananajimi" face="surprised" pos="center" time="1000"]

#osananajimi
……え[l][er]

#protagonist
守ってもらってた？違う[l][er]

#protagonist
お前は、いつも俺を支えてくれてた[l][er]

#osananajimi
……[l][er]

#protagonist
落ち込んでる時、そばにいてくれた[l][er]

#protagonist
笑わせてくれた[l][er]

#protagonist
それは、強さだ[l][er]

#osananajimi
……そんなの——[l][er]

#protagonist
強さは、筋肉だけじゃない[l][er]

#protagonist
誰かを支える力。寄り添う力[l][er]

#protagonist
お前には、それがある[l][er]

#osananajimi
……[l][er]

（彼女の目から、涙が止まらない。）[l][er]

#osananajimi
……ありがと[l][er]

#protagonist
俺の方こそ[l][er]

（俺は、彼女の頭を撫でた。）[l][er]

#protagonist
お前は、そのままでいい[l][er]

[chara_hide name="osananajimi" time="1000"]

; ================================================================================
; ■ 幼なじみルート - 第5話「母との和解」
; テーマ：家族 / 受け入れる
; ================================================================================

*osananajimi_04
[bg storage="street_evening.webp" time="1000"]
[playbgm storage="bgm_daily.mp3"]

（数日後。）[l][er]

（幼なじみの母親から、連絡があった。）[l][er]

（話がしたい、と。）[l][er]

[chara_show name="osananajimi" face="default" pos="center" time="1000"]

#osananajimi
……行くの、怖い[l][er]

#protagonist
俺も一緒に行く[l][er]

#osananajimi
……いいの？[l][er]

#protagonist
当たり前だろ[l][er]

（俺たちは、彼女の家に向かった。）[l][er]

[chara_hide name="osananajimi" time="1000"]

; ================================================================================
*osananajimi_04_scene_2
; シーン2：母との対話
; ================================================================================

[bg storage="friend_house.webp" time="1000"]
[playbgm storage="bgm_sadness.mp3"]

（リビング。）[l][er]

（母親が、座っていた。）[l][er]

#mother
……座って[l][er]

[chara_show name="osananajimi" face="default" pos="right" time="1000"]

#osananajimi
……[l][er]

（彼女は、おそるおそる座った。）[l][er]

#mother
……あの日から、ずっと考えてた[l][er]

#osananajimi
……[l][er]

#mother
娘が——変わってしまったこと[l][er]

#mother
受け入れられなかった[l][er]

#protagonist
……[l][er]

#mother
怖かった。気持ち悪いって思った[l][er]

#osananajimi
……わかってる[l][er]

#mother
でも——[l][er]

（母親の目が、潤む。）[l][er]

#mother
それでも、あなたはあなたなのよね[l][er]

#osananajimi
……！[l][er]

#mother
声も、仕草も、笑い方も[l][er]

#mother
変わってない[l][er]

#osananajimi
……お母さん[l][er]

#mother
ごめんね。ひどいこと言って[l][er]

#mother
あなたを——追い出して[l][er]

（母親が、泣いている。）[l][er]

#osananajimi
……[l][er]

（幼なじみも、泣いていた。）[l][er]

#osananajimi
……あたしこそ、ごめん[l][er]

#osananajimi
びっくりさせて[l][er]

#mother
……おかえり[l][er]

#osananajimi
……ただいま[l][er]

（二人は、抱き合った。）[l][er]

[chara_hide name="osananajimi" time="1000"]

; ================================================================================
*osananajimi_04_scene_3
; シーン3：帰り道
; ================================================================================

[bg storage="street_evening.webp" time="1000"]
[playbgm storage="bgm_romance.mp3"]

（帰り道。）[l][er]

[chara_show name="osananajimi" face="smile" pos="center" time="1000"]

#osananajimi
……よかった[l][er]

#protagonist
ああ[l][er]

#osananajimi
お母さんと、話せて[l][er]

#protagonist
……[l][er]

#osananajimi
あんたのおかげ[l][er]

#protagonist
俺は何もしてない[l][er]

#osananajimi
いたでしょ。隣に[l][er]

#osananajimi
それだけで、心強かった[l][er]

#protagonist
……[l][er]

#osananajimi
……ねえ[l][er]

#protagonist
ん？[l][er]

#osananajimi
あたしたち——どうなるのかな[l][er]

#protagonist
どうって？[l][er]

#osananajimi
このまま、幼なじみ？[l][er]

#protagonist
……[l][er]

（彼女は、俺を見た。）[l][er]

（その目は——）[l][er]

[chara_hide name="osananajimi" time="1000"]

; ================================================================================
; ■ 幼なじみルート - 第6話「告白」
; テーマ：恋 / 変わらないもの
; ================================================================================

*osananajimi_05
[bg storage="park_night.webp" time="1000"]
[playbgm storage="bgm_romance.mp3"]

（夜の公園。）[l][er]

（幼なじみと、二人きり。）[l][er]

[chara_show name="osananajimi" face="blush" pos="center" time="1000"]

#osananajimi
……ねえ[l][er]

#protagonist
ん？[l][er]

#osananajimi
あたしたち、小さい頃から一緒だったよね[l][er]

#protagonist
ああ[l][er]

#osananajimi
幼稚園から[l][er]

#protagonist
泣き虫だったな、お前[l][er]

#osananajimi
うるさい[l][er]

（彼女は、笑った。）[l][er]

#osananajimi
でも——いつからか、変わった[l][er]

#protagonist
何が？[l][er]

#osananajimi
あんたを見る目[l][er]

#protagonist
……[l][er]

#osananajimi
幼なじみじゃなくて——[l][er]

#osananajimi
男の子として、見るようになった[l][er]

#protagonist
……[l][er]

#osananajimi
この体になって——もう、女の子として見てもらえないと思った[l][er]

#osananajimi
でも——[l][er]

（彼女は、俺を見た。）[l][er]

#osananajimi
あんたは、変わらなかった[l][er]

#osananajimi
いつも通り、接してくれた[l][er]

#protagonist
当たり前だろ[l][er]

#osananajimi
当たり前じゃないよ[l][er]

（彼女の目が、潤む。）[l][er]

#osananajimi
だから——[l][er]

#osananajimi
好き[l][er]

#protagonist
……[l][er]

#osananajimi
幼なじみとしてじゃなくて——[l][er]

#osananajimi
女として、好き[l][er]

[chara_hide name="osananajimi" time="1000"]

; ================================================================================
*osananajimi_05_scene_2
; シーン2：返事
; ================================================================================

[bg storage="park_night.webp" time="1000"]

[glink target="osananajimi_ending_good" text="俺も好きだ"]
[glink target="osananajimi_ending_normal" text="幼なじみでいたい"]
[s]

; ================================================================================
; ■ 幼なじみルート - グッドエンディング「変わらない気持ち」
; ================================================================================

*osananajimi_ending_good
#protagonist
俺も好きだ[l][er]

[chara_show name="osananajimi" face="surprised" pos="center" time="1000"]

#osananajimi
……え[l][er]

#protagonist
ずっと、好きだった[l][er]

#osananajimi
……いつから[l][er]

#protagonist
わからない。気づいたら、そうだった[l][er]

#protagonist
幼なじみだからって、ごまかしてた[l][er]

#osananajimi
……[l][er]

#protagonist
でも、この体になっても——変わらなかった[l][er]

#protagonist
お前を好きな気持ちは[l][er]

#osananajimi
……[l][er]

（彼女の目から、涙がこぼれた。）[l][er]

#osananajimi
……嬉しい[l][er]

#protagonist
泣くなよ[l][er]

#osananajimi
泣いてない……[l][er]

（俺は、彼女を抱きしめた。）[l][er]

#protagonist
これからは、幼なじみじゃなくて——[l][er]

#osananajimi
……うん[l][er]

#osananajimi
恋人[l][er]

[chara_hide name="osananajimi" time="1000"]

; ================================================================================
*osananajimi_ending_good_epilogue
; エピローグ
; ================================================================================

[bg storage="school_gate.webp" time="1000"]
[playbgm storage="bgm_romance.mp3"]

（数ヶ月後。）[l][er]

（俺たちは、毎日一緒に登校している。）[l][er]

（昔と同じように。）[l][er]

（でも、繋いだ手だけが——違う。）[l][er]

[chara_show name="osananajimi" face="smile" pos="center" time="1000"]

#osananajimi
……ねえ[l][er]

#protagonist
ん？[l][er]

#osananajimi
昔から、こうしたかったんだ[l][er]

#protagonist
手を繋ぐこと？[l][er]

#osananajimi
うん[l][er]

#osananajimi
でも、恥ずかしくてできなかった[l][er]

#protagonist
……俺もだ[l][er]

#osananajimi
あはは、同じだね[l][er]

（彼女は、笑った。）[l][er]

#osananajimi
この体になって——最初は嫌だった[l][er]

#osananajimi
でも、今は——[l][er]

#protagonist
今は？[l][er]

#osananajimi
ちょっとだけ、感謝してる[l][er]

#protagonist
なんで？[l][er]

#osananajimi
だって——[l][er]

（彼女は、俺の手を握りしめた。）[l][er]

#osananajimi
これがなかったら、告白できなかったから[l][er]

#protagonist
……そうか[l][er]

#osananajimi
うん[l][er]

#osananajimi
だから——ありがと[l][er]

#protagonist
……俺の方こそ[l][er]

[chara_hide name="osananajimi" time="1000"]

[bg storage="black.webp" time="1000"]

（——幼なじみ。本名、藤咲結衣。）[l][er]

（小さい頃から、ずっと一緒だった。）[l][er]

（体が変わっても——気持ちは変わらなかった。）[l][er]

（むしろ、気づけた。）[l][er]

（ずっと、好きだったことに。）[l][er]

（END - 「変わらない気持ち」）[l][er]

[s]

; ================================================================================
; ■ 幼なじみルート - ノーマルエンディング「ずっと一緒」
; ================================================================================

*osananajimi_ending_normal
#protagonist
……ごめん[l][er]

[chara_show name="osananajimi" face="sad" pos="center" time="1000"]

#osananajimi
……[l][er]

#protagonist
お前のことは大事だ。でも——[l][er]

#osananajimi
……幼なじみとして？[l][er]

#protagonist
……ああ[l][er]

#osananajimi
……そっか[l][er]

（彼女は、俯いた。）[l][er]

（でも——顔を上げた。）[l][er]

#osananajimi
……いいよ[l][er]

#protagonist
……[l][er]

#osananajimi
幼なじみでも、いい[l][er]

#osananajimi
だって——[l][er]

（彼女は、笑った。）[l][er]

#osananajimi
それでも、一緒にいられるでしょ[l][er]

#protagonist
……ああ[l][er]

#osananajimi
じゃあ、いい[l][er]

#osananajimi
あたしは——あんたの隣にいられれば、それでいい[l][er]

#protagonist
……[l][er]

（俺は、何も言えなかった。）[l][er]

（彼女の笑顔が、眩しくて。）[l][er]

[chara_hide name="osananajimi" time="1000"]

; ================================================================================
*osananajimi_ending_normal_epilogue
; エピローグ
; ================================================================================

[bg storage="school_gate.webp" time="1000"]
[playbgm storage="bgm_daily.mp3"]

（数ヶ月後。）[l][er]

（俺たちは、相変わらず一緒に登校している。）[l][er]

（昔と同じように。）[l][er]

[chara_show name="osananajimi" face="smile" pos="center" time="1000"]

#osananajimi
今日も一緒だね[l][er]

#protagonist
ああ[l][er]

#osananajimi
明日も？[l][er]

#protagonist
当たり前だろ[l][er]

#osananajimi
あはは、よかった[l][er]

（彼女は、笑っている。）[l][er]

（いつもの笑顔。）[l][er]

（幼なじみの、いつもの笑顔。）[l][er]

#osananajimi
ねえ[l][er]

#protagonist
ん？[l][er]

#osananajimi
あたしたち、ずっと一緒だよね[l][er]

#protagonist
……ああ[l][er]

#osananajimi
約束ね[l][er]

#protagonist
約束だ[l][er]

（彼女は、小指を差し出した。）[l][er]

（俺は、その小指に自分の小指を絡めた。）[l][er]

（——昔、よくやった、指切りげんまん。）[l][er]

#osananajimi
嘘ついたら、針千本ね[l][er]

#protagonist
飲めないよ[l][er]

#osananajimi
あはは[l][er]

[chara_hide name="osananajimi" time="1000"]

[bg storage="black.webp" time="1000"]

（——幼なじみ。本名、藤咲結衣。）[l][er]

（小さい頃から、ずっと一緒だった。）[l][er]

（これからも——ずっと。）[l][er]

（恋人じゃなくても。）[l][er]

（幼なじみとして——ずっと。）[l][er]

（END - 「ずっと一緒」）[l][er]

[s]

; ================================================================================
; ■ 幼なじみルート - バッドエンディング「壊れた家、消えた居場所」
; 偽装ルートで嘘が露見した場合に到達
; ================================================================================

*osananajimi_ending_bad
[chara_hide_all]
[bg storage="street_evening.webp" time="1000"]
[playbgm storage="bgm_isolation.mp3"]

（家を追い出された幼なじみは、それから——うちにも来なくなった。）[l][er]

（連絡も、途絶えた。）[l][er]

（電話。LINE。何度送っても、既読すらつかない。）[l][er]

#protagonist
（……あの嘘さえつかなければ）[l][er]

#protagonist
（「双子の姉」なんて、口走らなければ）[l][er]

（俺は、何度もあの瞬間を反芻した。）[l][er]

（だが、戻らない。）[l][er]

[chara_hide_all]
[bg storage="protagonist_room_night.webp" time="1000"]
[playbgm storage="bgm_sadness.mp3"]

（数週間後。）[l][er]

（同好会の集まりで、生徒会長が事務的に告げた。）[l][er]

[chara_show name="seitokai" face="sad" pos="center" time="1000"]

#seitokai
……藤咲さんは、転校手続きを取ったそうです[l][er]

#protagonist
転校……？[l][er]

#seitokai
詳細は伝えられません。本人の希望です[l][er]

#seitokai
ただ——「会いたくない」と[l][er]

#protagonist
……[l][er]

[chara_hide name="seitokai" time="1000"]

（言葉が、出なかった。）[l][er]

; ================================================================================
*osananajimi_ending_bad_scene2
; 悪魔の最後の囁き
; ================================================================================

[bg storage="black.webp" time="1000"]
[playbgm storage="bgm_devil.mp3"]

[chara_show name="akuma" face="smile" pos="center" time="1000"]

#akuma
あーあ。もったいない[l][er]

#protagonist
……出てけ[l][er]

#akuma
怒らないでよ。僕は何もしてない[l][er]

#akuma
嘘をついたのは、君だ[l][er]

#protagonist
……[l][er]

#akuma
彼女の母親は、"娘"を失った[l][er]

#akuma
彼女は、"家"を失った[l][er]

#akuma
そして君は——"幼なじみ"を失った[l][er]

#akuma
おいしいね。この絶望[l][er]

#protagonist
黙れ……！[l][er]

#akuma
ふふ。じゃあね[l][er]

[chara_hide name="akuma" time="1000"]

（悪魔は、満足げに消えた。）[l][er]

; ================================================================================
*osananajimi_ending_bad_epilogue
; エピローグ
; ================================================================================

[bg storage="school_gate.webp" time="1000"]
[playbgm storage="bgm_isolation.mp3"]

（次の朝。）[l][er]

（校門の前で、いつもの場所に立つ。）[l][er]

（隣に、誰もいない。）[l][er]

（——昔から、毎朝そこにあった笑顔は、もうない。）[l][er]

#protagonist
（……ごめん）[l][er]

#protagonist
（守れるって思ったんだ。嘘ひとつで）[l][er]

#protagonist
（でも、嘘は——お前を、家から、俺から、引き剥がした）[l][er]

（俺は、一人で歩き出した。）[l][er]

（軋む筋肉だけが、悪魔の契約を覚えている。）[l][er]

[bg storage="black.webp" time="1000"]

（——幼なじみ。本名、藤咲結衣。）[l][er]

（小さい頃から、ずっと一緒だった。）[l][er]

（一つの嘘で、すべてが消えた。）[l][er]

（END - 「壊れた家、消えた居場所」）[l][er]

[s]

[s]
