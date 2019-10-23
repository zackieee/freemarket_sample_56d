class AddColumnToRating < ActiveRecord::Migration[5.2]
  def change
    add_column    :ratings,   :user_rate,     :integer, default: 0
    add_column    :ratings,   :product_rate,  :integer, default: 0
  end
end
