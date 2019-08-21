class UsersController < ApplicationController
  before_action :notice_count,:todo_count, only: [:show]

  def show
    # 評価／出品数を取得
    @rating_count   = Rating.where(rated_user_id: current_user.id).count
    @trade_count    = Trade.where(seller_id: current_user.id).count

    # お知らせ情報取得
    @notifications  = Notification.where.not(action: 5 ).where(receiver_id: current_user.id).order("created_at DESC")

    # 取引中の商品取得
    @trade_products = Trade.where.not(trade_status: 3).where("(seller_id = ?) || (buyer_id = ?)",current_user.id,current_user.id).order("created_at DESC")

  end

  # これを呼ぶと見たいユーザのプロフィールページが参照できる
  def show_profile
    @user = User.find(params[:id])

    @notifications  =  Notification.where.not(action: 5 ).where(receiver_id: @user.id).order("created_at DESC")
    @rating_count   =  Rating.where(rated_user_id: @user.id).count
    @rating_good   =  Rating.where(rated_user_id: @user.id, rate: 1).count
    @rating_normal =  Rating.where(rated_user_id: @user.id, rate: 2).count
    @rating_bad    =  Rating.where(rated_user_id: @user.id, rate: 3).count
    @trade_count    =  Trade.where(seller_id: @user.id).count

  end
end
