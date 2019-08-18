class AddColumnToProducts < ActiveRecord::Migration[5.2]
  def change
    add_reference :products, :category,    null: false,foreign_key: true,after: :text
    # add_reference :products, :brand,       null: false,foreign_key: true,after: :category_id
    # add_reference :products, :size,        null: false,foreign_key: true,after: :brand_id
  end
end
