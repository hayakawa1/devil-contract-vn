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

[bg storage="school_gate.png"]
[playbgm storage="bgm_daily.mp3"]

（Day2地獄の朝。筋肉化。）
（幼なじみは、最初に俺の袖を引いた。）

#osananajimi
……ねえ

#protagonist
ん？

#osananajimi
今日、帰り……一緒に来て

#protagonist
家？

#osananajimi
……うん。たぶん、やばい

（彼女は笑ってる。いつもの調子を装ってる。）
（でも、声が薄い。）


; ================================================================================
; 第2話「帰宅」
; ================================================================================

[bg storage="street_evening.png"]
[playbgm storage="bgm_sadness.mp3"]

（家の前まで来た。普通の家。）
（でも幼なじみの足が止まる。）

#osananajimi
……ごめん

#protagonist
何が

#osananajimi
たぶん、怒られるの、あたしだけじゃない

#protagonist
俺も？

#osananajimi
巻き込みたくないけど……来てほしい

#protagonist
来た

（玄関の扉を開ける。）


#mother
……は？

（母親の声が、一段低い。）

#mother
……誰？

#osananajimi
……お母さん

#mother
誰？ って聞いてるの

（幼なじみは、黙った。）
（筋肉があるせいじゃない。）
（"娘"と認識してもらえてない。）

#protagonist
……

#mother
まさか、冗談でしょ。
うちの子、どこ

#osananajimi
……ここ

#mother
……近寄らないで

（言い方が、刺さる。）


; ================================================================================
; ★ 分岐ポイントA：母親との和解方法
; ================================================================================

[glink target="osananajimi_01" text="正直に話す（真実ルート）"]
[glink target="osananajimi_02" text="嘘をつく（偽装ルート）"]
[s]


; ================================================================================
; 第3話「風呂場の鏡」（共通シーン）
; ================================================================================

[bg storage="protagonist_room_night.png"]
[playbgm storage="bgm_isolation.mp3"]

（夜。幼なじみは、自分の部屋で鏡を見ていた。）

#osananajimi
……笑える

#protagonist
笑ってない

#osananajimi
笑ってるよ。
だってさ、あたしの体、別人じゃん

#protagonist
……お前だろ

#osananajimi
……わかんないよ

（鏡の中の筋肉は、彼女の思春期を踏み潰すみたいに張っている。）

#osananajimi
ねえ

#protagonist
ん

#osananajimi
……触ってもいい？

#protagonist
どこを

#osananajimi
……自分の腕

（彼女が、自分の腕をそっと撫でる。）
（強さが、怖さに変わる瞬間。）

#osananajimi
これ、あたしの"努力"じゃない

#osananajimi
なのに、強い

#protagonist
……

#osananajimi
ずるいよね

#protagonist
ずるくない

#osananajimi
ずるいよ。
ずるいって思わないと、あたし壊れる


（→ 次は「第4話：悪魔の影」へ続く）

; source: 分岐A_真実ルート.txt
*osananajimi_01
; ■ 幼なじみルート - 分岐A：真実ルート
; 選択肢「正直に話す」を選んだ場合

; ================================================================================

#protagonist
……お母さん、落ち着いて

#mother
落ち着いて？
知らない男が娘のフリして家に入ってきて？

#osananajimi
男じゃない……

#mother
じゃあ何？

#osananajimi
……私

（母親は震えた。怒りじゃない。）
（恐怖だ。）

#mother
……病院

#osananajimi
行く

#mother
警察——

#protagonist
待って！

（俺の声で、空気が止まる。）

#protagonist
昨日から、学校全体で起きてる

#protagonist
原因不明の……体の変化

#mother
……そんなの

#protagonist
信じられないのはわかる

#protagonist
でも、本人が一番怖い

（幼なじみが、息を吸う。）

#osananajimi
……お母さん

#osananajimi
私、声……わかる？

#mother
……

#osananajimi
小学校の時。
熱出したとき、氷枕作ってくれた

#osananajimi
そのとき……
"泣くな"じゃなくて、"泣いていい"って言った

（母の目が揺れる。）

#mother
……

#mother
……あなた、本当に

#osananajimi
うん

（母は、崩れた。）

#mother
……気持ち悪い、って思った

#osananajimi
……

#mother
ごめん。ごめん……

（抱きしめようとして、止まる。）
（筋肉があるからじゃない。）
（怖いからだ。）

#osananajimi
……いいよ。
今、怖いの普通だよ

（彼女の方が大人みたいだった。）


; ================================================================================
; 第5話「母の言葉」
; ================================================================================

[bg storage="school_gate.png"]
[playbgm storage="bgm_daily.mp3"]

（母親が味噌汁を作っている。）
（幼なじみは黙って座っている。）

#mother
……学校は、休みなさい

#osananajimi
……

#mother
その姿で出るの、危ないから

（"危ない"＝世間が、ではない。）
（"私の世界が壊れるから"だ。）

#osananajimi
……私、隠すの嫌だ

#mother
わがまま言わないで

（幼なじみの呼吸が荒くなる。）

#protagonist
……

（ここで主人公が口を挟むと、母は"外敵"として扱う。）
（だから——）

#protagonist
……お母さん

#protagonist
一回だけでいい。
娘さんの話、聞いてあげてください

#mother
……私は聞いてる！

#protagonist
……聞いてるのは、"安心できる話"です

（母の手が止まる。）

#mother
……

#mother
……わたしだって、怖いのよ

#osananajimi
……あたしも怖い

（初めて、母娘の恐怖が並んだ。）


（→ 次は「第4話：悪魔の影」または分岐Bへ）
[jump target="osananajimi_02"]

; source: 分岐A_偽装ルート.txt
*osananajimi_02
; ■ 幼なじみルート - 分岐A：偽装ルート
; 選択肢「嘘をつく（双子設定など）」を選んだ場合

; ================================================================================

#protagonist
……お母さん、落ち着いて

#mother
落ち着けるわけないでしょ！

#osananajimi
……

#protagonist
（ここで正面突破すると、壊れる）

#protagonist
……双子です

#mother
……は？

#protagonist
幼なじみの、双子の姉

#mother
うちの子に双子なんて——

#protagonist
……事情があって

（幼なじみが、目を見開く。）

#osananajimi
……う、うん

（声が震える。）

#mother
……冗談でしょ

#protagonist
冗談じゃないです

#protagonist
本人は今……体調が悪くて

#protagonist
だから、俺が代わりに来た

#mother
……

（母親は、疑いながらも"信じたい形"を選ぶ。）
（信じたいのは娘じゃなく、"安心できる物語"だ。）

#mother
……とにかく、上がって

（通った。）

（でも——）

（この嘘は、後で必ず牙を剥く。）


; ================================================================================
; 第5話「嘘の代償」
; ================================================================================

[bg storage="protagonist_room_night.png"]
[playbgm storage="bgm_sadness.mp3"]

（部屋の中。）

#osananajimi
……ねえ

#protagonist
なんだ

#osananajimi
あたし、誰になったの？

#protagonist
……

#osananajimi
双子の姉？
そんな人、いないのに

#protagonist
仕方なかった

#osananajimi
うん……仕方ないよね

（彼女は笑う。）

#osananajimi
お母さんは、
"あたし"じゃない人を信じたんだ

#protagonist
……

#osananajimi
嘘でよかったのかな

#protagonist
よくない

#osananajimi
……じゃあ、いつ本当を話す？

#protagonist
……

（答えられない。）

（嘘の中で、彼女は消えていく。）


; ================================================================================
後日：嘘の露見（バッドルート確定の場合）
; ================================================================================

[bg storage="school_gate.png"]
[playbgm storage="bgm_tension.mp3"]

#mother
……ねえ

#osananajimi
なに

#mother
あなた、本当に双子？

#osananajimi
……

#mother
戸籍、調べたの

（空気が凍る。）

#mother
双子なんて、いない

#mother
あなた、誰？

#osananajimi
……

（嘘が、壊れた。）

#mother
出てって

#osananajimi
……え

#mother
出てけって言ってるの！

（母の叫びが、彼女を追い出す。）


（→ 次は「分岐B」または「END3_バッド.txt」へ）
