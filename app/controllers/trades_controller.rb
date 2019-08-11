class TradesController < ApplicationController

  def create
    product = Product.find(trade_params[:product_id])
    trade = Trade.create(product_id: product[:id], seller_id: product[:seller_id], buyer_id: 2)  #ログイン機能ができたら、'current_user.id'に変更
    
    # Payjp.api_key = 'Payjp の画面から取得した秘密鍵'
    # Payjp::Charge.create(
    #   amount: product[:price],      # 決済する値段
    #   card: params['payjp-token'],
    #   currency: 'jpy'
    # )

    

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
