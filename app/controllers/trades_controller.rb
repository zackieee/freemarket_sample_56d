class TradesController < ApplicationController
  before_action :notice_count,:todo_count, only: [:show,:update]

  def show
    @trade = Trade.find(params[:id])
  end

  def create
    @product = Product.find(trade_params[:product_id])
    # カード決済
    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = Rails.application.credentials.payjp[:api_secret_key]
    card_pay = Payjp::Charge.create(
      amount: @product[:price],
      customer: card.customer_id,
      currency: 'jpy'
    )
    # 購入情報を作成
    trade = Trade.new(product_id: @product[:id], seller_id: @product[:seller_id], buyer_id: current_user.id, pay_id: card_pay[:id])

    # 商品を売り切れにする
    @product[:sales_status_id] += 1
    unless @product.valid?(:sales_status_id)
      redirect_to product_path(@product[:id]), alert: '購入できませんでした'
      return
    end

    # 売上金の登録
    seller = User.find(@product[:seller_id])
    seller[:sales_amount] += card_pay[:amount]

    #処理が終わったら一覧画面へ
    if trade.save
      seller.save
      @product.save

      # 取引開始通知
      notice = Notification.create(
        sender_id:    trade.buyer_id,
        receiver_id:  trade.seller_id,
        trade_id:     trade.id,
        action:       5,
        title:        "#{trade.buyer.nickname}さんが「#{trade.product.name}」を購入しました。発送を行ってください"
      )
      # 購入完了通知
      notice = Notification.create(
        sender_id:    trade.seller_id,
        receiver_id:  trade.buyer_id,
        trade_id:     trade.id,
        action:       2,
        title:        "「#{trade.product.name}」を購入しました。発送までしばらくお待ちください。"
      )

      # 【send-mail】通知内容をメール送信
      mail_sel  =  TradeMailer.sold_out_notice(trade).deliver
      mail_buy  =  TradeMailer.purchase_notice(trade).deliver
      redirect_to products_path
    else
      redirect_to product_path(@product[:id]), alert: '購入できませんでした'
    end
  end

  def update
    @trade = Trade.find(params[:id])
    notifications = Notification.where("(trade_id = ?) && (action = ?) && (todo_status = ?)",@trade.id,5,0)

    # TODOが2つ以上ある状態は異常なので先に進まない
    if notifications.size != 1
      @message = 'システムエラーが発生しました。お問い合わせ窓口にご連絡ください'
      redirect_to product_trade_path(@trade.product_id,@trade.id)
      return
    end

    case @trade.trade_status
    when 0 # 発送未済
      # 取引ステータスを1(発送済)に変更する
      @trade.update(trade_status: 1)
      # 発送依頼に対するTODOステータスを1(完了)に変更する
      notifications.update(todo_status: 1)
      # 商品受け取り後の出品者評価TODOを作成する
      next_notifications = Notification.create(
        sender_id:    @trade.seller_id,
        receiver_id:  @trade.buyer_id,
        trade_id:     @trade.id,
        action:       5,
        title:        "#{@trade.seller.nickname}さんが「#{@trade.product.name}」を発送しました。商品が届いたら内容を確認して、受取評価をしてください。"
      )
        # 【send-mail】発送完了通知を購入者に送信する
        mail  =  TradeMailer.product_sending_notice(@trade).deliver
      redirect_to product_trade_path(@trade.product_id,@trade.id)
      return
    when 1 # 発送済／購入者評価待ち
      # 取引ステータスを2(購入者評価済／出品者評価待ち)に変更する
      @trade.update(trade_status: 2)
      # 評価依頼に対するTODOステータスを1(完了)に変更する
      notifications.update(todo_status: 1)
      # 出品者評価の作成
      seller_rate = Rating.create(
        rated_user_id:    @trade.seller_id,
        rater_user_id:    @trade.buyer_id,
        rate:             params[:rate]
      )      
      # 商品受け取り後の出品者評価TODOを作成する
      next_notifications = Notification.create(
        sender_id:    @trade.buyer_id,
        receiver_id:  @trade.seller_id,
        trade_id:     @trade.id,
        action:       5,
        title:        "#{@trade.buyer.nickname}さんがあなたを評価しました。#{@trade.seller.nickname}さんも#{@trade.buyer.nickname}さんを評価して取引を完了させましょう。",
        message:      params[:message]
      )
      # 【send-mail】購入者評価完了を出品者に送信する
      mail  =  TradeMailer.seller_raiting_notice(@trade).deliver
      redirect_to product_trade_path(@trade.product_id,@trade.id)
      return
    when 2 # 購入者評価済／出品者評価待ち
      # 取引ステータスを3(取引完了)に変更する
      @trade.update(trade_status: 3)
      # 評価依頼に対するTODOステータスを1(完了)に変更する
      notifications.update(todo_status: 1)
      # 出品者評価の作成
      buyer_rate = Rating.create(
        rated_user_id:    @trade.buyer_id,
        rater_user_id:    @trade.seller_id,
        rate:             params[:rate]
      )
      # TODOはなくなったのでお知らせを作成する
      next_notifications = Notification.create(
        sender_id:    @trade.seller_id,
        receiver_id:  @trade.buyer_id,
        trade_id:     @trade.id,
        action:       2,
        title:        "#{@trade.seller.nickname}さんがあなたを評価しました。これで取引完了です。",
        message:      params[:message]
      )
      # 【send-mail】評価・取引完了を出品者、購入者双方に送信する
      mail_seller  =  TradeMailer.trade_close_notice(@trade).deliver
      mail_buyer   =  TradeMailer.buyer_raiting_notice(@trade).deliver
      redirect_to product_trade_path(@trade.product_id,@trade.id)
      return
    when 3 # 取引完了
      #この状態で呼ばれることはない
      @messages = '取引は完了しています。'
      redirect_to product_trade_path(@trade.product_id,@trade.id)
      return
    end
  end

  private
  def trade_params
    params.permit(:product_id)
  end

end
