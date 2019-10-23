class Users::RegistrationsController < Devise::RegistrationsController
  require "securerandom"
  require "payjp"
  require "base64"

  before_action :notice_count,:todo_count, only: [:edit_profile,:edit_account,:edit_address,:edit_password,:edit_password_2,:edit_payment,:edit_payment_2,:edit_telephone,:edit_telephone_auth]
  prepend_before_action :check_captcha,:customize_sign_up_params, only: [:create,:update]
  prepend_before_action :move_to_new_profile, only: [:new_telephone,:new_telephone_auth,:new_address,:new_payment,:new_payment]

  def new_profile
    # 次のページで使う空箱(@userなどを使うなら必須)
    @user = User.new
    session[:user] = @user
    if session[:sns].present?
      # session[:sns]に認証成功のデータがある場合の対処
      if session[:sns]["info"].present?
        session[:user]["nickname"] =  session[:sns]["info"]["name"]
        session[:user]["email"] =  session[:sns]["info"]["email"]
      end
    end

  end

  def new_telephone
    # セッションにデータを登録
    # この時にストロングパラメータ効かせてpermitted:false解消
    params[:user][:birthday] = date_create
    session[:user] = user_params

    # 既存の顧客で同一emailを利用していないか
    same_mail = User.where(email: user_params[:email])
    if same_mail.present?
      @user = User.new
      @messages = 'メールアドレスに誤りがあります。ご確認いただき、正しく変更してください。'
      render :new_profile
      return
    end

    # バリデーションチェック
    @user = User.new(user_params)
    if @user.valid?(:profile)
      if verify_recaptcha
        # 問題なし
      else
        @message_recaptcha = '選択してください'
        render :new_profile
        return
      end
    elsif verify_recaptcha
      render :new_profile
      return
    else
      @message_recaptcha = '選択してください'
      render :new_profile
      return
    end
  end

  def new_telephone_auth
    # セッションにデータを格納
    session[:user][:tel]  = user_params[:tel]

    # バリデーションチェック
    @user = User.new(session[:user])
    if @user.valid?(:tel)
    else
      render :new_telephone
      return
    end

    # 既存の顧客で同一電話番号を利用していないか
    same_tel = User.where(tel: user_params[:tel])
    if same_tel.present?
      @messages = 'この番号はすでに会員登録済みです。会員の方は、ログインをお試しください。登録の覚えがない場合、お問い合わせよりその旨をご連絡ください。'
      render :new_telephone
      return
    end

    # SMS認証用のデータ作成 + セッションにデータ登録
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
    # 入力チェック
    if params[:auth_code].present?
    else
      @messages = '認証番号を入力してください'
      render :authcode_check
    end

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
    @user.build_address #1:1なのでbuild_address/1:多の場合は@user.address.build

    session[:address] = @user.address

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
    session[:address] = user_params[:address_attributes]

    # バリデーションチェック
    @user = User.new(session[:user])
    @user.build_address(session[:address])
    if @user.valid?(:address)
      if @user.address.valid?(:address)
      else
        render :new_address
        return
      end
    elsif @user.address.valid?(:address)
      render :new_address
      return
    else
      render :new_address
      return
    end

  end

  def new_complete
    # クレジットカードの登録処理
    @customer = user_credit('create')
    if @err.present?
      render :new_payment
      return
    end
    # 実際のユーザ登録はここから
    @user = User.new(session[:user])
    @user.build_address(session[:address])
    @user.build_card(
      user_id:        @user.id,
      customer_id:    @customer.id,
      card_id:        @customer.default_card,
    )
    if session[:sns].present?
      if session[:sns]["info"].present?
        @user.sns_credentials.build(
          uid:             session[:sns]["uid"],
          provider:        session[:sns]["provider"],
          user_id:         @user.id
        )
      end
    end
    @user.skip_confirmation!
    # newしたユーザをDB登録。成功したら自動ログイン
    if @user.save
      user = @user
      # 【send-mail】ユーザ登録完了メール送信
      mail = UserMailer.registration_confirmation(user).deliver
      session.clear
      session[:id] = @user.id
      sign_in User.find(session[:id]) unless user_signed_in?
    else
      # 失敗したら１ページ目に戻る
      @messages = "会員情報の登録に失敗しました。 #{@user.errors.messages}"
      render :new_profile
    end

  end

  def edit_profile
  end

  def update_profile
    current_user.update(
      nickname: user_params[:nickname],      
      introduction: user_params[:introduction]
    )
    # 指定データがある場合のみ保存
    if user_params[:avatar].present?
      current_user.update(
        avatar: user_params[:avatar]
      )
    end

    if current_user.valid?
      redirect_to action: :edit_profile
      return
    else
      render action: :edit_profile
      return
    end

  end

  def edit_address
  end

  def update_address
    if current_user.update_without_current_password(user_params)
      redirect_to users_edit_address_path
      return
    else
      render :edit_address
      return
    end

  end

  def edit_payment

    binding.pry
    
    unless current_user.card&.customer_id.nil?
    # クレジットカード情報が登録されていた場合のみ情報取得
      @card,@err = Card.show(current_user.card)
      binding.pry
      
      render :edit_payment if @err != nil and return

    end


    # unless current_user.card&.customer_id.nil?
    #   @card = user_credit('show')
    #   if @err.present?
    #     render :edit_payment
    #     return
    #   end
    # end
  end

  def edit_payment_2
  end

  def update_payment
    # クレジットカード情報の登録
    session[:user] = current_user
    session[:user]["email"] = current_user.email

    @card,@err = Card.create(current_user,params[:payjp_token])

    if @err.present?
      render :edit_payment
      return
    end

    redirect_to action: :edit_payment
  end

  def destroy_payment
    # クレジットカード情報の削除

    binding.pry

    _ , @err = Card.destroy(current_user.card)

    # @customer = user_credit('delete')
    # if @err.present?
    #   render :edit_payment
    #   return
    # end
    # @card = Card.find_by(user_id: current_user.id)
    # @card.destroy

    redirect_to action: :edit_payment
  end

  def edit_telephone
  end

  def edit_telephone_auth
    # セッションにデータを格納
    session[:user][:tel]  = user_params[:tel]

    # 既存の顧客で同一電話番号を利用していないか
    same_tel = User.where(tel: user_params[:tel])
    if same_tel.present?
      @messages = 'この番号はすでに会員登録済みです。会員の方は、ログインをお試しください。登録の覚えがない場合、お問い合わせよりその旨をご連絡ください。'
      render :edit_telephone
      return
    end

    # SMS認証用のデータ作成 + セッションにデータ登録
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

  def update_telephone_auth
    # 入力チェック
    if params[:auth_code].blank?
      @messages = '認証番号を入力してください'
      render :edit_telephone_auth
      return
    end

    # 電話番号認証の結果を受けてレンダリング先を決める
    if session[:secure_code] == params[:auth_code]
      # バリデーションに通ったか確認、elseの場合は画面を戻す
      if current_user.update_without_current_password(tel: session[:user]["tel"])
        redirect_to users_edit_telephone_path
        return
      else
        render :edit_telephone
        return
      end
    else
      @messages = '認証番号が一致しません'
      session[:auth_code] = params[:auth_code]
      render :edit_telephone_auth
      return
    end

    redirect_to users_edit_telephone_path

  end

  def edit_account
  end

  def update_account
    if current_user.update_without_current_password(user_params)
      redirect_to users_edit_account_path
    else
      render :edit_account
      return
    end
  end

  def edit_password
    # パスワード変更後のリダイレクトでログアウトされる対処。謎。
    sign_in User.find(session[:id]) unless user_signed_in?
  end

  def update_password
    # emailの変更が無いかチェック
    if current_user.email != user_params[:email]

      # 既存の顧客で同一emailを利用していないか
      same_mail = User.where(email: user_params[:email])
      if same_mail.present?
        @messages = 'メールアドレスに誤りがあります。ご確認いただき、正しく変更してください。'
        render :edit_password
        return
      end

      # 【send-mail】認証メールをスキップさせる場合はコメントアウトを外す
      # @user.skip_reconfirmation!

      # アップデート処理。問題なくupdateされれば自動的にメールも飛ぶ
      if current_user.update_without_current_password(email: user_params[:email])
        session[:change_email] = current_user.email
      else
        render :edit_password
        return
      end

    end

    # パスワード変更処理(入力があった場合のみ)
    if user_params[:password] != "" || user_params[:password_confirmation] != "" || user_params[:current_password] != ""
      result = current_user.update_with_password(user_params)

      if result
        # パスワード変更すると一旦サインアウトされる可能性があると
        # 記事で読んだので念のため、ログイン処理追加
        session[:id] = current_user.id
        sign_in User.find(session[:id])
      else
        @messages = 'パスワードの更新に失敗しました。入力された値に間違いがあります。'
        render :edit_password
        return
      end
    end

    # メールアドレス変更に成功している場合、別画面に遷移。
    if session[:change_email].blank?
      redirect_to users_edit_password_path
    else
      sign_in User.find(session[:id]) unless user_signed_in?
      session[:change_email].clear
      redirect_to users_edit_password_2_path
    end

  end

  def edit_password_2
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

  def customize_update_params
    devise_parameter_sanitizer.permit :account_update,
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
      :avatar,
      :introduction,
      :email,
      :password,
      :password_confirmation,
      :current_password,
      :firstname,
      :lastname,
      :firstname_kana,
      :lastname_kana,
      :birthday,
      :tel,
      :sales_amount,
      address_attributes:[
        :postal_code,
        :prefecture_id,
        :city,
        :address_number,
        :building_name,
      ]
    )
  end

  # クレジットカード情報の登録
  def user_credit(key)
    # payjpとapi通信するためのアクセスキー
    Payjp.api_key = Rails.application.credentials.payjp[:api_secret_key]

    begin
      case key
      when 'create'
        if params[:payjp_token].present?
          @customer = Payjp::Customer.create(
            description: 'freemaket_sample_56d',
            email: session[:user][:email],
            card: params[:payjp_token],
          )
        else
          render :new_payment
          return
        end
      when 'show'
        @customer = Payjp::Customer.retrieve(
          current_user.card.customer_id
        )
        @card = @customer.cards.retrieve(current_user.card.card_id)
      when 'delete'
        # 削除対象データの取得
        @customer = Payjp::Customer.retrieve(
          current_user.card.customer_id
        )
        @customer.delete
      else
        #特に処理なし
      end
    # 例外キャッチ処理
    rescue Payjp::CardError => e
      body = e.json_body
      @err  = body[:error]
    rescue Payjp::InvalidRequestError => e
      body = e.json_body
      @err  = body[:error]
    rescue Payjp::AuthenticationError => e
      body = e.json_body
      @err  = body[:error]
    rescue Payjp::APIConnectionError => e
      body = e.json_body
      @err  = body[:error]
    rescue Payjp::APIError => e
      body = e.json_body
      @err  = body[:error]
    rescue Payjp::PayjpError => e
      body = e.json_body
      @err  = body[:error]
    rescue => e
      body = e.json_body
      @err  = body[:error]
    end
  end

  # selectタグでで取得した年月日をDate型データに結合(paramsを強制書き換え)
  def date_create
    date = params[:birthday]
    if date["birthday(1i)"].empty? && date["birthday(2i)"].empty? && date["birthday(3i)"].empty?
      params[:user][:birthday] = ""
      return
    end

    Date.new date["birthday(1i)"].to_i,date["birthday(2i)"].to_i,date["birthday(3i)"].to_i

  end

  # SMS認証用に4桁の乱数を生成
  def random_number_generator(n)
    ''.tap { |s| n.times { s << rand(0..9).to_s } }
  end

  # ページ直視指定しようとした場合、初期ページに飛ばす
  # session[:user]が出来ているかで判断する
  def move_to_new_profile
    if session[:user].nil?
      redirect_to users_sign_up_profile_path
    end
  end
  
end