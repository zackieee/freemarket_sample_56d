class CreateBrands < ActiveRecord::Migration[5.2]
  def change
    create_table :brands do |t|
      t.string      :name,                  null: false, index: true
      # t.string      :brand_category,        null: false

      t.timestamps
    end
  end
end
