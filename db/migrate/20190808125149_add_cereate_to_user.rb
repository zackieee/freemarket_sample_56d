class AddCereateToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :nickname,       :string,            null: false, default: ""
    add_column :users, :introduction,   :text
    add_column :users, :firstname,      :string,            null: false
    add_column :users, :lastname,       :string,            null: false
    add_column :users, :firstname_kana, :string,            null: false
    add_column :users, :lastname_kana,  :string,            null: false
    add_column :users, :birthday,       :date,              null: false
    add_column :users, :tel,            :string,            null: false, unique: true
    add_column :users, :sales_amount,   :integer,           default: "0"
  end
end
