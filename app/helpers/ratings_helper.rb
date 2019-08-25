module RatingsHelper

  def rating_check(rate)
    case rate.rate
    when 1
      icon 'fas', 'smile', class: "good"
    when 2
      icon 'fas', 'meh', class: "normal"
    when 3
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
