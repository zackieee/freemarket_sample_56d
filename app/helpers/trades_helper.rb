module TradesHelper
  def buyer_display_dispatcher(trade)
    html_text = ''
    case trade.trade_status
    when 0 # 発送待ち
      html_text += render(partial: 'trades/wait_product_sending',locals:{trade: @trade})
      return raw(html_text)
    when 1 # 受け取り評価画面
      html_text += render(partial: 'trades/bayer_rating',locals:{trade: @trade})
      return raw(html_text)
    when 2 # 出品者の評価待ち
      html_text += render(partial: 'trades/wait_seller_raiting',locals:{trade: @trade})
      return raw(html_text)
    when 3 #取引完了
      html_text += render(partial: 'trades/close',locals:{trade: @trade})
      return raw(html_text)
    end
  end

  def seller_display_dispatcher(trade)
    html_text = ''
    case trade.trade_status
    when 0 # 発送画面
      html_text += render(partial: 'trades/sending',locals:{trade: @trade})
      return raw(html_text)
    when 1 # 購入者の受け取り＋評価待ち
      html_text += render(partial: 'trades/watit_buyer_rating',locals:{trade: @trade})
      return raw(html_text)
    when 2 # 購入者の評価画面
      html_text += render(partial: 'trades/seller_rating',locals:{trade: @trade})
      return raw(html_text)
    when 3 # 取引完了
      html_text += render(partial: 'trades/close',locals:{trade: @trade})
      return raw(html_text)
    end
  end

end
