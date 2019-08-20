class FavoritesController < ApplicationController
  before_action :set_product, except: :index

  def index
    @products = current_user.fav_products
  end

  def create
    @fav = Favorite.create(user_id: current_user.id, product_id: @product.id)
    # redirect_back(fallback_location: root_path)
  end

  def destroy
    @fav = Favorite.find_by(user_id: current_user.id, product_id: @product.id)
    @fav.destroy
    # redirect_back(fallback_location: root_path)
  end

  private
  def set_product
    @product = Product.find(params[:product_id])
  end
end
