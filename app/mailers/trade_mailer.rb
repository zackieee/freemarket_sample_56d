class TradeMailer < ApplicationMailer

  #【出品者】取引開始時に送信されるメール
  def sold_out_notice(trade)
    @trade = trade
    mail  to: @trade.seller.email,
          subject: "【freemaket.sample.d56】#{@trade.product.name}の発送をお願いいたします"
  end

  #【購入者】取引開始時に送信されるメール
  def purchase_notice(trade)
    @trade = trade
    mail  to: @trade.buyer.email,
          subject: "【freemaket.sample.d56】ご購入ありがとうございます"
  end

  #【購入者】商品発送時に送信されるメール
  def product_sending_notice(trade)
    @trade = trade
    mail  to: @trade.buyer.email,
          subject: "【freemaket.sample.d56】#{@trade.seller.nickname}さんから#{@trade.product.name}が発送されました"
  end

  #【出品者】購入者が評価をしたら送信されるメール
  def seller_raiting_notice(trade)
    @trade = trade
    mail  to: @trade.seller.email,
          subject: "【freemaket.sample.d56】#{@trade.buyer.nickname}さんの評価をお願いします"
  end

  #【購入者】出品者が評価をしたら送信されるメール
  def buyer_raiting_notice(trade)
    @trade = trade
    mail  to: @trade.buyer.email,
          subject: "【freemaket.sample.d56】#{@trade.seller.nickname}さんがあなたを評価しました"
  end

  #【出品者】出品者が評価をしたら送信されるメール
  def trade_close_notice(trade)
    @trade = trade
    mail  to: @trade.seller.email,
          subject: "【freemaket.sample.d56】取引が完了しました"
  end

end
