class Size < ApplicationRecord
  has_many :products

  validates :data, uniqueness: true
end
