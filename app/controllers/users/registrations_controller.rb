class Users::RegistrationsController < Devise::RegistrationsController
  require "payjp"
  before_action :set_card, only:[:new_complete]
  prepend_before_action :check_captcha, only: [:create]
  prepend_before_action :customize_sign_up_params, only: [:create]

  def new
  end

  def new_profile
  end

  def new_telephone
    # profileで入力したデータを受け取る
    session[:nickname] = params[:nickname]
    session[:email] = params[:email]
    session[:password] = params[:password]
    session[:password_confirmation] = params[:password_confimation]
    session[:lastname] = params[:lastname]
    session[:firstname] = params[:firstname]
    session[:lastname_kana] = params[:lastname_kana]
    session[:firstname_kana] = params[:firstname_kana]
    session[:birthday] = params[:birthday]
  end

  def new_telephone_auth
    binding.pry
    session[:tel] = params[:tel]
  end

  def new_address
    #電話番号認証処理

    #認証処理に成功した場合にユーザ作成

    #登録ユーザ用のアドレスレコードを作成する
    @address = Address.new

  end

  def new_payment
    # addressで入力したデータを受け取る
    session[:lastname] = params[:lastname]
    session[:firstname] = params[:firstname]
    session[:lastname_kana] = params[:lastname_kana]
    session[:firstname_kana] = params[:firstname_kana]
    session[:postal_code] = params[:postal_code]
    session[:prefecture_id] = params[:prefecture_id]
    session[:city] = params[:prefecture]
    session[:address_number] = params[:address_number]
    session[:building_name] = params[:building_name]
    session[:tel] = params[:tel]
    #最終的にuserと
    @card = Card.new
  end

  def new_complete

  end

  def edit_profile
  end

  def edit_address
  end

  def edit_payment
  end

  def edit_payment_2
  end

  def edit_account
  end

private

def customize_sign_up_params
  devise_parameter_sanitizer.permit :sign_up,
   keys: 
   [:nickname,
    :avatar,
    :introduction,
    :email,
    :password,
    :password_confirmation,
    :firstname,
    :lastname,
    :firstname_kana,
    :lastname_kana,
    :birthday,
    :tel,
    :sales_amount,
  ]
end

def check_captcha
  self.resource = resource_class.new sign_up_params
  resource.validate
  unless verify_recaptcha(model: resource)
    respond_with_navigational(resource) { render :new }
  end
end

def address_params
  params.require(:address).permit(
    :user_id,
    :postal_code,
    :prefecture,
    :city,
    :address_number,
    :building_name,
  )
end

def cards_params
  params.require(:cards).permit(
    :user_id,
    :card_number,
    :expiration_date,
    :card_security_code,
  )
end
  
end