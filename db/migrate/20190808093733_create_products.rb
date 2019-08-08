class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.references   :user,              null: false,foreign_key: true
      t.references   :category,          null: false,foreign_key: true
      t.references   :brand,             null: false,foreign_key: true
      t.string       :name,              null: false,index: true
      t.text         :text,              null: false,index: true
      t.referemces   :size,              null: false
      t.integer      :status,            null: false
      t.integer      :postage_burden,    null: false
      t.string       :buyer_area,        null: false
      t.string       :delivery_days,     null: false
      t.integer      :price,             null: false
      t.integer      :sales_status,      null: false, default: "0"
      t.timestamps
    end
  end
end
