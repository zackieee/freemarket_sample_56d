class ProductsController < ApplicationController

  before_action :set_product, only: [:show, :buy, :selling_show, :edit, :update, :destroy]

  def index
    @products= Product.order('id DESC').limit(4)
  end

  def all_products
    @products= Product.order('id DESC')
  end
  
  def new
    @product= Product.new
  end
    
  def create
    @product= Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      redirect_to new_product_path
    end
  end

  def show

  end

  def selling_index
    #本当はこれ
    # @products = current_user.products
    
    #いったん全部取り出す
    @products = Product.all
  end

  def selling_show
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to selling_show_product_path(@product)
    else
      render :edit
    end
  end

  def destroy
    @product.destroy if current_user.id == @product.seller_id
    redirect_to products_selling_index_path
  end

  def buy
  end
  
  private
   def product_params
    params.require(:product).permit(:name, :text, :price, :status_id, :prefecture_id, :postage_burden_id, :delivery_days_id, images: [] ).merge(seller_id: current_user)
   end

   def set_product
    @product = Product.find(params[:id])
  end
end

# image: product_params[:image], name: product_params[:name], 
#     text: product_params[:text], status: product_params[:status], price: product_params[:price], 
#     postage_burden: product_params[:postage_burden], buyer_area: product_params[:buyer_area], 
#     delivery_days: product_params[:delivery_days], sales_status: product_params[:sales_status]
