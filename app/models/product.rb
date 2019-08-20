class Product < ApplicationRecord
  belongs_to :seller, class_name: 'User', foreign_key: 'seller_id'
  has_many_attached :images, dependent: :destroy
  has_many :comments
  has_many :favorites
  belongs_to :category
  # belongs_to :brand
  # belongs_to :size
  # has_many :brands,through: :products_brands
  # has_many :products_brands
  # has_many :sizes,through: :products_sizes
  # has_many :products_sizes
  has_one :trade
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :status
  belongs_to_active_hash :postage_burden
  belongs_to_active_hash :delivery_days
  belongs_to_active_hash :sales_status
  belongs_to_active_hash :price_select

  validates :images, :name, :text, :price, :status_id, :prefecture_id, :postage_burden_id, :delivery_days_id, :sales_status_id, presence: true
  validates :sales_status_id, numericality: { greater_than_or_equal_to: 1 }
  validates :sales_status_id, numericality: { less_than_or_equal_to: 2 }

  def self.search(search)
    if search
      Product.where(['name LIKE ?', "%#{search}%"])
    else
      Product.all
    end
  end
end
