json.array! @ratings do | rate |
  json.rater_id            rate.rater_user_id
  json.rater_nickname      rate.rater_user.nickname
  
  if rate.rater_user.avatar.attached?
    json.rater_avatar        url_for(rate.rater_user.avatar)
  else
    json.rater_avatar        "assets/common/member_photo_noimage_thumb.png"
  end

  json.stance              stance_check(rate)
  json.comment             rate.comment
  json.created_at          rate.created_at.strftime("%m月%d日 %H:%M")

  case rate.rate
  when 1
    json.rate 'fa-smile good'
  when 2
    json.rate 'fa-meh normal'
  when 3
    json.rate 'fa-frown bad'
  end

end