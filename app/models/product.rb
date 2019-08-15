class Product < ApplicationRecord
  belongs_to :seller, class_name: 'User', foreign_key: 'seller_id'
  has_many_attached :images, dependent: :destroy
  has_many :comments
  has_many :favorites
  has_many :categories,through: :products_categories
  has_many :products_categories
  has_many :brands,through: :products_brands
  has_many :products_brands
  has_many :sizes,through: :products_sizes
  has_many :products_sizes
  has_one :trade
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :status
  belongs_to_active_hash :postage_burden
  belongs_to_active_hash :delivery_days
  belongs_to_active_hash :sales_status

  validates :images, :name, :text, :price, :status_id, :prefecture_id, :postage_burden_id, :delivery_days_id, :sales_status_id, presence: true
end
