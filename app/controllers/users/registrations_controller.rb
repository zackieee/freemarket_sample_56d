class Users::RegistrationsController < Devise::RegistrationsController
  require 'securerandom'
  require "payjp"

  prepend_before_action :check_captcha, only: [:create]
  prepend_before_action :customize_sign_up_params, only: [:create]

  def new_profile
    # 次のページで使う空箱(@userなどを使うなら必須)
    @user = User.new
  end

  def new_telephone
    # 既存の顧客で同一emailを利用していないか
    same_mail = User.where(email: user_params[:email])
    if same_mail.length != 0
      @messages = 'メールアドレスに誤りがあります。ご確認いただき、正しく変更してください。'
      render :new_profile
    end

    # パスワードが一致しているか
    if user_params[:password] != user_params[:password_confirmation]
      render :new_profile
    end

    # セッションにデータを登録
    # この時にストロングパラメータ効かせてpermitted:false解消
    session[:user] = user_params
    session[:birthday] = params[:birthday] #日付型の変換のために一旦分離します

    #次のページ用の空箱
    @user = User.new
  end

  def new_telephone_auth
    # 既存の顧客で同一電話番号を利用していないか
    same_tel = User.where(tel: user_params[:tel])
    if same_tel.length != 0
      @messages = 'この番号はすでに会員登録済みです。会員の方は、ログインをお試しください。登録の覚えがない場合、お問い合わせよりその旨をご連絡ください。'
      render :new_telephone
    end

    # SMS認証用のデータ作成 + セッションにデータ登録
    session[:user][:tel]  = user_params[:tel]
    session[:to]          = PhonyRails.normalize_number session[:user][:tel], country_code:'JP' # 電話番号を+81にフォーマット
    session[:secure_code] = random_number_generator(4)

    # SMSに認証コード送信
    if Phony.plausible? session[:to]
      client = Twilio::REST::Client.new
      client.messages.create(
        from: "+15624441204", #送信用電話番号
        to:   session[:to],
        body: "認証番号：#{session[:secure_code]} この番号をfreemarket_sampleの画面で入力してください。"
    )
    end

  end

  def authcode_check
    # 電話番号認証の結果を受けてレンダリング先を決める
    if session[:secure_code] == params[:auth_code]
      redirect_to action: :new_address
    else
      @messages = '認証番号が一致しません'
      session[:auth_code] = params[:auth_code]
      render :new_telephone_auth
    end
  end

  def new_address
    #次のページ用の空箱
    @user = User.new
  end

  def new_payment
    # addressで入力したデータを受け取る

    # ユーザデータをセッションに格納
    # すでに存在するキーであるため、指定して上書き
    session[:user]["lastname"]        =   user_params[:lastname]
    session[:user]["firstname"]       =   user_params[:firstname]
    session[:user]["lastname_kana"]   =   user_params[:lastname_kana]
    session[:user]["firstname_kana"]  =   user_params[:firstname_kana]
    session[:user]["tel"]             =   user_params[:tel]

    # アドレスデータをセッションに格納
    session[:address] = address_params

  end

  def new_complete
    # payjpとapi通信するためのアクセスキー
    Payjp.api_key = Rails.application.credentials.payjp[:api_secret_key]

    # payjpからトークンを受け取れているか確認
    if params[:payjp_token].blank?
      redirect_to action: :new_payment
    # payjpに顧客情報を送信・登録する/ユーザ入力情報をparamsから受け取らないのでストロングパラメータもなし
    else
      customer = Payjp::Customer.create(
        description: 'freemaket_sample_56d',
        email: session[:user][:email],
        card: params[:payjp_token],
      )
    end

    # 実際のユーザ登録はここから
    @user = User.new(
      nickname:             session[:user]["nickname"],
      email:                session[:user]["email"],
      password:             session[:user]["password"],
      password_confirmation: session[:user]["password_confirmation"],
      lastname:             session[:user]["lastname"],
      firstname:            session[:user]["firstname"],
      lastname_kana:        session[:user]["lastname_kana"],
      firstname_kana:       session[:user]["firstname_kana"],
      birthday:             date_create,
      tel:                  session[:user]["tel"],
      )
    if @user.save
      #userの作成に成功した時だけ住所とカードの情報を登録
      @address = Address.create(
        user_id:@user.id,
        postal_code:    session[:address]["postal_code"],
        prefecture_id:  session[:address]["prefecture_id"],
        city:           session[:address]["city"],
        address_number: session[:address]["address_number"],
        building_name:  session[:address]["building_name"],
      )
      @card = Card.create(
        user_id:        @user.id,
        customer_id:    customer.id,
        card_id:        customer.default_card,
      )
      # ユーザ登録に成功しているので自動ログイン
      session[:id] = @user.id
      sign_in User.find(session[:id]) unless user_signed_in?
    else
      # 失敗したら１ページ前に戻る
      render :new_payment
    end

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
  # userモデルに含まれていない項目についてストロングパラメータを設定（編集は別に必要）
  def customize_sign_up_params
    devise_parameter_sanitizer.permit :sign_up,
    keys: 
    [:nickname,
      :avatar,
      :introduction,
      :firstname,
      :lastname,
      :firstname_kana,
      :lastname_kana,
      :birthday,
      :tel,
      :sales_amount,
    ]
  end

  def user_params
    params.require(:user).permit(
      :nickname,
      :email,
      :password,
      :password_confirmation,
      :firstname,
      :lastname,
      :firstname_kana,
      :lastname_kana,
      :birthday,
      :tel,
    )
  end

  def address_params
    params.require(:user).require(:address).permit(
      :postal_code,
      :prefecture_id,
      :city,
      :address_number,
      :building_name,
    )
  end

  # selectタグでで取得した年月日をDate型データに結合
  def date_create
    date = session[:birthday]
    Date.new date["birthday(1i)"].to_i,date["birthday(2i)"].to_i,date["birthday(3i)"].to_i
  end

  # SMS認証用に4桁の乱数を生成
  def random_number_generator(n)
    ''.tap { |s| n.times { s << rand(0..9).to_s } }
  end

  # recaptcha用の魔法のことば
  # 結果の比較をしてるようです
  def check_captcha
    self.resource = resource_class.new sign_up_params
    resource.validate
    unless verify_recaptcha(model: resource)
      respond_with_navigational(resource) { render :new }
    end
  end
  
end