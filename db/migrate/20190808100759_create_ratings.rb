class CreateRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :ratings do |t|
      t.references      :rated_user,         null: false, foreign_key: { to_table: :users }
      t.references      :rater_user,         null: false, foreign_key: { to_table: :users }
      t.integer         :rate,               null: false

      t.timestamps
    end
  end
end
