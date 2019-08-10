class ProductsController < ApplicationController
  def index
    @products= Product.all
  end
  
  def new
    @product= Product.new
  end
    
  def create
    @product= Product.create(product_params)
    if @product.save
      redirect_to root_path
    else
      redirect_to new_product_path
    end
  end

  def show
  end

  def buy
  end
  
  private
   def product_params
    params.require(:product).permit(:name, :text, :status, :price, :postage_burden, :buyer_area, :delivery_days, images: [])
   end
end

# image: product_params[:image], name: product_params[:name], 
#     text: product_params[:text], status: product_params[:status], price: product_params[:price], 
#     postage_burden: product_params[:postage_burden], buyer_area: product_params[:buyer_area], 
#     delivery_days: product_params[:delivery_days], sales_status: product_params[:sales_status]
