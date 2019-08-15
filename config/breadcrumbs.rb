crumb :root do
  link "メルカリ", root_path
end

crumb :mypage do
  link "マイページ", user_path(current_user)
end

crumb :selling_index do
  link "出品した商品-出品中", products_selling_index_path
  parent :mypage
end
 
crumb :buyout_index do
  link "出品した商品-売却済み", products_buyout_index_path
  parent :mypage
end
 
crumb :edit_profile do
  link "プロフィール", users_edit_profile_path
  parent :mypage
end
 
# パスがないものはコメントアウト
# crumb : do
#   link "発送元・お届け先住所変更",
#   parent :mypage
# end
 
crumb :edit_payment do
  link "支払い方法", users_edit_payment_path
  parent :mypage
end

crumb :edit_payment_2 do
  link "支払い方法", users_edit_payment_2_path
  parent :mypage
end
 
# crumb : do
#   link "メール/パスワード",
#   parent :mypage
# end
 
crumb :edit_account do
  link "本人確認", users_edit_account_path
  parent :mypage
end
 
# crumb : do
#   link "電話番号の確認",
#   parent :mypage
# end
 
crumb :sign_out do
  link "ログアウト", users_sign_out_path
  parent :mypage
end