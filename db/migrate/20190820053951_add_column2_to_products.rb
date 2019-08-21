class AddColumn2ToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products,       :brand_id,    :integer,      null: true,after: :category_id
  end
end
