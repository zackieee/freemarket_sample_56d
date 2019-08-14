class ProductsController < ApplicationController
  require 'active_support/all'
  require 'payjp'

  before_action :set_product, only: [:show, :buy, :edit]

  def index
    @products= Product.order('id DESC').limit(4)
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
    @products= Product.where.not(id: @product.id).where(seller_id: @product.seller_id).order('id DESC').limit(6)
    @product_before = Product.find( @product.id - 1 ) if Product.exists?(@product.id - 1)
    @product_after = Product.find( @product.id + 1 ) if Product.exists?(@product.id + 1)
  end

  def edit
  end

  def buy
    if @product.sales_status_id == 2
      redirect_to product_path(@product.id), alert: '購入できません'
      return
    end
    @card = Card.find(current_user.id)
    Payjp.api_key = Rails.application.credentials.payjp[:api_secret_key]
    customer = Payjp::Customer.retrieve(@card.customer_id)
    @card_information = customer.cards.retrieve(@card.card_id)

    # 登録カード会社のブランドアイコンを表示する
    @card_brand = @card_information.brand
    case @card_brand
      when "Visa"
        @card_src = "visa.svg"
      when "JCB"
        @card_src = "jcb.svg"
      when "MasterCard"
        @card_src = "master-card.svg"
      when "American Express"
        @card_src = "american_express.svg"
      when "Diners Club"
        @card_src = "dinersclub.svg"
      when "Discover"
        @card_src = "discover.svg"
    end
  end
  
  private
   def product_params
    params.require(:product).permit(:name, :text, :price, :status_id, :prefecture_id, :postage_burden_id, :buyer_area_id, :delivery_days_id, images: []).merge(seller_id: current_user.id)
   end

   def set_product
    @product = Product.find(params[:id])
  end
end

# image: product_params[:image], name: product_params[:name], 
#     text: product_params[:text], status: product_params[:status], price: product_params[:price], 
#     postage_burden: product_params[:postage_burden], buyer_area: product_params[:buyer_area], 
#     delivery_days: product_params[:delivery_days], sales_status: product_params[:sales_status]
