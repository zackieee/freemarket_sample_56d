class CreateSizes < ActiveRecord::Migration[5.2]
  def change
    create_table :sizes do |t|
      t.string        :data,            null: false
      t.integer       :size_category,   null: false

      t.timestamps
    end
  end
end
