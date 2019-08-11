class Product < ApplicationRecord
  belongs_to :seller, class_name: 'User', foreign_key: 'seller_id'
  has_many :images, dependent: :destroy
  has_many :comments
  has_many :favorites
  has_many :categories,through: :products_categories
  has_many :products_categories
  has_many :brands,through: :products_brands
  has_many :products_brands
  has_many :sizes,through: :products_sizes
  has_many :products_sizes
  has_one :trade
end
