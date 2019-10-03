json.array! @ratings do | rate |
  json.rater_id            rate.rater_user_id
  json.rater_nickname      rate.rater_user.nickname

  if rate.rater_user.avatar.attached?
    json.rater_avatar        url_for(rate.rater_user.avatar)
  else
    json.rater_avatar        "/assets/common/member_photo_noimage_thumb-224a733c50d48aba6d9fdaded809788bbeb5ea5f6d6b8368adaebb95e58bcf53.png"
  end

  json.stance              stance_check(rate)
  json.comment             rate.comment
  json.created_at          rate.created_at.strftime("%m月%d日 %H:%M")

  json.rate
    case rate.rate
    when "good"
      json.rate 'fa-smile good'
    when "normal"
      json.rate 'fa-meh normal'
    when "bad"
      json.rate 'fa-frown bad'
    end

end