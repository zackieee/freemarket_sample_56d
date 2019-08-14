class User < ApplicationRecord
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

  def self.find_oauth(auth)
    uid = auth.uid
    provider = auth.provider
    snscredential = SnsCredential.where(uid: uid, provider: provider).first
    if snscredential.present?
      user = User.where(id: snscredential.user_id).first
    else
      user = User.where(email: auth.info.email).first
      if user.present?
        SnsCredential.create(
          uid: uid,
          provider: provider,
          user_id: user.id
          )
      else
        user = User.create(
          nickname: auth.info.name,
          email:    auth.info.email,
          password: Devise.friendly_token[0, 20]
          )
        SnsCredential.create(
          uid: uid,
          provider: provider,
          user_id: user.id
          )
      end
    end
    return user
  end
end
