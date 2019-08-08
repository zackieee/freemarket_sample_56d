class Brand < ApplicationRecord
  has_many :products
  has_many :categories,through: :categories_brands
  has_many :categories_brands
end
