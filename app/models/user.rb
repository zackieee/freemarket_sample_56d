class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_one  :address, dependent: :destroy
  has_one  :card, dependent: :destroy
  has_many :seller_products, class_name: 'Product', foreign_key: 'seller_id'
  has_many :buyer_products, class_name: 'Product', foreign_key: 'buyer_id'
  has_many :comments
  has_many :favorites
  has_many :rated_user_ratings, class_name: 'Rating', foreign_key: 'rated_user_id'
  has_many :rater_user_ratings, class_name: 'Rating', foreign_key: 'rater_user_id'
end
