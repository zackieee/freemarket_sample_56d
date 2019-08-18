class User < ApplicationRecord
  include ActiveRecord::Reflection
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[facebook google_oauth2]
  
  has_one  :address, dependent: :destroy
  has_one  :card, dependent: :destroy
  has_many :seller_products, class_name: 'Product', foreign_key: 'seller_id'
  has_many :seller_trades, class_name: 'Trade', foreign_key: 'seller_id'
  has_many :buyer_trades, class_name: 'Trade', foreign_key: 'buyer_id'
  has_many :comments
  has_many :favorites
  has_many :rated_user_ratings, class_name: 'Rating', foreign_key: 'rated_user_id'
  has_many :rater_user_ratings, class_name: 'Rating', foreign_key: 'rater_user_id'
  has_many :sns_credentials, dependent: :destroy

  # イメージ画像の紐付け
  has_one_attached :avatar

  # fields_for用のネスト設定
  accepts_nested_attributes_for :address, allow_destroy: true

  # 会員情報登録画面用のバリデーション
  with_options on: :profile do | profile |
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i
    profile.validates :nickname,
      presence: true,
      length:{ maximum: 20}
    profile.validates :email,
      presence: true,
      format: { with: VALID_EMAIL_REGEX , message: 'のフォーマットが不適切です'}
    profile.validates :password,
      presence:true,
      confirmation: true,
      length:{ minimum: 7, maximum: 128},
      format: { with: VALID_PASSWORD_REGEX , message: 'は英字と数字両方を含むパスワードを設定してください'}
    profile.validates :password_confirmation,
      presence: true,
      length:{ minimum: 7, maximum: 128},
      format: { with: VALID_PASSWORD_REGEX , message: 'は英字と数字両方を含むパスワードを設定してください'}
    profile.validates :lastname,
      presence: true,
      length:{ maximum: 35}
    profile.validates :firstname,
      presence: true,
      length:{ maximum: 35}
    profile.validates :lastname_kana,
      presence: true,
      length:{ maximum: 35},
      format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい' }
    profile.validates :firstname_kana,
      presence: true,
      length: { maximum: 35},
      format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい' }
    profile.validate :check_birthday  #生年月日用の独自バリデーション
  end

  # 電話番号確認画面用のバリデーション
  with_options on: :tel do | tel |
    tel.validates :tel,
      presence: true,
      format: { with: /\A\d{10,11}\z/, message: 'の入力が正しくありません'}
  end

  # 発送元・お届け先住所入力画面用のバリデーション(Addressモデル分も含む)
  with_options on: :address do | address |
    VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/
    address.validates :lastname,
      presence: true,
      length:{ maximum: 35}
    address.validates :firstname,
      presence: true,
      length:{ maximum: 35}
    address.validates :lastname_kana,
      presence: true,
      length:{ maximum: 35},
      format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい' }
    address.validates :firstname_kana,
      presence: true,
      length: { maximum: 35},
      format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい' }
  end

  # プロフィール編集画面のバリデーション
  with_options on: :profile_2 do | profile |
    profile.validates :nickname,
      presence: true,
      length:{ maximum: 20 }
      profile.validates :introduction,
      length:{ maximum: 1000 }
  end

  # パスワード・メールアドレス編集画面のバリデーション
  with_options on: :email do | email |
    email.validates :email,
      presence: true,
      format: { with: VALID_EMAIL_REGEX , message: 'のフォーマットが不適切です'},
      uniqueness: true
  end
  
  # 生年月日のチェックメソッド
  def check_birthday
    # 生年月日が入力済かつ未来日(現在日付より未来)
    if birthday.present?
      if birthday > Date.today
        # 未来日付の場合、エラー表示
        errors.add(:birthday, "を正しく入力してください")
      end
    else
      # 未入力の場合、エラー表示
      errors.add(:birthday, "を入力してください")
    end
  end

  def self.find_oauth(auth)
    uid = auth.uid
    provider = auth.provider
    snscredential = SnsCredential.where(uid: uid, provider: provider).first
    if snscredential.present?
      user = User.where(id: snscredential.user_id).first
    else
      user = User.where(email: auth.info.email).first
      if user.present?
        SnsCredential.new(
          uid: uid,
          provider: provider,
          user_id: user.id
          )
      else
        user = User.new(
          nickname: auth.info.name,
          email:    auth.info.email,
          password: Devise.friendly_token[0, 20]
          )
        SnsCredential.new(
          uid: uid,
          provider: provider,
          user_id: user.id
          )
      end
    end
    return user
  end
  
end
