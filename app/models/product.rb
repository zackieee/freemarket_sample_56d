class Product < ApplicationRecord
  # belongs_to :user
  has_many_attached :images, dependent: :destroy
  has_many :comments
  # has_many :favorites
  # belongs_to :category
  # belongs_to :brand
  # belongs_to :sizes

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :status
  belongs_to_active_hash :postage_burden
  belongs_to_active_hash :delivery_days
  belongs_to_active_hash :sales_status
end
