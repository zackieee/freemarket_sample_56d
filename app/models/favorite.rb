class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :product, optional: true
  validates_uniqueness_of :product_id, scope: :user_id
end
