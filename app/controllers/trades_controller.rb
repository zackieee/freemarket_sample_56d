class TradesController < ApplicationController

  def create
    product = Product.find(trade_params[:product_id])
    # カード決済
    card = Card.where(user_id: current_user.card).first
    Payjp.api_key = Rails.application.credentials.payjp[:api_secret_key]
    card_pay = Payjp::Charge.create(
      amount: product[:price],
      customer: card.customer_id,
      currency: 'jpy'
    )
    # 購入情報を作成
    trade = Trade.new(product_id: product[:id], seller_id: product[:seller_id], buyer_id: current_user.id, pay_id: card_pay[:id])

    # 商品を売り切れにする
    product[:sales_status_id] += 1

    # 売上金の登録
    seller = User.find(product[:seller_id])
    seller[:sales_amount] += card_pay[:amount]

    #処理が終わったら一覧画面へ
    if trade.save
      seller.save
      product.save

      redirect_to products_path
    else
      redirect_to product_path(product[:id]), alert: '購入できませんでした'
    end
  end

  private
  def trade_params
    params.permit(:product_id)
  end

end
