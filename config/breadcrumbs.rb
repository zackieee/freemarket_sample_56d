crumb :root do
  link "メルカリ", root_path
end

crumb :mypage do
  link "マイページ", user_path(current_user)
end

crumb :notice_index do
  link "お知らせ", notifications_path
end

crumb :todo_index do
  link "やることリスト", notifications_index_todo_path
  parent :mypage
end

crumb :favorites_index do
  link "いいね！一覧", product_favorites_path
  parent :mypage
end

crumb :selling_index do
  link "出品した商品-出品中", products_selling_index_path
  parent :mypage
end
 
crumb :buyout_index do
  link "出品した商品-売却済み", products_buyout_index_path
  parent :mypage
end

crumb :active_index do
  link "購入した商品-取引中", trade_active_index_path
  parent :mypage
end

crumb :close_index do
  link "購入した商品-過去の取引", trade_close_index_path
  parent :mypage
end
 
crumb :edit_profile do
  link "プロフィール", users_edit_profile_path
  parent :mypage
end

# TODO:current_user以外の場合は記述変更する必要性あり。やり方は今後検討
crumb :show_profile do
  link current_user&.nickname, show_profile_user_path
  parent :root
end

crumb :edit_address do
  link "発送元・お届け先住所変更", users_edit_address_path
  parent :mypage
end
 
crumb :edit_payment do
  link "支払い方法", users_edit_payment_path
  parent :mypage
end

crumb :edit_payment_2 do
  link "クレジットカード情報入力", users_edit_payment_2_path
  parent :edit_payment
end
 
crumb :edit_password do
  link "メール/パスワード", users_edit_password_path
  parent :mypage
end
 
crumb :edit_account do
  link "本人確認", users_edit_account_path
  parent :mypage
end
 
crumb :edit_telephone do
  link "電話番号の確認", users_edit_telephone_path
  parent :mypage
end

crumb :edit_telephone_auth do
  link "電話番号認証", users_edit_telephone_auth_path
  parent :edit_telephone
end

crumb :sign_out do
  link "ログアウト", users_sign_out_path
  parent :mypage
end

crumb :trade_show do
  link "取引画面", product_trade_path
  parent :mypage
end