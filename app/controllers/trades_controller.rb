class TradesController < ApplicationController

  def create
    product = Product.find(trade_params[:product_id])
    trade = Trade.new(product_id: product[:id], seller_id: product[:seller_id], buyer_id: current_user.id)  #ログイン機能ができたら、'current_user.id'に変更
    
    Payjp.api_key = Rails.application.credentials.payjp[:api_secret_key]
    binding.pry
    Payjp::Charge.create(
      amount: product[:price],
      card: params['payjp-token'],
      currency: 'jpy'
    )



    #処理が終わったら一覧画面へ
    if trade.save
      redirect_to products_path
    else
      redirect_to product_path(product[:id])
    end
  end

  private
  def trade_params
    params.permit(:product_id)
  end

end
