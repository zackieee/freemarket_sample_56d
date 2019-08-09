class Product < ApplicationRecord
  belongs_to :user
  has_many :images, dependent: :destroy
  has_many :comments
  has_many :favorites
  belongs_to :category
  belongs_to :brand
  belongs_to :sizes
end
