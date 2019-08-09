class CreateProductBrands < ActiveRecord::Migration[5.2]
  def change
    create_table :product_brands do |t|
      t.references  :product,       null: false,foreign_key: true
      t.references  :brand,         null: false,foreign_key: true

      t.timestamps
    end
  end
end
