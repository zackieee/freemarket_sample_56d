class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.references      :user,                null: false,foreign_key: true
      t.integer         :card_number,         null: false
      t.date            :expiration_date,     null: false
      t.integer         :card_security_code,  null: false


      t.timestamps
    end
  end
end
