class FavoritesController < ApplicationController
  before_action :set_product, except: :index
  before_action :notice_count,:todo_count, only: [:index]


  def index
    @products = current_user.fav_products
  end

  def create
    @fav = Favorite.create(user_id: current_user.id, product_id: @product.id)
 
    #いいね！通知機能
    notifications = Notification.create(
      sender_id:    @fav.user_id,
      receiver_id:  @fav.product.seller_id,
      product_id:   @fav.product_id,
      action:       3,
      title:        "#{@fav.user.nickname}さんが「#{@fav.product.name}」にいいね！しました",
    )
  end

  def destroy
    @fav = Favorite.find_by(user_id: current_user.id, product_id: @product.id)
    @fav.destroy
  end

  private
  def set_product
    @product = Product.find(params[:product_id])
  end
end
