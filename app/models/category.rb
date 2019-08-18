class Category < ApplicationRecord
  # has_many :products,through: :products_categories
  # has_many :brands,through: :categories_brands
  # has_many :categories_brands
  # has_many :products_categories

  acts_as_nested_set counter_cache: :children_count
end
