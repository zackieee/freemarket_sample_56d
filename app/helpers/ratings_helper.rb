module RatingsHelper

  def rating_check(rate)
    case rate[0]
    when "good"
      icon 'fas', 'smile', class: "good"
    when "normal"
      icon 'fas', 'meh', class: "normal"
    when "bad"
      icon 'fas', 'frown', class: "bad"
    end
  end

  def stance_check(rate)
    if rate.trade.product.seller == current_user.id
      '出品者'
    else
      '購入者'
    end
  end
end
