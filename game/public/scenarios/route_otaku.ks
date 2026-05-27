; route: オタク
*start
[jump target="otaku_00"]

; source: 第1話_被験体.txt
*otaku_00
; ■ オタクルート - 第1話「被験体」

; 研究進捗：0
; 危険度：0

; ================================================================================
*otaku_00_scene_1
; シーン1：放課後／理科準備室（呼び出し）
; ================================================================================

[bg storage="science_prep_room.png" time="1000"]
[playbgm storage="bgm_daily.mp3"]

（放課後。理科準備室に呼び出された。）[l][er]

（ドアを開けると——）[l][er]

[chara_show name="otaku" face="default" pos="center" time="1000"]

#otaku
来てくれましたね。待ってました[l][er]

（彼女は白衣を羽織っていた。）[l][er]

（——サイズが全く合っていない。袖から腕がはみ出している。）[l][er]

#protagonist
……白衣、パツパツだぞ[l][er]

#otaku
承知しています。でも、研究には必要なので[l][er]

（即答。）[l][er]

#protagonist
で、何の用だ？[l][er]

#otaku
これを見てください[l][er]

（机の上に、薬瓶が並んでいた。）[l][er]

[chara_hide name="otaku" time="1000"]

; ================================================================================
*otaku_00_scene_2
; シーン2：瓶の回収
; ================================================================================

[bg storage="science_prep_room.png" time="1000"]

#protagonist
それ——[l][er]

#otaku
私たちに配られた薬です。5人分、回収しました[l][er]

#protagonist
どうやって[l][er]

#otaku
交渉です。みんな、空き瓶は捨てるつもりでしたから[l][er]

（彼女は瓶を一つ持ち上げた。）[l][er]

（光に透かすように見ている。）[l][er]

#otaku
気づきましたか？[l][er]

#protagonist
何に[l][er]

#otaku
ラベルの番号[l][er]

（見ると、小さく数字が印刷されていた。）[l][er]


#otaku
03、07、12、13、14[l][er]

#protagonist
……連番じゃない？[l][er]

#otaku
正解です[l][er]

[chara_hide name="otaku" time="1000"]

; ================================================================================
*otaku_00_scene_3
; シーン3：欠番の存在
; ================================================================================

[bg storage="science_prep_room.png" time="1000"]
[playbgm storage="bgm_tension.mp3"]

#otaku
連番じゃない[l][er]

#protagonist
……つまり？[l][er]

#otaku
私たち7人が、03、07、12、13、14、15、16[l][er]

#otaku
では——01と02は、どこにいるんでしょう[l][er]

（彼女の目が、異様に光っていた。）[l][er]

#protagonist
……[l][er]

#otaku
04から06は？ 08から11は？[l][er]

#protagonist
お前、何を——[l][er]

#otaku
調べたいんです[l][er]

（彼女は俺を見た。）[l][er]

#otaku
真実を。この薬が何なのか。あの悪魔が何なのか[l][er]

#protagonist
危険だぞ[l][er]

#otaku
知ってます[l][er]

（即答だった。）[l][er]

#otaku
それでも、知りたい[l][er]

[chara_hide name="otaku" time="1000"]

; ================================================================================
*otaku_00_scene_4
; シーン4：研究者の本能
; ================================================================================

[bg storage="science_prep_room.png" time="1000"]
[chara_show name="otaku" face="default" pos="center" time="1000"]

#protagonist
なんで、そこまで——[l][er]

#otaku
私は、研究者ですから[l][er]

#protagonist
……[l][er]

#otaku
知らないことがあると、気持ち悪いんです[l][er]

#otaku
まるで、パズルの一部が欠けているみたいに[l][er]

#protagonist
でも——[l][er]

#otaku
わかっています。危険だと[l][er]

（彼女は瓶を机に置いた。）[l][er]

#otaku
でも、知らないまま生きるのは——[l][er]

（少し間を置く。）[l][er]

#otaku
もっと怖い[l][er]

#protagonist
……[l][er]

#otaku
だから——[l][er]

（彼女は、まっすぐ俺を見た。）[l][er]

#otaku
手伝ってくれますか？[l][er]


; ================================================================================
[glink target="otaku_00_choice_a" text="手伝う"]
[glink target="otaku_00_choice_b" text="一人でやれ"]
[s]
[chara_hide name="otaku" time="1000"]

; ================================================================================
*otaku_00_scene_5
; シーン5：研究開始
; ================================================================================

[bg storage="science_prep_room.png" time="1000"]
[playbgm storage="bgm_daily.mp3"]

（彼女は、すぐに動き出した。）[l][er]

#otaku
まず、ガスクロマトグラフィーで成分を——[l][er]

#protagonist
……何それ[l][er]

#otaku
気体化して成分を分離する装置です[l][er]

#protagonist
……[l][er]

#otaku
あとは質量分析、赤外分光法……[l][er]

（専門用語が次々と飛び出す。）[l][er]

#protagonist
お前、そういうの全部できるのか[l][er]

#otaku
科学部で習いました[l][er]

（彼女は、瓶を開ける。）[l][er]


#otaku
……残量、わずか[l][er]

#otaku
慎重に使わないと[l][er]

#protagonist
俺は何すればいい？[l][er]

#otaku
そうですね……[l][er]

（彼女は少し考えた。）[l][er]

#otaku
記録係をお願いできますか[l][er]

#protagonist
記録？[l][er]

#otaku
実験の手順と結果を、ノートに書いてください[l][er]

#protagonist
……わかった[l][er]

（俺は椅子に座り、ノートを開いた。）[l][er]

（彼女の実験が、始まる。）[l][er]

[chara_hide name="otaku" time="1000"]

; ================================================================================
*otaku_00_scene_6
; シーン6：一人で抱え込む（選択肢B後）
; ================================================================================

[bg storage="science_prep_room.png" time="1000"]
[playbgm storage="bgm_isolation.mp3"]

（数日後。）[l][er]

（廊下で、彼女とすれ違った。）[l][er]

#protagonist
……おい[l][er]

#otaku
……何でしょう[l][er]

#protagonist
顔色、悪いぞ[l][er]

#otaku
大丈夫です[l][er]

（即答。でも、目の下に濃い隈。）[l][er]

#protagonist
無理してないか？[l][er]

#otaku
……研究は順調です[l][er]

（彼女は、それだけ言って去っていった。）[l][er]

#protagonist
（……）[l][er]

[chara_hide name="otaku" time="1000"]

; ================================================================================
*otaku_00_scene_7
; シーン7：夕暮れの窓辺（悪魔の気配）
; ================================================================================

[bg storage="science_prep_room.png" time="1000"]
[playbgm storage="bgm_tension.mp3"]

（実験が一段落した。）[l][er]

（夕日が、理科準備室を赤く染める。）[l][er]

#otaku
……不思議ですね[l][er]

#protagonist
何が[l][er]

#otaku
こんな状況なのに——[l][er]

（彼女は、瓶を見つめる。）[l][er]

#otaku
なぜか、ワクワクしてるんです[l][er]

#protagonist
……[l][er]

#otaku
未知のものを調べるのは、楽しい[l][er]

#otaku
たとえそれが、自分の体を蝕むものでも[l][er]

#protagonist
お前、ほんとに研究者だな[l][er]

#otaku
……変ですか？[l][er]

#protagonist
変だけど、嫌いじゃない[l][er]

#otaku
……[l][er]

（彼女は、少しだけ笑った。）[l][er]


（窓が、急に揺れた。）[l][er]

（風が吹き込む。）[l][er]

（その風に混じって——何かの気配。）[l][er]

#protagonist
（……あいつか）[l][er]

（悪魔が、見ている。）[l][er]

[jump target="otaku_01"]

; ================================================================================

*otaku_00_choice_a
; ================================================================================

#protagonist
……わかった[l][er]

#otaku
！[l][er]

（彼女の目が、輝いた。）[l][er]

#protagonist
ただし、俺にできることだけな[l][er]

#otaku
それで十分です[l][er]

（彼女は小さく笑った。）[l][er]

#otaku
ありがとうございます[l][er]

#protagonist
……何から始める？[l][er]

#otaku
まず、薬の成分分析から[l][er]

#otaku
次に、欠番の追跡調査[l][er]

#protagonist
調査？[l][er]

#otaku
ネットです。同じ症状の人がいないか探します[l][er]

#protagonist
……本格的だな[l][er]

#otaku
当然です。これは、私たちの命に関わることですから[l][er]




[jump target="otaku_00_scene_5"]

*otaku_00_choice_b
; ================================================================================

#protagonist
……悪いけど、俺には無理だ[l][er]

#otaku
……そうですか[l][er]

（彼女は、目を伏せた。）[l][er]

#otaku
わかりました。一人でやります[l][er]

#protagonist
危ないことはするなよ[l][er]

#otaku
……配慮、ありがとうございます[l][er]

（声が、少し冷たい。）[l][er]

#protagonist
（……まずかったか）[l][er]




[jump target="otaku_00_scene_6"]

; ================================================================================
; ■ オタクルート - 第2話「発見」
; テーマ：真実への渇望 / 危険な領域
; ================================================================================

*otaku_01
[bg storage="science_prep_room.png" time="1000"]
[playbgm storage="bgm_tension.mp3"]

（数日後。理科準備室。）[l][er]

（彼女が、興奮した様子で俺を呼んだ。）[l][er]

[chara_show name="otaku" face="smile" pos="center" time="1000"]

#otaku
見つけました！[l][er]

#protagonist
何を[l][er]

#otaku
欠番の手がかり[l][er]

#protagonist
……！[l][er]

#otaku
ネットで調べていたら——同じ症状の人が見つかりました[l][er]

#protagonist
同じ症状？[l][er]

#otaku
筋肉の異常発達。そして——瓶の番号[l][er]

#otaku
01番と02番です[l][er]

#protagonist
……見つかったのか[l][er]

#otaku
はい。でも——[l][er]

（彼女の表情が、曇った。）[l][er]

#otaku
二人とも、行方不明です[l][er]

#protagonist
行方不明？[l][er]

#otaku
数ヶ月前から、連絡が取れなくなっているようで[l][er]

#protagonist
……[l][er]

[chara_hide name="otaku" time="1000"]

; ================================================================================
*otaku_01_scene_2
; シーン2：仮説
; ================================================================================

[bg storage="science_prep_room.png" time="1000"]
[playbgm storage="bgm_tension.mp3"]

[chara_show name="otaku" face="default" pos="center" time="1000"]

#otaku
仮説を立てました[l][er]

#protagonist
聞かせてくれ[l][er]

#otaku
この薬には——段階があるのでは、と[l][er]

#protagonist
段階？[l][er]

#otaku
私たちの番号は03以降[l][er]

#otaku
01と02は——初期の被験者[l][er]

#protagonist
被験者……[l][er]

#otaku
何らかの実験の。そして——[l][er]

（彼女の目が、鋭くなる。）[l][er]

#otaku
初期の被験者には、副作用があったのかもしれません[l][er]

#protagonist
副作用？[l][er]

#otaku
だから、行方不明になった——いえ、"消された"のかもしれません[l][er]

#protagonist
……[l][er]

（背筋が、冷たくなる。）[l][er]

[chara_hide name="otaku" time="1000"]

; ================================================================================
*otaku_01_scene_3
; シーン3：調査の深入り
; ================================================================================

[bg storage="science_prep_room.png" time="1000"]
[playbgm storage="bgm_daily.mp3"]

#protagonist
危険じゃないか[l][er]

[chara_show name="otaku" face="default" pos="center" time="1000"]

#otaku
危険です[l][er]

#protagonist
なら——[l][er]

#otaku
でも、知りたいんです[l][er]

（彼女の目が、熱を帯びている。）[l][er]

#otaku
私たちの体に、何が起きているのか[l][er]

#otaku
この薬が、何なのか[l][er]

#otaku
悪魔が、何を目的としているのか[l][er]

#protagonist
……[l][er]

#otaku
知らないまま生きるのは——もっと怖い[l][er]

#protagonist
……[l][er]

（俺は、彼女を見た。）[l][er]

（細い体。でも、筋肉で膨らんでいる。）[l][er]

（その中に、強い意志がある。）[l][er]

#protagonist
……わかった。手伝う[l][er]

#otaku
！[l][er]

#otaku
ありがとうございます[l][er]

（彼女は、嬉しそうに笑った。）[l][er]

[chara_hide name="otaku" time="1000"]

; ================================================================================
; ■ オタクルート - 第3話「真実の代償」
; テーマ：知識と危険 / 守りたいもの
; ================================================================================

*otaku_02
[bg storage="science_prep_room.png" time="1000"]
[playbgm storage="bgm_tension.mp3"]

（研究が進んだ。）[l][er]

（そして——恐ろしいことがわかった。）[l][er]

[chara_show name="otaku" face="default" pos="center" time="1000"]

#otaku
成分分析の結果が出ました[l][er]

#protagonist
どうだった[l][er]

#otaku
……未知の化合物です[l][er]

#otaku
地球上に存在しない分子構造[l][er]

#protagonist
……[l][er]

#otaku
そして——もう一つ[l][er]

（彼女の手が、震えている。）[l][er]

#otaku
この薬には——"有効期限"があるようです[l][er]

#protagonist
有効期限？[l][er]

#otaku
正確には——"変化の限界点"[l][er]

#protagonist
どういうことだ[l][er]

#otaku
筋肉の発達には、限界があります[l][er]

#otaku
その限界を超えると——[l][er]

（彼女は、言葉を切った。）[l][er]

#protagonist
超えると、どうなる[l][er]

#otaku
……わかりません[l][er]

#otaku
でも、01番と02番が行方不明になった時期と——[l][er]

#otaku
限界点の推定時期が、一致するんです[l][er]

#protagonist
……！[l][er]

[chara_hide name="otaku" time="1000"]

; ================================================================================
*otaku_02_scene_2
; シーン2：彼女の決意
; ================================================================================

[bg storage="science_prep_room.png" time="1000"]
[playbgm storage="bgm_sadness.mp3"]

[chara_show name="otaku" face="sad" pos="center" time="1000"]

#otaku
……怖くなりました[l][er]

#protagonist
……[l][er]

#otaku
知りたいと思っていたのに[l][er]

#otaku
知れば知るほど——怖くなる[l][er]

#protagonist
やめるか？[l][er]

#otaku
……[l][er]

（彼女は、少し考えた。）[l][er]

#otaku
……いいえ[l][er]

#protagonist
……[l][er]

#otaku
ここで止めたら——何も解決しません[l][er]

#otaku
みんなの体がどうなるか、わからないまま[l][er]

#protagonist
でも——[l][er]

#otaku
私は——研究者です[l][er]

#otaku
真実から逃げたくない[l][er]

（彼女の目が、強い光を持っている。）[l][er]

#protagonist
……[l][er]

#protagonist
わかった。俺も逃げない[l][er]

#otaku
……ありがとうございます[l][er]

[chara_hide name="otaku" time="1000"]

; ================================================================================
*otaku_02_scene_3
; シーン3：悪魔の介入
; ================================================================================

[bg storage="science_prep_room.png" time="1000"]
[playbgm storage="bgm_devil.mp3"]

（突然——部屋の温度が下がった。）[l][er]

[chara_show name="akuma" face="default" pos="left" time="1000"]

#akuma
随分、調べたね[l][er]

#protagonist
！[l][er]

#otaku
悪魔……[l][er]

#akuma
感心したよ。ここまで辿り着くとは[l][er]

#otaku
……答えてください[l][er]

#akuma
何を？[l][er]

#otaku
01番と02番は、どうなったんですか[l][er]

#akuma
……[l][er]

（悪魔は、笑った。）[l][er]

#akuma
知りたい？[l][er]

#otaku
はい[l][er]

#akuma
代償を払えば、教えてあげる[l][er]

#otaku
代償？[l][er]

#akuma
記憶だよ[l][er]

#akuma
君の大切な記憶を、一つ消す[l][er]

#akuma
そうしたら、真実を教える[l][er]

#otaku
……[l][er]

[chara_hide name="akuma" time="1000"]

; ================================================================================
*otaku_02_scene_4
; シーン4：選択
; ================================================================================

[bg storage="science_prep_room.png" time="1000"]

[glink target="otaku_02_choice_a" text="やめろ。そんな取引するな"]
[glink target="otaku_02_choice_b" text="彼女の判断に任せる"]
[s]

*otaku_02_choice_a
#protagonist
やめろ[l][er]

[chara_show name="otaku" face="surprised" pos="center" time="1000"]

#otaku
……[l][er]

#protagonist
そんな取引、するな[l][er]

#otaku
でも——[l][er]

#protagonist
真実なんか、記憶を失ってまで知る価値ない[l][er]

#otaku
……[l][er]

#protagonist
お前の記憶は——お前のものだ[l][er]

#protagonist
誰にも渡すな[l][er]

（彼女は、俺を見た。）[l][er]

（そして——笑った。）[l][er]

#otaku
……ありがとうございます[l][er]

#otaku
少し、冷静になれました[l][er]

[chara_hide name="otaku" time="1000"]

[chara_show name="akuma" face="default" pos="left" time="1000"]

#akuma
つまらないな[l][er]

#akuma
まあいい。いずれわかるよ[l][er]

#akuma
真実は——逃げないから[l][er]

（悪魔は、消えた。）[l][er]

[chara_hide name="akuma" time="1000"]
[jump target="otaku_03"]

*otaku_02_choice_b
#protagonist
……お前が決めろ[l][er]

[chara_show name="otaku" face="default" pos="center" time="1000"]

#otaku
……[l][er]

（彼女は、長い間考えた。）[l][er]

#otaku
……やめておきます[l][er]

#protagonist
……[l][er]

#otaku
記憶を失ったら——私は私でなくなる[l][er]

#otaku
真実を知っても、それを解釈する"私"がいなければ——意味がない[l][er]

#protagonist
……そうだな[l][er]

[chara_hide name="otaku" time="1000"]

[chara_show name="akuma" face="default" pos="left" time="1000"]

#akuma
賢明だね[l][er]

#akuma
まあ、いずれわかるよ[l][er]

#akuma
真実は——逃げないから[l][er]

（悪魔は、消えた。）[l][er]

[chara_hide name="akuma" time="1000"]
[jump target="otaku_03"]

; ================================================================================
; ■ オタクルート - 第4話「もう一つの真実」
; テーマ：仲間 / 支え合い
; ================================================================================

*otaku_03
[bg storage="classroom.png" time="1000"]
[playbgm storage="bgm_daily.mp3"]

（数日後。）[l][er]

（俺たちは、研究の成果を筋肉同好会のみんなに共有した。）[l][er]

[chara_show name="seitokai" face="default" pos="left" time="1000"]

#seitokai
つまり——私たちの体には、限界点がある、と[l][er]

[chara_show name="otaku" face="default" pos="right" time="1000"]

#otaku
はい。推定では、数ヶ月から1年程度[l][er]

#seitokai
それを超えると、どうなるかは不明……[l][er]

#otaku
申し訳ありません。そこまでは——[l][er]

[chara_hide name="otaku" time="1000"]

[chara_show name="kakutogi" face="default" pos="left" time="1000"]

#kakutogi
怖くないと言えば嘘になる[l][er]

#kakutogi
でも——知れてよかった[l][er]

#otaku
……[l][er]

#kakutogi
お前のおかげだ[l][er]

[chara_hide name="kakutogi" time="1000"]
[chara_hide name="seitokai" time="1000"]

; ================================================================================
*otaku_03_scene_2
; シーン2：感謝
; ================================================================================

[bg storage="classroom.png" time="1000"]
[playbgm storage="bgm_romance.mp3"]

（みんなが帰った後。）[l][er]

[chara_show name="otaku" face="sad" pos="center" time="1000"]

#otaku
……私のせいで、みんなを不安にさせてしまいました[l][er]

#protagonist
そんなことない[l][er]

#otaku
でも——[l][er]

#protagonist
知らないより、知ってた方がいい[l][er]

#protagonist
お前の研究のおかげで、みんな心構えができた[l][er]

#otaku
……[l][er]

#protagonist
感謝してるんだ。みんな[l][er]

#otaku
……本当ですか[l][er]

#protagonist
ああ[l][er]

（彼女の目が、潤む。）[l][er]

#otaku
……ありがとうございます[l][er]

#otaku
私——一人で研究してた時は、怖かった[l][er]

#otaku
でも、あなたがいてくれて——[l][er]

#protagonist
……[l][er]

#otaku
支えてくれて、嬉しかったです[l][er]

[chara_hide name="otaku" time="1000"]

; ================================================================================
; ■ オタクルート - 第5話「告白」
; テーマ：恋 / 知識を超えたもの
; ================================================================================

*otaku_04
[bg storage="science_prep_room.png" time="1000"]
[playbgm storage="bgm_romance.mp3"]

（夕暮れ。理科準備室。）[l][er]

（二人きり。）[l][er]

[chara_show name="otaku" face="blush" pos="center" time="1000"]

#otaku
……あの[l][er]

#protagonist
ん？[l][er]

#otaku
前から——聞きたいことがあったんです[l][er]

#protagonist
何？[l][er]

#otaku
私のこと——どう思いますか[l][er]

#protagonist
どうって？[l][er]

#otaku
その……女性として[l][er]

#protagonist
……[l][er]

（彼女の顔が、赤くなっている。）[l][er]

#otaku
私、こんな体になって——[l][er]

#otaku
女性として見てもらえないと思ってました[l][er]

#protagonist
……[l][er]

#otaku
でも、あなたは——[l][er]

#otaku
ずっと、そばにいてくれた[l][er]

#protagonist
……[l][er]

#otaku
だから——知りたいんです[l][er]

#otaku
私のこと、どう思っていますか[l][er]

[chara_hide name="otaku" time="1000"]

; ================================================================================
*otaku_04_scene_2
; シーン2：返事
; ================================================================================

[bg storage="science_prep_room.png" time="1000"]

[glink target="otaku_ending_good" text="好きだ"]
[glink target="otaku_ending_normal" text="研究パートナーとして大事だ"]
[s]

; ================================================================================
; ■ オタクルート - グッドエンディング「未知への旅」
; ================================================================================

*otaku_ending_good
#protagonist
好きだ[l][er]

[chara_show name="otaku" face="surprised" pos="center" time="1000"]

#otaku
……！[l][er]

#protagonist
研究者として尊敬してる[l][er]

#protagonist
でも、それだけじゃない[l][er]

#protagonist
お前のこと——女性として、好きだ[l][er]

#otaku
……[l][er]

#protagonist
真実を求める姿勢[l][er]

#protagonist
怖くても逃げない強さ[l][er]

#protagonist
そういうところが——好きだ[l][er]

#otaku
……[l][er]

（彼女の目から、涙がこぼれた。）[l][er]

#otaku
……嬉しいです[l][er]

#otaku
私——今まで、誰かに好きと言われたことなくて[l][er]

#protagonist
……[l][er]

#otaku
変わり者だから。研究ばかりしてるから[l][er]

#otaku
誰も、私を見てくれないと思ってました[l][er]

#protagonist
見てる[l][er]

#protagonist
俺は、ずっと見てた[l][er]

#otaku
……ありがとうございます[l][er]

（俺は、彼女の手を握った。）[l][er]

#protagonist
これからも——一緒に研究しよう[l][er]

#otaku
はい[l][er]

#otaku
——一緒に[l][er]

[chara_hide name="otaku" time="1000"]

; ================================================================================
*otaku_ending_good_epilogue
; エピローグ
; ================================================================================

[bg storage="science_prep_room.png" time="1000"]
[playbgm storage="bgm_romance.mp3"]

（数ヶ月後。）[l][er]

（俺たちは、まだ研究を続けている。）[l][er]

（限界点の問題は——まだ解決していない。）[l][er]

（でも——）[l][er]

[chara_show name="otaku" face="smile" pos="center" time="1000"]

#otaku
新しい発見です！[l][er]

#protagonist
何？[l][er]

#otaku
筋肉の成長を抑制する方法の糸口が——[l][er]

#protagonist
本当か？[l][er]

#otaku
はい！これなら、限界点を遅らせられるかも——[l][er]

（彼女の目が、キラキラしている。）[l][er]

#protagonist
……すごいな[l][er]

#otaku
あなたのおかげです[l][er]

#otaku
一人だったら、諦めてました[l][er]

#protagonist
俺は何もしてない[l][er]

#otaku
いいえ[l][er]

#otaku
そばにいてくれた[l][er]

#otaku
それだけで——十分です[l][er]

（彼女は、俺の手を握った。）[l][er]

#otaku
これからも——一緒に、未知を探求しましょう[l][er]

#protagonist
ああ[l][er]

#protagonist
どこまでも、一緒に[l][er]

[chara_hide name="otaku" time="1000"]

[bg storage="black.png" time="1000"]

（——オタク。本名、神崎理香。）[l][er]

（真実を求める研究者。）[l][er]

（彼女と俺は——一緒に、未知への旅を続ける。）[l][er]

（答えが見つかるまで。）[l][er]

（いや——答えが見つかっても。）[l][er]

（ずっと、一緒に。）[l][er]

（END - 「未知への旅」）[l][er]

[s]

; ================================================================================
; ■ オタクルート - ノーマルエンディング「最高の研究パートナー」
; ================================================================================

*otaku_ending_normal
#protagonist
……大事な研究パートナーだ[l][er]

[chara_show name="otaku" face="default" pos="center" time="1000"]

#otaku
……そうですか[l][er]

#protagonist
お前のおかげで、俺たちは真実に近づけた[l][er]

#protagonist
感謝してる[l][er]

#otaku
……[l][er]

（彼女は、少し俯いた。）[l][er]

（でも——顔を上げた時、笑っていた。）[l][er]

#otaku
……わかりました[l][er]

#otaku
研究パートナーとして——これからもよろしくお願いします[l][er]

#protagonist
ああ[l][er]

#otaku
私——一人で研究してた時は、孤独でした[l][er]

#otaku
でも、あなたがいてくれて——[l][er]

#otaku
それだけで、幸せです[l][er]

#protagonist
……[l][er]

（俺は、彼女の手を握った。）[l][er]

#protagonist
これからも——一緒に研究しよう[l][er]

#otaku
はい[l][er]

[chara_hide name="otaku" time="1000"]

; ================================================================================
*otaku_ending_normal_epilogue
; エピローグ
; ================================================================================

[bg storage="science_prep_room.png" time="1000"]
[playbgm storage="bgm_daily.mp3"]

（数ヶ月後。）[l][er]

（俺たちは、まだ研究を続けている。）[l][er]

[chara_show name="otaku" face="smile" pos="center" time="1000"]

#otaku
今日も実験、お願いします[l][er]

#protagonist
ああ[l][er]

#otaku
記録係——頼りにしてます[l][er]

#protagonist
任せろ[l][er]

（彼女は、笑った。）[l][er]

（研究者としての笑顔。）[l][er]

（俺たちは、最高のパートナーだ。）[l][er]

（恋人じゃないけど——それ以上の絆がある。）[l][er]

#otaku
いつか——真実を見つけましょう[l][er]

#protagonist
ああ[l][er]

#protagonist
必ず[l][er]

[chara_hide name="otaku" time="1000"]

[bg storage="black.png" time="1000"]

（——オタク。本名、神崎理香。）[l][er]

（真実を求める研究者。）[l][er]

（彼女と俺は——最高の研究パートナー。）[l][er]

（いつか真実を見つける。）[l][er]

（その日まで——一緒に歩き続ける。）[l][er]

（END - 「最高の研究パートナー」）[l][er]

[s]
