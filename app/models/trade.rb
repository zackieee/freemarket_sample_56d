class Trade < ApplicationRecord
  belongs_to :product
  belongs_to :seller, class_name: 'User', foreign_key: 'seller_id'
  belongs_to :buyer, class_name: 'User', foreign_key: 'buyer_id'

  validates :product_id, :seller_id, :buyer_id, :pay_id, presence: true
  validates :product_id, uniqueness: true
end
