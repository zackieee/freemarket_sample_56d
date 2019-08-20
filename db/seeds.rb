# coding: utf-8
require "csv"

# ブランドテーブル作成

CSV.foreach('db/brand_csv/ladies.csv', headers: true) do |row|
  Brand.create(name: row['name'])
end
CSV.foreach('db/brand_csv/mens.csv', headers: true) do |row|
  Brand.create(name: row['name'])
end
CSV.foreach('db/brand_csv/baby.csv', headers: true) do |row|
  Brand.create(name: row['name'])
end
CSV.foreach('db/brand_csv/interior.csv', headers: true) do |row|
  Brand.create(name: row['name'])
end
CSV.foreach('db/brand_csv/kitchen.csv', headers: true) do |row|
  Brand.create(name: row['name'])
end
CSV.foreach('db/brand_csv/clock.csv', headers: true) do |row|
  Brand.create(name: row['name'])
end
CSV.foreach('db/brand_csv/cosme.csv', headers: true) do |row|
  Brand.create(name: row['name'])
end
CSV.foreach('db/brand_csv/game.csv', headers: true) do |row|
  Brand.create(name: row['name'])
end
CSV.foreach('db/brand_csv/sports.csv', headers: true) do |row|
  Brand.create(name: row['name'])
end
CSV.foreach('db/brand_csv/appliances.csv', headers: true) do |row|
  Brand.create(name: row['name'])
end
CSV.foreach('db/brand_csv/car.csv', headers: true) do |row|
  Brand.create(name: row['name'])
end
CSV.foreach('db/brand_csv/musical_instrument.csv', headers: true) do |row|
  Brand.create(name: row['name'])
end
CSV.foreach('db/brand_csv/drink.csv', headers: true) do |row|
  Brand.create(name: row['name'])
end


# カテゴリテーブル作成
#   親カラム
ladies, mens, baby, interior, books, toys, cosme, appliances, sports, handmade, ticket, cars, other = \
Category.create([
                 {name: "レディース"},
                 {name: "メンズ"},
                 {name: "ベビー・キッズ"},
                 {name: "インテリア・住まい・小物"},
                 {name: "本・音楽・ゲーム"},
                 {name: "おもちゃ・ホビー・グッズ"},
                 {name: "コスメ・香水・美容"},
                 {name: "家電・スマホ・カメラ"},
                 {name: "スポーツ・レジャー"},
                 {name: "ハンドメイド"},
                 {name: "チケット"},
                 {name: "自動車・オートバイ"},
                 {name: "その他"}
                ])
#   子カラム
l_tops, l_jacket, l_pants, l_skirt, l_onepiece, l_shoes, l_pajamas, l_legwear, l_hat, l_bag, l_accessories, l_hair_accessory, l_small_article, l_clock, l_wig, l_yukata, l_suit, l_maternity, l_other = \
ladies.children.create([
                 {name: "トップス"},
                 {name: "ジャケット/アウター"},
                 {name: "パンツ"},
                 {name: "スカート"},
                 {name: "ワンピース"},
                 {name: "靴"},
                 {name: "ルームウェア/パジャマ"},
                 {name: "レッグウェア"},
                 {name: "帽子"},
                 {name: "バッグ"},
                 {name: "アクセサリー"},
                 {name: "ヘアアクセサリー"},
                 {name: "小物"},
                 {name: "時計"},
                 {name: "ウィッグ/エクステ"},
                 {name: "浴衣/水着"},
                 {name: "スーツ/フォーマル/ドレス"},
                 {name: "マタニティ"},
                 {name: "その他"}
                ])

m_tops, m_jacket, m_pants, m_shoes, m_bag, m_suit, m_hat, m_accessories, m_small_article, m_clock, m_swimsuit, m_leg_wear, m_underwear, m_other = \
mens.children.create([
                 {name: "トップス"},
                 {name: "ジャケット/アウター"},
                 {name: "パンツ"},
                 {name: "靴"},
                 {name: "バッグ"},
                 {name: "スーツ"},
                 {name: "帽子"},
                 {name: "アクセサリー"},
                 {name: "小物"},
                 {name: "時計"},
                 {name: "水着"},
                 {name: "レッグウェア"},
                 {name: "アンダーウェア"},
                 {name: "その他"}
                ])

baby_g, baby_b, baby_u, kids_g, kids_b, kids_u, kids_shoes, kids_accessories, diapers, babycar, baby_food, baby_bed, kids_toy, kids_event, baby_other = \
baby.children.create([
                 {name: "ベビー服(女の子用) ~95cm"},
                 {name: "ベビー服(男の子用) ~95cm"},
                 {name: "ベビー服(男女兼用) ~95cm"},
                 {name: "キッズ服(女の子用) 100cm~"},
                 {name: "キッズ服(男の子用) 100cm~"},
                 {name: "キッズ服(男女兼用) 100cm~"},
                 {name: "キッズ靴"},
                 {name: "子ども用ファッション小物"},
                 {name: "おむつ/トイレ/バス"},
                 {name: "外出/移動用品"},
                 {name: "授乳/食事"},
                 {name: "ベビー家具/寝具/室内用品"},
                 {name: "おもちゃ"},
                 {name: "行事/記念品"},
                 {name: "その他"}
                ])

kitchen, bed, sofa, chair, table, furniture, carpet, curtain, light, bedding, interior_accessories, interior_event, interior_other = \
interior.children.create([
                 {name: "キッチン/食器"},
                 {name: "ベッド/マットレス"},
                 {name: "ソファ/ソファベッド"},
                 {name: "椅子/チェア"},
                 {name: "机/テーブル"},
                 {name: "収納家具"},
                 {name: "ラグ/カーペット/マット"},
                 {name: "カーテン/ブラインド"},
                 {name: "ライト/照明"},
                 {name: "寝具"},
                 {name: "インテリア小物"},
                 {name: "季節/年中行事"},
                 {name: "その他"}
                ])

book, comic, magazine, cd, dvd, recode, tv_game = \
books.children.create([
                 {name: "本"},
                 {name: "漫画"},
                 {name: "雑誌"},
                 {name: "CD"},
                 {name: "DVD/ブルーレイ"},
                 {name: "レコード"},
                 {name: "テレビゲーム"}
                ])

toy, talent_goods, anime_goods, card_goods, figure, musical_instrument, collection, military, art, art_goods, toys_other = \
toys.children.create([
                 {name: "おもちゃ"},
                 {name: "タレントグッズ"},
                 {name: "コミック/アニメグッズ"},
                 {name: "トレーディングカード"},
                 {name: "フィギュア"},
                 {name: "楽器/器材"},
                 {name: "コレクション"},
                 {name: "ミリタリー"},
                 {name: "美術品"},
                 {name: "アート用品"},
                 {name: "その他"}
                ])

base, makeup, nail, perfume, skin_care, hear_care, body_care, oral_care, relaxation, diet, casme_other = \
cosme.children.create([
                 {name: "ベースメイク"},
                 {name: "メイクアップ"},
                 {name: "ネイルケア"},
                 {name: "香水"},
                 {name: "スキンケア/基礎化粧品"},
                 {name: "ヘアケア"},
                 {name: "ボディケア"},
                 {name: "オーラルケア"},
                 {name: "リラクゼーション"},
                 {name: "ダイエット"},
                 {name: "その他"}
                ])

mobile, mobile_accessories, pc, camera, tv, audio, beauty, cooler, house, appliances_other = \
appliances.children.create([
                 {name: "スマートフォン/携帯電話"},
                 {name: "スマホアクセサリー"},
                 {name: "PC/タブレット"},
                 {name: "カメラ"},
                 {name: "テレビ/映像機器"},
                 {name: "オーディオ機器"},
                 {name: "美容/健康"},
                 {name: "冷暖房/空調"},
                 {name: "生活家電"},
                 {name: "その他"}
                ])

golf, fishing, bicycle, training, baseball, football, tennis, snow_board, ski, other_sports, outdoor, sports_other = \
sports.children.create([
                 {name: "ゴルフ"},
                 {name: "フィッシング"},
                 {name: "自転車"},
                 {name: "トレーニング/エクササイズ"},
                 {name: "野球"},
                 {name: "サッカー/フットサル"},
                 {name: "テニス"},
                 {name: "スノーボード"},
                 {name: "スキー"},
                 {name: "その他スポーツ"},
                 {name: "アウトドア"},
                 {name: "その他"}
                ])

handmade_ladies, handmade_fashion, handmade_accessories, handmade_interior, handmade_toy, handmade_kids, handmade_material, secondary_creation, handmade_other = \
handmade.children.create([
                 {name: "アクセサリー(女性用)"},
                 {name: "ファッション/小物"},
                 {name: "アクセサリー/時計"},
                 {name: "日用品/インテリア"},
                 {name: "趣味/おもちゃ"},
                 {name: "キッズ/ベビー"},
                 {name: "素材/材料"},
                 {name: "二次創作物"},
                 {name: "その他"}
                ])

music_ticket, sports_ticket, theater_ticket, event_ticket, movie_ticket, facility_use_ticket, discount_ticket, ticket_other = \
ticket.children.create([
                 {name: "音楽"},
                 {name: "スポーツ"},
                 {name: "演劇/芸能"},
                 {name: "イベント"},
                 {name: "映画"},
                 {name: "施設利用券"},
                 {name: "優待券/割引券"},
                 {name: "その他"}
                ])

car_body, car_tire, car_parts, car_accessories, motorcycle_body, motorcycle_parts, motorcycle_accessories = \
cars.children.create([
                 {name: "自動車本体"},
                 {name: "自動車タイヤ/ホイール"},
                 {name: "自動車パーツ"},
                 {name: "自動車アクセサリー"},
                 {name: "オートバイ車体"},
                 {name: "オートバイパーツ"},
                 {name: "オートバイアクセサリー"}
                ])
pet, foot, drink, daily_necessities, collection, stationery, office, other_other = \
other.children.create([
                 {name: "ペット用品"},
                 {name: "食品"},
                 {name: "飲料/酒"},
                 {name: "日用品/生活雑貨/旅行"},
                 {name: "アンティーク/コレクション"},
                 {name: "文房具/事務用品"},
                 {name: "事務/店舗用品"},
                 {name: "その他"}
                ])

#   孫カラム

l_tops.children.create([
                 {name: "Tシャツ/カットソー(半袖/袖なし)"},
                 {name: "Tシャツ/カットソー(七分/長袖)"},
                 {name: "シャツ/ブラウス(半袖/袖なし)"},
                 {name: "シャツ/ブラウス(七分/長袖)"},
                 {name: "ポロシャツ"},
                 {name: "キャミソール"},
                 {name: "タンクトップ"},
                 {name: "ホルターネック"},
                 {name: "ニット/セーター"},
                 {name: "チュニック"},
                 {name: "カーディガン/ボレロ"},
                 {name: "アンサンブル"},
                 {name: "ベスト/ジレ"},
                 {name: "パーカー"},
                 {name: "トレーナー/スウェット"},
                 {name: "ベアトップ/チューブトップ"},
                 {name: "ジャージ"},
                 {name: "その他"}
                ])

l_jacket.children.create([
                  {name: "テーラードジャケット"},
                  {name: "ノーカラージャケット"},
                  {name: "Gジャン/デニムジャケット"},
                  {name: "レザージャケット"},
                  {name: "ダウンジャケット"},
                  {name: "ライダースジャケット"},
                  {name: "ミリタリージャケット"},
                  {name: "ダウンベスト"},
                  {name: "ジャンパー/ブルゾン"},
                  {name: "ポンチョ"},
                  {name: "ロングコート"},
                  {name: "トレンチコート"},
                  {name: "ダッフルコート"},
                  {name: "ピーコート"},
                  {name: "チェスターコート"},
                  {name: "モッズコート"},
                  {name: "スタジャン"},
                  {name: "毛皮/ファーコート"},
                  {name: "スプリングコート"},
                  {name: "スカジャン"},
                  {name: "その他"}
                 ])

l_pants.children.create([
                  {name: "デニム/ジーンズ"},
                  {name: "ショートパンツ"},
                  {name: "カジュアルパンツ"},
                  {name: "ハーフパンツ"},
                  {name: "チノパン"},
                  {name: "ワークパンツ/カーゴパンツ"},
                  {name: "クロップドパンツ"},
                  {name: "サロペット/オーバーオール"},
                  {name: "オールインワン"},
                  {name: "サルエルパンツ"},
                  {name: "ガウチョパンツ"},
                  {name: "その他"}
                 ])
                 
l_skirt.children.create([
                  {name: "ミニスカート"},
                  {name: "ひざ丈スカート"},
                  {name: "ロングスカート"},
                  {name: "キュロット"},
                  {name: "その他"}
                 ])

l_onepiece.children.create([
                  {name: "ミニワンピース"},
                  {name: "ひざ丈ワンピース"},
                  {name: "ロングワンピース"},
                  {name: "その他"}
                 ])

l_shoes.children.create([
                  {name: "ハイヒール/パンプス"},
                  {name: "ブーツ"},
                  {name: "サンダル"},
                  {name: "スニーカー"},
                  {name: "ミュール"},
                  {name: "モカシン"},
                  {name: "ローファー/革靴"},
                  {name: "フラットシューズ/バレエシューズ"},
                  {name: "長靴/レインシューズ"},
                  {name: "その他"}
                 ])

l_pajamas.children.create([
                  {name: "パジャマ"},
                  {name: "ルームウェア"}
                 ])

l_legwear.children.create([
                  {name: "ソックス"},
                  {name: "スパッツ/レギンス"},
                  {name: "ストッキング/タイツ"},
                  {name: "レッグウォーマー"},
                  {name: "その他"}
                 ])

l_hat.children.create([
                  {name: "ニットキャップ/ビーニー"},
                  {name: "ハット"},
                  {name: "ハンチング/ベレー帽"},
                  {name: "キャップ"},
                  {name: "キャスケット"},
                  {name: "麦わら帽子"},
                  {name: "その他"}
                 ])

l_bag.children.create([
                  {name: "ハンドバッグ"},
                  {name: "トートバッグ"},
                  {name: "エコバッグ"},
                  {name: "リュック/バックパック"},
                  {name: "ボストンバッグ"},
                  {name: "スポーツバッグ"},
                  {name: "ショルダーバッグ"},
                  {name: "クラッチバッグ"},
                  {name: "ポーチ/バニティ"},
                  {name: "ボディバッグ/ウェストバッグ"},
                  {name: "マザーズバッグ"},
                  {name: "メッセンジャーバッグ"},
                  {name: "ビジネスバッグ"},
                  {name: "旅行用バッグ/キャリーバッグ"},
                  {name: "ショップ袋"},
                  {name: "和装用バッグ"},
                  {name: "かごバッグ"},
                  {name: "その他"}
                 ])

l_accessories.children.create([
                  {name: "ネックレス"},
                  {name: "ブレスレット"},
                  {name: "バングル/リストバンド"},
                  {name: "リング"},
                  {name: "ピアス(片耳用)"},
                  {name: "ピアス(両耳用)"},
                  {name: "イヤリング"},
                  {name: "アンクレット"},
                  {name: "ブローチ/コサージュ"},
                  {name: "チャーム"},
                  {name: "その他"}
                 ])

l_hair_accessory.children.create([
                  {name: "ヘアゴム/シュシュ"},
                  {name: "ヘアバンド/カチューシャ"},
                  {name: "ヘアピン"},
                  {name: "その他"}
                 ])

l_small_article.children.create([
                  {name: "長財布"},
                  {name: "折り財布"},
                  {name: "コインケース/小銭入れ"},
                  {name: "名刺入れ/定期入れ"},
                  {name: "キーケース"},
                  {name: "キーホルダー"},
                  {name: "手袋/アームカバー"},
                  {name: "ハンカチ"},
                  {name: "ベルト"},
                  {name: "マフラー/ショール"},
                  {name: "ストール/スヌード"},
                  {name: "バンダナ/スカーフ"},
                  {name: "ックウォーマー"},
                  {name: "サスペンダー"},
                  {name: "サングラス/メガネ"},
                  {name: "モバイルケース/カバー"},
                  {name: "手帳"},
                  {name: "イヤマフラー"},
                  {name: "傘"},
                  {name: "レインコート/ポンチョ"},
                  {name: "ミラー"},
                  {name: "タバコグッズ"},
                  {name: "その他"}
                 ])

l_clock.children.create([
                  {name: "腕時計(アナログ)"},
                  {name: "腕時計(デジタル)"},
                  {name: "ラバーベルト"},
                  {name: "レザーベルト"},
                  {name: "金属ベルト"},
                  {name: "その他"}
                 ])

l_wig.children.create([
                  {name: "前髪ウィッグ"},
                  {name: "ロングストレート"},
                  {name: "ロングカール"},
                  {name: "ショートストレート"},
                  {name: "ショートカール"},
                  {name: "その他"}
                 ])

l_yukata.children.create([
                  {name: "浴衣"},
                  {name: "着物"},
                  {name: "振袖"},
                  {name: "長襦袢/半襦袢"},
                  {name: "水着セパレート"},
                  {name: "水着ワンピース"},
                  {name: "水着スポーツ用"},
                  {name: "その他"}
                 ])

l_suit.children.create([
                  {name: "スカートスーツ上下"},
                  {name: "パンツスーツ上下"},
                  {name: "ドレス"},
                  {name: "パーティーバッグ"},
                  {name: "シューズ"},
                  {name: "ウェディング"},
                  {name: "その他"}
                 ])

l_maternity.children.create([
                  {name: "トップス"},
                  {name: "アウター"},
                  {name: "インナー"},
                  {name: "ワンピース"},
                  {name: "パンツ/スパッツ"},
                  {name: "スカート"},
                  {name: "パジャマ"},
                  {name: "授乳服"},
                  {name: "その他"}
                 ])
                 
l_other.children.create([
                  {name: "コスプレ"},
                  {name: "下着"},
                  {name: "その他"}
                 ])

m_tops.children.create([
                  {name: "Tシャツ/カットソー(半袖/袖なし)"},
                  {name: "Tシャツ/カットソー(七分/長袖)"},
                  {name: "シャツ"},
                  {name: "ポロシャツ"},
                  {name: "タンクトップ"},
                  {name: "ニット/セーター"},
                  {name: "パーカー"},
                  {name: "カーディガン"},
                  {name: "スウェット"},
                  {name: "ジャージ"},
                  {name: "ベスト"},
                  {name: "その他"}
                 ])

m_jacket.children.create([
                  {name: "テーラードジャケット"},
                  {name: "ノーカラージャケット"},
                  {name: "Gジャン/デニムジャケット"},
                  {name: "レザージャケット"},
                  {name: "ダウンジャケット"},
                  {name: "ライダースジャケット"},
                  {name: "ミリタリージャケット"},
                  {name: "ナイロンジャケット"},
                  {name: "フライトジャケット"},
                  {name: "ダッフルコート"},
                  {name: "ピーコート"},
                  {name: "ステンカラーコート"},
                  {name: "トレンチコート"},
                  {name: "モッズコート"},
                  {name: "チェスターコート"},
                  {name: "スタジャン"},
                  {name: "スカジャン"},
                  {name: "ブルゾン"},
                  {name: "マウンテンパーカー"},
                  {name: "ダウンベスト"},
                  {name: "ポンチョ"},
                  {name: "カバーオール"},
                  {name: "その他"}
                 ])

m_pants.children.create([
                  {name: "デニム/ジーンズ"},
                  {name: "ワークパンツ/カーゴパンツ"},
                  {name: "スラックス"},
                  {name: "チノパン"},
                  {name: "ショートパンツ"},
                  {name: "ペインターパンツ"},
                  {name: "サルエルパンツ"},
                  {name: "オーバーオール"},
                  {name: "その他"}
                 ])

m_shoes.children.create([
                  {name: "スニーカー"},
                  {name: "サンダル"},
                  {name: "ブーツ"},
                  {name: "モカシン"},
                  {name: "ドレス/ビジネス"},
                  {name: "長靴/レインシューズ"},
                  {name: "デッキシューズ"},
                  {name: "その他"}
                 ])

m_bag.children.create([
                  {name: "ショルダーバッグ"},
                  {name: "トートバッグ"},
                  {name: "ボストンバッグ"},
                  {name: "リュック/バックパック"},
                  {name: "ウエストポーチ"},
                  {name: "ボディーバッグ"},
                  {name: "ドラムバッグ"},
                  {name: "ビジネスバッグ"},
                  {name: "トラベルバッグ"},
                  {name: "メッセンジャーバッグ"},
                  {name: "エコバッグ"},
                  {name: "その他"}
                 ])

m_suit.children.create([
                  {name: "スーツジャケット"},
                  {name: "スーツベスト"},
                  {name: "スラックス"},
                  {name: "セットアップ"},
                  {name: "その他"}
                 ])

m_hat.children.create([
                  {name: "キャップ"},
                  {name: "ハット"},
                  {name: "ニットキャップ/ビーニー"},
                  {name: "ハンチング/ベレー帽"},
                  {name: "キャスケット"},
                  {name: "サンバイザー"},
                  {name: "その他"}
                 ])

m_accessories.children.create([
                  {name: "ネックレス"},
                  {name: "ブレスレット"},
                  {name: "バングル/リストバンド"},
                  {name: "リング"},
                  {name: "ピアス(片耳用)"},
                  {name: "ピアス(両耳用)"},
                  {name: "アンクレット"},
                  {name: "その他"}
                 ])

m_small_article.children.create([
                  {name: "長財布"},
                  {name: "折り財布"},
                  {name: "マネークリップ"},
                  {name: "コインケース/小銭入れ"},
                  {name: "名刺入れ/定期入れ"},
                  {name: "キーケース"},
                  {name: "キーホルダー"},
                  {name: "ネクタイ"},
                  {name: "手袋"},
                  {name: "ハンカチ"},
                  {name: "ベルト"},
                  {name: "マフラー"},
                  {name: "ストール"},
                  {name: "バンダナ"},
                  {name: "ネックウォーマー"},
                  {name: "サスペンダー"},
                  {name: "ウォレットチェーン"},
                  {name: "サングラス/メガネ"},
                  {name: "モバイルケース/カバー"},
                  {name: "手帳"},
                  {name: "ストラップ"},
                  {name: "ネクタイピン"},
                  {name: "カフリンクス"},
                  {name: "イヤマフラー"},
                  {name: "傘"},
                  {name: "レインコート"},
                  {name: "ミラー"},
                  {name: "タバコグッズ"},
                  {name: "その他"}
                 ])

m_clock.children.create([
                  {name: "腕時計(アナログ)"},
                  {name: "腕時計(デジタル)"},
                  {name: "ラバーベルト"},
                  {name: "レザーベルト"},
                  {name: "金属ベルト"},
                  {name: "その他"}
                 ])

m_swimsuit.children.create([
                  {name: "一般水着"},
                  {name: "スポーツ用"},
                  {name: "アクセサリー"},
                  {name: "その他"}
                 ])

m_leg_wear.children.create([
                  {name: "ソックス"},
                  {name: "レギンス/スパッツ"},
                  {name: "レッグウォーマー"},
                  {name: "その他"}
                 ])

m_underwear.children.create([
                  {name: "トランクス"},
                  {name: "ボクサーパンツ"},
                  {name: "その他"}
                 ])

baby_g.children.create([
                  {name: "トップス"},
                  {name: "アウター"},
                  {name: "パンツ"},
                  {name: "スカート"},
                  {name: "ワンピース"},
                  {name: "ベビードレス"},
                  {name: "おくるみ"},
                  {name: "下着/肌着"},
                  {name: "パジャマ"},
                  {name: "ロンパース"},
                  {name: "その他"}
                 ])

baby_b.children.create([
                  {name: "トップス"},
                  {name: "アウター"},
                  {name: "パンツ"},
                  {name: "おくるみ"},
                  {name: "下着/肌着"},
                  {name: "パジャマ"},
                  {name: "ロンパース"},
                  {name: "その他"}
                 ])

baby_u.children.create([
                  {name: "トップス"},
                  {name: "アウター"},
                  {name: "パンツ"},
                  {name: "おくるみ"},
                  {name: "下着/肌着"},
                  {name: "パジャマ"},
                  {name: "ロンパース"},
                  {name: "その他"}
                 ])

kids_g.children.create([
                  {name: "コート"},
                  {name: "ジャケット/上着"},
                  {name: "トップス(Tシャツ/カットソー)"},
                  {name: "トップス(トレーナー)"},
                  {name: "トップス(チュニック)"},
                  {name: "トップス(タンクトップ)"},
                  {name: "トップス(その他)"},
                  {name: "スカート"},
                  {name: "パンツ"},
                  {name: "ワンピース"},
                  {name: "セットアップ"},
                  {name: "パジャマ"},
                  {name: "フォーマル/ドレス"},
                  {name: "和服"},
                  {name: "浴衣"},
                  {name: "甚平"},
                  {name: "水着"},
                  {name: "その他"}
                 ])

kids_b.children.create([
                  {name: "コート"},
                  {name: "ジャケット/上着"},
                  {name: "トップス(Tシャツ/カットソー)"},
                  {name: "トップス(トレーナー)"},
                  {name: "トップス(その他)"},
                  {name: "パンツ"},
                  {name: "セットアップ"},
                  {name: "パジャマ"},
                  {name: "フォーマル/ドレス"},
                  {name: "和服"},
                  {name: "浴衣"},
                  {name: "甚平"},
                  {name: "水着"},
                  {name: "その他"}
                 ])

kids_u.children.create([
                  {name: "コート"},
                  {name: "ジャケット/上着"},
                  {name: "トップス(Tシャツ/カットソー)"},
                  {name: "トップス(トレーナー)"},
                  {name: "トップス(その他)"},
                  {name: "ボトムス"},
                  {name: "パジャマ"},
                  {name: "その他"}
                 ])

kids_shoes.children.create([
                  {name: "スニーカー"},
                  {name: "サンダル"},
                  {name: "ブーツ"},
                  {name: "長靴"},
                  {name: "その他"}
                 ])

kids_accessories.children.create([
                  {name: "靴下/スパッツ"},
                  {name: "帽子"},
                  {name: "エプロン"},
                  {name: "サスペンダー"},
                  {name: "タイツ"},
                  {name: "ハンカチ"},
                  {name: "バンダナ"},
                  {name: "ベルト"},
                  {name: "マフラー"},
                  {name: "傘"},
                  {name: "手袋"},
                  {name: "スタイ"},
                  {name: "バッグ"},
                  {name: "その他"}
                 ])

diapers.children.create([
                  {name: "おむつ用品"},
                  {name: "おまる/補助便座"},
                  {name: "トレーニングパンツ"},
                  {name: "ベビーバス"},
                  {name: "お風呂用品"},
                  {name: "その他"}
                 ])

babycar.children.create([
                  {name: "ベビーカー"},
                  {name: "抱っこひも/スリング"},
                  {name: "チャイルドシート"},
                  {name: "その他"}
                 ])

baby_food.children.create([
                  {name: "ミルク"},
                  {name: "ベビーフード"},
                  {name: "ベビー用食器"},
                  {name: "その他"}
                 ])

baby_bed.children.create([
                  {name: "ベッド"},
                  {name: "布団/毛布"},
                  {name: "イス"},
                  {name: "たんす"},
                  {name: "その他"}
                 ])

kids_toy.children.create([
                  {name: "おふろのおもちゃ"},
                  {name: "がらがら"},
                  {name: "オルゴール"},
                  {name: "ベビージム"},
                  {name: "手押し車/カタカタ"},
                  {name: "知育玩具"},
                  {name: "その他"}
                 ])

kids_event.children.create([
                  {name: "お宮参り用品"},
                  {name: "お食い初め用品"},
                  {name: "アルバム"},
                  {name: "手形/足形"},
                  {name: "その他"}
                 ])

baby_other.children.create([
                  {name: "母子手帳用品"},
                  {name: "その他"}
                 ])

kitchen.children.create([
                  {name: "食器"},
                  {name: "調理器具"},
                  {name: "収納/キッチン雑貨"},
                  {name: "弁当用品"},
                  {name: "カトラリー(スプーン等)"},
                  {name: "テーブル用品"},
                  {name: "容器"},
                  {name: "エプロン"},
                  {name: "アルコールグッズ"},
                  {name: "浄水機"},
                  {name: "その他"}
                 ])

bed.children.create([
                  {name: "セミシングルベッド"},
                  {name: "シングルベッド"},
                  {name: "セミダブルベッド"},
                  {name: "ダブルベッド"},
                  {name: "ワイドダブルベッド"},
                  {name: "クイーンベッド"},
                  {name: "キングベッド"},
                  {name: "脚付きマットレスベッド"},
                  {name: "マットレス"},
                  {name: "すのこベッド"},
                  {name: "ロフトベッド/システムベッド"},
                  {name: "簡易ベッド/折りたたみベッド"},
                  {name: "収納付き"},
                  {name: "その他"}
                 ])

sofa.children.create([
                  {name: "ソファセット"},
                  {name: "シングルソファ"},
                  {name: "ラブソファ"},
                  {name: "トリプルソファ"},
                  {name: "オットマン"},
                  {name: "コーナーソファ"},
                  {name: "ビーズソファ/クッションソファ"},
                  {name: "ローソファ/フロアソファ"},
                  {name: "ソファベッド"},
                  {name: "応接セット"},
                  {name: "ソファカバー"},
                  {name: "リクライニングソファ"},
                  {name: "その他"}
                 ])

chair.children.create([
                  {name: "一般"},
                  {name: "スツール"},
                  {name: "ダイニングチェア"},
                  {name: "ハイバックチェア"},
                  {name: "ロッキングチェア"},
                  {name: "座椅子"},
                  {name: "折り畳みイス"},
                  {name: "デスクチェア"},
                  {name: "その他"}
                 ])

table.children.create([
                  {name: "こたつ"},
                  {name: "カウンターテーブル"},
                  {name: "サイドテーブル"},
                  {name: "センターテーブル"},
                  {name: "ダイニングテーブル"},
                  {name: "座卓/ちゃぶ台"},
                  {name: "アウトドア用"},
                  {name: "パソコン用"},
                  {name: "事務机/学習机"},
                  {name: "その他"}
                 ])

furniture.children.create([
                  {name: "リビング収納"},
                  {name: "キッチン収納"},
                  {name: "玄関/屋外収納"},
                  {name: "バス/トイレ収納"},
                  {name: "本収納"},
                  {name: "本/CD/DVD収納"},
                  {name: "洋服タンス/押入れ収納"},
                  {name: "電話台/ファックス台"},
                  {name: "ドレッサー/鏡台"},
                  {name: "棚/ラック"},
                  {name: "ケース/ボックス"},
                  {name: "その他"}
                 ])

carpet.children.create([
                  {name: "ラグ"},
                  {name: "カーペット"},
                  {name: "ホットカーペット"},
                  {name: "玄関/キッチンマット"},
                  {name: "トイレ/バスマット"},
                  {name: "その他"}
                 ])

curtain.children.create([
                  {name: "カーテン"},
                  {name: "ブラインド"},
                  {name: "ロールスクリーン"},
                  {name: "のれん"},
                  {name: "その他"}
                 ])

light.children.create([
                  {name: "蛍光灯/電球"},
                  {name: "天井照明"},
                  {name: "フロアスタンド"},
                  {name: "その他"}
                 ])

bedding.children.create([
                  {name: "布団/毛布"},
                  {name: "枕"},
                  {name: "シーツ/カバー"},
                  {name: "その他"}
                 ])

interior_accessories.children.create([
                  {name: "ごみ箱"},
                  {name: "ウェルカムボード"},
                  {name: "オルゴール"},
                  {name: "クッション"},
                  {name: "クッションカバー"},
                  {name: "スリッパラック"},
                  {name: "ティッシュボックス"},
                  {name: "バスケット/かご"},
                  {name: "フォトフレーム"},
                  {name: "マガジンラック"},
                  {name: "モビール"},
                  {name: "花瓶"},
                  {name: "灰皿"},
                  {name: "傘立て"},
                  {name: "小物入れ"},
                  {name: "置時計"},
                  {name: "掛時計/柱時計"},
                  {name: "鏡(立て掛け式)"},
                  {name: "鏡(壁掛け式)"},
                  {name: "置物"},
                  {name: "風鈴"},
                  {name: "植物/観葉植物"},
                  {name: "その他"}
                 ])

interior_event.children.create([
                  {name: "正月"},
                  {name: "成人式"},
                  {name: "バレンタインデー"},
                  {name: "ひな祭り"},
                  {name: "子どもの日"},
                  {name: "母の日"},
                  {name: "父の日"},
                  {name: "サマーギフト/お中元"},
                  {name: "夏/夏休み"},
                  {name: "ハロウィン"},
                  {name: "敬老の日"},
                  {name: "七五三"},
                  {name: "お歳暮"},
                  {name: "クリスマス"},
                  {name: "冬一般"},
                  {name: "その他"}
                 ])

book.children.create([
                  {name: "文学/小説"},
                  {name: "人文/社会"},
                  {name: "ノンフィクション/教養"},
                  {name: "地図/旅行ガイド"},
                  {name: "ビジネス/経済"},
                  {name: "健康/医学"},
                  {name: "コンピュータ/IT"},
                  {name: "趣味/スポーツ/実用"},
                  {name: "住まい/暮らし/子育て"},
                  {name: "アート/エンタメ"},
                  {name: "洋書"},
                  {name: "絵本"},
                  {name: "参考書"},
                  {name: "その他"}
                 ])

comic.children.create([
                  {name: "全巻セット"},
                  {name: "少年漫画"},
                  {name: "少女漫画"},
                  {name: "青年漫画"},
                  {name: "女性漫画"},
                  {name: "同人誌"},
                  {name: "その他"}
                 ])

magazine.children.create([
                  {name: "アート/エンタメ/ホビー"},
                  {name: "ファッション"},
                  {name: "ニュース/総合"},
                  {name: "趣味/スポーツ"},
                  {name: "その他"}
                 ])

cd.children.create([
                  {name: "邦楽"},
                  {name: "洋楽"},
                  {name: "アニメ"},
                  {name: "クラシック"},
                  {name: "K-POP/アジア"},
                  {name: "キッズ/ファミリー"},
                  {name: "その他"}
                 ])

dvd.children.create([
                  {name: "外国映画"},
                  {name: "日本映画"},
                  {name: "アニメ"},
                  {name: "TVドラマ"},
                  {name: "ミュージック"},
                  {name: "スポーツ/フィットネス"},
                  {name: "キッズ/ファミリー"},
                  {name: "その他"}
                 ])

recode.children.create([
                  {name: "邦楽"},
                  {name: "洋楽"},
                  {name: "その他"}
                 ])

tv_game.children.create([
                  {name: "家庭用ゲーム本体"},
                  {name: "家庭用ゲームソフト"},
                  {name: "携帯用ゲーム本体"},
                  {name: "携帯用ゲームソフト"},
                  {name: "PCゲーム"},
                  {name: "その他"}
                 ])

toy.children.create([
                  {name: "キャラクターグッズ"},
                  {name: "ぬいぐるみ"},
                  {name: "小物/アクセサリー"},
                  {name: "模型/プラモデル"},
                  {name: "ミニカー"},
                  {name: "トイラジコン"},
                  {name: "プラモデル"},
                  {name: "ホビーラジコン"},
                  {name: "鉄道模型"},
                  {name: "その他"}
                 ])

talent_goods.children.create([
                  {name: "アイドル"},
                  {name: "ミュージシャン"},
                  {name: "タレント/お笑い芸人"},
                  {name: "スポーツ選手"},
                  {name: "その他"}
                 ])

anime_goods.children.create([
                  {name: "ストラップ"},
                  {name: "キーホルダー"},
                  {name: "バッジ"},
                  {name: "カード"},
                  {name: "クリアファイル"},
                  {name: "ポスター"},
                  {name: "タオル"},
                  {name: "その他"}
                 ])

card_goods.children.create([
                  {name: "遊戯王"},
                  {name: "マジック：ザ・ギャザリング"},
                  {name: "ポケモンカードゲーム"},
                  {name: "デュエルマスターズ"},
                  {name: "バトルスピリッツ"},
                  {name: "プリパラ"},
                  {name: "アイカツ"},
                  {name: "カードファイト!! ヴァンガード"},
                  {name: "ヴァイスシュヴァルツ"},
                  {name: "プロ野球オーナーズリーグ"},
                  {name: "ベースボールヒーローズ"},
                  {name: "ドラゴンボール"},
                  {name: "スリーブ"},
                  {name: "その他"}
                 ])

figure.children.create([
                  {name: "コミック/アニメ"},
                  {name: "特撮"},
                  {name: "ゲームキャラクター"},
                  {name: "SF/ファンタジー/ホラー"},
                  {name: "アメコミ"},
                  {name: "スポーツ"},
                  {name: "ミリタリー"},
                  {name: "その他"}
                 ])

musical_instrument.children.create([
                  {name: "エレキギター"},
                  {name: "アコースティックギター"},
                  {name: "ベース"},
                  {name: "エフェクター"},
                  {name: "アンプ"},
                  {name: "弦楽器"},
                  {name: "管楽器"},
                  {name: "鍵盤楽器"},
                  {name: "打楽器"},
                  {name: "和楽器"},
                  {name: "楽譜/スコア"},
                  {name: "レコーディング/PA機器"},
                  {name: "DJ機器"},
                  {name: "DTM/DAW"},
                  {name: "その他"}
                 ])

collection.children.create([
                  {name: "武具"},
                  {name: "使用済切手/官製はがき"},
                  {name: "旧貨幣/金貨/銀貨/記念硬貨"},
                  {name: "印刷物"},
                  {name: "ノベルティグッズ"},
                  {name: "その他"}
                 ])

military.children.create([
                  {name: "トイガン"},
                  {name: "個人装備"},
                  {name: "その他"}
                 ])

art.children.create([
                  {name: "陶芸"},
                  {name: "ガラス"},
                  {name: "漆芸"},
                  {name: "金属工芸"},
                  {name: "絵画/タペストリ"},
                  {name: "版画"},
                  {name: "彫刻/オブジェクト"},
                  {name: "書"},
                  {name: "写真"},
                  {name: "その他"}
                 ])

art_goods.children.create([
                  {name: "画材"},
                  {name: "額縁"},
                  {name: "その他"}
                 ])

toys_other.children.create([
                  {name: "トランプ/UNO"},
                  {name: "カルタ/百人一首"},
                  {name: "ダーツ"},
                  {name: "ビリヤード"},
                  {name: "麻雀"},
                  {name: "パズル/ジグソーパズル"},
                  {name: "囲碁/将棋"},
                  {name: "オセロ/チェス"},
                  {name: "人生ゲーム"},
                  {name: "野球/サッカーゲーム"},
                  {name: "スポーツ"},
                  {name: "三輪車/乗り物"},
                  {name: "ヨーヨー"},
                  {name: "模型製作用品"},
                  {name: "鉄道"},
                  {name: "航空機"},
                  {name: "アマチュア無線"},
                  {name: "パチンコ/パチスロ"},
                  {name: "その他"}
                 ]) 

base.children.create([
                  {name: "ファンデーション"},
                  {name: "化粧下地"},
                  {name: "コントロールカラー"},
                  {name: "BBクリーム"},
                  {name: "CCクリーム"},
                  {name: "コンシーラー"},
                  {name: "フェイスパウダー"},
                  {name: "トライアルセット/サンプル"},
                  {name: "その他"}
                 ])

makeup.children.create([
                  {name: "アイシャドウ"},
                  {name: "口紅"},
                  {name: "リップグロス"},
                  {name: "リップライナー"},
                  {name: "チーク"},
                  {name: "フェイスカラー"},
                  {name: "マスカラ"},
                  {name: "アイライナー"},
                  {name: "つけまつげ"},
                  {name: "アイブロウペンシル"},
                  {name: "パウダーアイブロウ"},
                  {name: "眉マスカラ"},
                  {name: "トライアルセット/サンプル"},
                  {name: "メイク道具/化粧小物"},
                  {name: "美顔用品/美顔ローラー"},
                  {name: "その他"}
                 ])

nail.children.create([
                  {name: "ネイルカラー"},
                  {name: "カラージェル"},
                  {name: "ネイルベースコート/トップコート"},
                  {name: "ネイルアート用品"},
                  {name: "ネイルパーツ"},
                  {name: "ネイルチップ/付け爪"},
                  {name: "手入れ用具"},
                  {name: "除光液"},
                  {name: "その他"}
                 ])

perfume.children.create([
                  {name: "香水(女性用)"},
                  {name: "香水(男性用)"},
                  {name: "ユニセックス"},
                  {name: "ボディミスト"},
                  {name: "その他"}
                 ])

skin_care.children.create([
                  {name: "化粧水/ローション"},
                  {name: "乳液/ミルク"},
                  {name: "美容液"},
                  {name: "フェイスクリーム"},
                  {name: "洗顔料"},
                  {name: "クレンジング/メイク落とし"},
                  {name: "パック/フェイスマスク"},
                  {name: "ジェル/ゲル"},
                  {name: "ブースター/導入液"},
                  {name: "アイケア"},
                  {name: "リップケア"},
                  {name: "トライアルセット/サンプル"},
                  {name: "洗顔グッズ"},
                  {name: "その他"}
                 ])

hear_care.children.create([
                  {name: "シャンプー"},
                  {name: "トリートメント"},
                  {name: "コンディショナー"},
                  {name: "リンス"},
                  {name: "スタイリング剤"},
                  {name: "カラーリング剤"},
                  {name: "ブラシ"},
                  {name: "その他"}
                 ])

body_care.children.create([
                  {name: "オイル/クリーム"},
                  {name: "ハンドクリーム"},
                  {name: "ローション"},
                  {name: "日焼け止め/サンオイル"},
                  {name: "ボディソープ"},
                  {name: "入浴剤"},
                  {name: "制汗/デオドラント"},
                  {name: "フットケア"},
                  {name: "その他"}
                 ])

oral_care.children.create([
                  {name: "口臭防止/エチケット用品"},
                  {name: "歯ブラシ"},
                  {name: "その他"}
                 ])

relaxation.children.create([
                  {name: "エッセンシャルオイル"},
                  {name: "芳香器"},
                  {name: "お香/香炉"},
                  {name: "キャンドル"},
                  {name: "リラクゼーショングッズ"},
                  {name: "その他"}
                 ])

diet.children.create([
                  {name: "ダイエット食品"},
                  {name: "エクササイズ用品"},
                  {name: "体重計"},
                  {name: "体脂肪計"},
                  {name: "その他"}
                 ])

casme_other.children.create([
                  {name: "健康用品"},
                  {name: "看護/介護用品"},
                  {name: "救急/衛生用品"},
                  {name: "その他"}
                 ])

mobile.children.create([
                  {name: "スマートフォン本体"},
                  {name: "バッテリー/充電器"},
                  {name: "携帯電話本体"},
                  {name: "PHS本体"},
                  {name: "その他"}
                 ])

mobile_accessories.children.create([
                  {name: "Android用ケース"},
                  {name: "iPhone用ケース"},
                  {name: "カバー"},
                  {name: "イヤホンジャック"},
                  {name: "ストラップ"},
                  {name: "フィルム"},
                  {name: "自撮り棒"},
                  {name: "その他"}
                 ])

pc.children.create([
                  {name: "タブレット"},
                  {name: "ノートPC"},
                  {name: "デスクトップ型PC"},
                  {name: "ディスプレイ"},
                  {name: "電子ブックリーダー"},
                  {name: "PC周辺機器"},
                  {name: "PCパーツ"},
                  {name: "その他"}
                 ])

camera.children.create([
                  {name: "デジタルカメラ"},
                  {name: "ビデオカメラ"},
                  {name: "レンズ(単焦点)"},
                  {name: "レンズ(ズーム)"},
                  {name: "フィルムカメラ"},
                  {name: "防犯カメラ"},
                  {name: "その他"}
                 ])

tv.children.create([
                  {name: "テレビ"},
                  {name: "プロジェクター"},
                  {name: "ブルーレイレコーダー"},
                  {name: "DVDレコーダー"},
                  {name: "ブルーレイプレーヤー"},
                  {name: "DVDプレーヤー"},
                  {name: "映像用ケーブル"},
                  {name: "その他"}
                 ])

audio.children.create([
                  {name: "ポータブルプレーヤー"},
                  {name: "イヤフォン"},
                  {name: "ヘッドフォン"},
                  {name: "アンプ"},
                  {name: "スピーカー"},
                  {name: "ケーブル/シールド"},
                  {name: "ラジオ"},
                  {name: "その他"}
                 ])

beauty.children.create([
                  {name: "ヘアドライヤー"},
                  {name: "ヘアアイロン"},
                  {name: "美容機器"},
                  {name: "電気シェーバー"},
                  {name: "電動歯ブラシ"},
                  {name: "その他"}
                 ])

cooler.children.create([
                  {name: "エアコン"},
                  {name: "空気清浄器"},
                  {name: "加湿器"},
                  {name: "扇風機"},
                  {name: "除湿機"},
                  {name: "ファンヒーター"},
                  {name: "電気ヒーター"},
                  {name: "オイルヒーター"},
                  {name: "ストーブ"},
                  {name: "ホットカーペット"},
                  {name: "こたつ"},
                  {name: "電気毛布"},
                  {name: "その他"}
                 ])

house.children.create([
                  {name: "冷蔵庫"},
                  {name: "洗濯機"},
                  {name: "炊飯器"},
                  {name: "電子レンジ/オーブン"},
                  {name: "調理機器"},
                  {name: "アイロン"},
                  {name: "掃除機"},
                  {name: "エスプレッソマシン"},
                  {name: "コーヒーメーカー"},
                  {name: "衣類乾燥機"},
                  {name: "その他"}
                 ]) 

golf.children.create([
                  {name: "クラブ"},
                  {name: "ウエア(男性用)"},
                  {name: "ウエア(女性用)"},
                  {name: "バッグ"},
                  {name: "シューズ(男性用)"},
                  {name: "シューズ(女性用)"},
                  {name: "アクセサリー"},
                  {name: "その他"}
                 ])

fishing.children.create([
                  {name: "ロッド"},
                  {name: "リール"},
                  {name: "ルアー用品"},
                  {name: "ウエア"},
                  {name: "釣り糸/ライン"},
                  {name: "その他"}
                 ])

bicycle.children.create([
                  {name: "自転車本体"},
                  {name: "ウエア"},
                  {name: "パーツ"},
                  {name: "アクセサリー"},
                  {name: "バッグ"},
                  {name: "工具/メンテナンス"},
                  {name: "その他"}
                 ])

training.children.create([
                  {name: "ランニング"},
                  {name: "ウォーキング"},
                  {name: "ヨガ"},
                  {name: "トレーニング用品"},
                  {name: "その他"}
                 ])

baseball.children.create([
                  {name: "ウェア"},
                  {name: "シューズ"},
                  {name: "グローブ"},
                  {name: "バット"},
                  {name: "アクセサリー"},
                  {name: "防具"},
                  {name: "練習機器"},
                  {name: "記念グッズ"},
                  {name: "応援グッズ"},
                  {name: "その他"}
                 ])

football.children.create([
                  {name: "ウェア"},
                  {name: "シューズ"},
                  {name: "ボール"},
                  {name: "アクセサリー"},
                  {name: "記念グッズ"},
                  {name: "応援グッズ"},
                  {name: "その他"}
                 ])

tennis.children.create([
                  {name: "ラケット(硬式用)"},
                  {name: "ラケット(軟式用)"},
                  {name: "ウェア"},
                  {name: "シューズ"},
                  {name: "ボール"},
                  {name: "アクセサリー"},
                  {name: "記念グッズ"},
                  {name: "応援グッズ"},
                  {name: "その他"}
                 ])

snow_board.children.create([
                  {name: "ボード"},
                  {name: "バインディング"},
                  {name: "ブーツ(男性用)"},
                  {name: "ブーツ(女性用)"},
                  {name: "ブーツ(子ども用)"},
                  {name: "ウエア/装備(男性用)"},
                  {name: "ウエア/装備(女性用)"},
                  {name: "ウエア/装備(子ども用)"},
                  {name: "アクセサリー"},
                  {name: "バッグ"},
                  {name: "その他"}
                 ])

ski.children.create([
                  {name: "板"},
                  {name: "ブーツ(男性用)"},
                  {name: "ブーツ(女性用)"},
                  {name: "ブーツ(子ども用)"},
                  {name: "ビンディング"},
                  {name: "ウエア(男性用)"},
                  {name: "ウエア(女性用)"},
                  {name: "ウエア(子ども用)"},
                  {name: "ストック"},
                  {name: "その他"}
                 ])

other_sports.children.create([
                  {name: "ダンス/バレエ"},
                  {name: "サーフィン"},
                  {name: "バスケットボール"},
                  {name: "バドミントン"},
                  {name: "バレーボール"},
                  {name: "スケートボード"},
                  {name: "陸上競技"},
                  {name: "ラグビー"},
                  {name: "アメリカンフットボール"},
                  {name: "ボクシング"},
                  {name: "ボウリング"},
                  {name: "その他"}
                 ])

outdoor.children.create([
                  {name: "テント/タープ"},
                  {name: "ライト/ランタン"},
                  {name: "寝袋/寝具"},
                  {name: "テーブル/チェア"},
                  {name: "ストーブ/コンロ"},
                  {name: "調理器具"},
                  {name: "食器"},
                  {name: "登山用品"},
                  {name: "その他"}
                 ])

sports_other.children.create([
                  {name: "旅行用品"},
                  {name: "その他"}
                 ])

handmade_ladies.children.create([
                  {name: "ピアス"},
                  {name: "イヤリング"},
                  {name: "ネックレス"},
                  {name: "ブレスレット"},
                  {name: "リング"},
                  {name: "チャーム"},
                  {name: "ヘアゴム"},
                  {name: "アンクレット"},
                  {name: "その他"}
                 ])

handmade_fashion.children.create([
                  {name: "バッグ(女性用)"},
                  {name: "バッグ(男性用)"},
                  {name: "財布(女性用)"},
                  {name: "財布(男性用)"},
                  {name: "ファッション雑貨"},
                  {name: "その他"}
                 ])

handmade_accessories.children.create([
                  {name: "アクセサリー(男性用)"},
                  {name: "時計(女性用)"},
                  {name: "時計(男性用)"},
                  {name: "その他"}
                 ])

handmade_interior.children.create([
                  {name: "キッチン用品"},
                  {name: "家具"},
                  {name: "文房具"},
                  {name: "アート/写真"},
                  {name: "アロマ/キャンドル"},
                  {name: "フラワー/ガーデン"},
                  {name: "その他"}
                 ])

handmade_toy.children.create([
                  {name: "クラフト/布製品"},
                  {name: "おもちゃ/人形"},
                  {name: "その他"}
                 ])

handmade_kids.children.create([
                  {name: "ファッション雑貨"},
                  {name: "スタイ/よだれかけ"},
                  {name: "外出用品"},
                  {name: "ネームタグ"},
                  {name: "その他"}
                 ])

handmade_material.children.create([
                  {name: "各種パーツ"},
                  {name: "生地/糸"},
                  {name: "型紙/パターン"},
                  {name: "その他"}
                 ])

secondary_creation.children.create([
                  {name: "Ingress"},
                  {name: "クリエイターズ宇宙兄弟"}
                 ])

music_ticket.children.create([
                  {name: "男性アイドル"},
                  {name: "女性アイドル"},
                  {name: "韓流"},
                  {name: "国内アーティスト"},
                  {name: "海外アーティスト"},
                  {name: "音楽フェス"},
                  {name: "声優/アニメ"},
                  {name: "その他"}
                 ])

sports_ticket.children.create([
                  {name: "サッカー"},
                  {name: "野球"},
                  {name: "テニス"},
                  {name: "格闘技/プロレス"},
                  {name: "相撲/武道"},
                  {name: "ゴルフ"},
                  {name: "バレーボール"},
                  {name: "バスケットボール"},
                  {name: "モータースポーツ"},
                  {name: "ウィンタースポーツ"},
                  {name: "その他"}
                 ])

theater_ticket.children.create([
                  {name: "ミュージカル"},
                  {name: "演劇"},
                  {name: "伝統芸能"},
                  {name: "落語"},
                  {name: "お笑い"},
                  {name: "オペラ"},
                  {name: "サーカス"},
                  {name: "バレエ"},
                  {name: "その他"}
                 ])

event_ticket.children.create([
                  {name: "声優/アニメ"},
                  {name: "キッズ/ファミリー"},
                  {name: "トークショー/講演会"},
                  {name: "その他"}
                 ])

movie_ticket.children.create([
                  {name: "邦画"},
                  {name: "洋画"},
                  {name: "その他"}
                 ])

facility_use_ticket.children.create([
                  {name: "遊園地/テーマパーク"},
                  {name: "美術館/博物館"},
                  {name: "スキー場"},
                  {name: "ゴルフ場"},
                  {name: "フィットネスクラブ"},
                  {name: "プール"},
                  {name: "ボウリング場"},
                  {name: "水族館"},
                  {name: "動物園"},
                  {name: "その他"}
                 ])

discount_ticket.children.create([
                  {name: "ショッピング"},
                  {name: "レストラン/食事券"},
                  {name: "フード/ドリンク券"},
                  {name: "宿泊券"},
                  {name: "その他"}
                 ])

car_body.children.create([
                  {name: "国内自動車本体"},
                  {name: "外国自動車本体"}
                 ])

car_tire.children.create([
                  {name: "タイヤ/ホイールセット"},
                  {name: "タイヤ"},
                  {name: "ホイール"},
                  {name: "その他"}
                 ])

car_parts.children.create([
                  {name: "サスペンション"},
                  {name: "ブレーキ"},
                  {name: "外装、エアロパーツ"},
                  {name: "ライト"},
                  {name: "内装品、シート"},
                  {name: "ステアリング"},
                  {name: "マフラー・排気系"},
                  {name: "エンジン、過給器、冷却装置"},
                  {name: "クラッチ、ミッション、駆動系"},
                  {name: "電装品"},
                  {name: "補強パーツ"},
                  {name: "汎用パーツ"},
                  {name: "外国自動車用パーツ"},
                  {name: "その他"}
                 ])

car_accessories.children.create([
                  {name: "車内アクセサリー"},
                  {name: "カーナビ"},
                  {name: "カーオーディオ"},
                  {name: "車外アクセサリー"},
                  {name: "メンテナンス用品"},
                  {name: "チャイルドシート"},
                  {name: "ドライブレコーダー"},
                  {name: "レーダー探知機"},
                  {name: "カタログ/マニュアル"},
                  {name: "セキュリティ"},
                  {name: "ETC"},
                  {name: "その他"}
                 ])

motorcycle_parts.children.create([
                  {name: "タイヤ"},
                  {name: "マフラー"},
                  {name: "エンジン、冷却装置"},
                  {name: "カウル、フェンダー、外装"},
                  {name: "サスペンション"},
                  {name: "ホイール"},
                  {name: "シート"},
                  {name: "ブレーキ"},
                  {name: "タンク"},
                  {name: "ライト、ウィンカー"},
                  {name: "チェーン、スプロケット、駆動系"},
                  {name: "メーター"},
                  {name: "電装系"},
                  {name: "ミラー"},
                  {name: "外国オートバイ用パーツ"},
                  {name: "その他"}
                 ])

motorcycle_accessories.children.create([
                  {name: "ヘルメット/シールド"},
                  {name: "バイクウエア/装備"},
                  {name: "アクセサリー"},
                  {name: "メンテナンス"},
                  {name: "カタログ/マニュアル"},
                  {name: "その他"}
                 ])

pet.children.create([
                  {name: "ペットフード"},
                  {name: "犬用品"},
                  {name: "猫用品"},
                  {name: "魚用品/水草"},
                  {name: "小動物用品"},
                  {name: "爬虫類/両生類用品"},
                  {name: "かご/おり"},
                  {name: "鳥用品"},
                  {name: "その他"}
                 ])

foot.children.create([
                  {name: "菓子"},
                  {name: "米"},
                  {name: "野菜"},
                  {name: "果物"},
                  {name: "調味料"},
                  {name: "魚介類(加工食品)"},
                  {name: "肉類(加工食品)"},
                  {name: "その他 加工食品"},
                  {name: "その他"}
                 ])

drink.children.create([
                  {name: "コーヒー"},
                  {name: "ソフトドリンク"},
                  {name: "ミネラルウォーター"},
                  {name: "茶"},
                  {name: "ウイスキー"},
                  {name: "ワイン"},
                  {name: "ブランデー"},
                  {name: "焼酎"},
                  {name: "日本酒"},
                  {name: "ビール、発泡酒"},
                  {name: "その他"}
                 ])

daily_necessities.children.create([
                  {name: "タオル/バス用品"},
                  {name: "日用品/生活雑貨"},
                  {name: "洗剤/柔軟剤"},
                  {name: "旅行用品"},
                  {name: "防災関連グッズ"},
                  {name: "その他"}
                 ])

collection.children.create([
                  {name: "雑貨"},
                  {name: "工芸品"},
                  {name: "家具"},
                  {name: "印刷物"},
                  {name: "その他"}
                 ])

stationery.children.create([
                  {name: "筆記具"},
                  {name: "ノート/メモ帳"},
                  {name: "テープ/マスキングテープ"},
                  {name: "カレンダー/スケジュール"},
                  {name: "アルバム/スクラップ"},
                  {name: "ファイル/バインダー"},
                  {name: "はさみ/カッター"},
                  {name: "カードホルダー/名刺管理"},
                  {name: "のり/ホッチキス"},
                  {name: "その他"}
                 ])

office.children.create([
                  {name: "オフィス用品一般"},
                  {name: "オフィス家具"},
                  {name: "店舗用品"},
                  {name: "OA機器"},
                  {name: "ラッピング/包装"},
                  {name: "その他"}
                 ])


