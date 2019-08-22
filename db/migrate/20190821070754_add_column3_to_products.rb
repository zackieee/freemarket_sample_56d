class AddColumn3ToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products,       :size_id,    :integer,      null: true,after: :brand_id
  end
end
