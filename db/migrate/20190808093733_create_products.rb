class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.references   :seller_user,       null: false, foreign_key: { to_table: :users }
      t.references   :buyer_user,        foreign_key: { to_table: :users }
      t.string       :name,              null: false,index: true
      t.text         :text,              null: false
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
