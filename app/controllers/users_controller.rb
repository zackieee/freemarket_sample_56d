class UsersController < ApplicationController
  before_action :notice_count,:todo_count, only: [:show]

  def show
    @category = Category.where(depth: 0)
    # 評価／出品数を取得
    @rating_count   = Rating.my_ratings(current_user.id).count
    @trade_count    = Trade.where(seller_id: current_user.id).count

    # お知らせ情報取得
    @notifications  = Notification.where.not(action: 5 ).where(receiver_id: current_user.id).order("created_at DESC")
    # 取引中の商品取得
    @trades = Trade.where.not(trade_status: 3).where(buyer_id: current_user.id).order("created_at DESC")
  end

  # これを呼ぶと見たいユーザのプロフィールページが参照できる
  def show_profile
    @user = User.find(params[:id])
    @category = Category.where(depth: 0)

    @notifications  =  Notification.where.not(action: 5 ).where(receiver_id: @user.id).order("created_at DESC")
    @rating_count   =  Rating.count_rating(@user.id)
    @trade_count    =  Trade.where(seller_id: @user.id).count
  end
end
