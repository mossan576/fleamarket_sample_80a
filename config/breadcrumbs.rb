crumb :root do
  link "トップページ", root_path
end

crumb :mypage do
  link "マイページ", user_path(current_user.id)
end

crumb :favorite do
  link "お気に入り一覧", favorites_users_path
  parent :mypage
end

crumb :listed_items do
  link "出品した商品一覧", listed_items_users_path
  parent :mypage
end 

crumb :purchased_items do
  link "購入した商品一覧", purchased_items_users_path
  parent :mypage
end 