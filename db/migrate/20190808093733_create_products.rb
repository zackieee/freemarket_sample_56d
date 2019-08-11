class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.references   :seller,            null: false, foreign_key: { to_table: :users }
      t.string       :name,              null: false,index: true
      t.text         :text,              null: false
      t.integer      :status_id        
      t.integer      :postage_burden_id
      t.integer      :prefecture_id     
      t.integer      :delivery_days_id
      t.integer      :price,             null: false
      t.integer      :sales_status_id,   null: false, default: "1"

      t.timestamps
    end
  end
end
