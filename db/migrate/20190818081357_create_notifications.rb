class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.references  :sender,      null: false,    foreign_key:  { to_table: :users }
      t.references  :receiver,    null: false,    foreign_key:  { to_table: :users }
      t.references  :product,     optional:true,  foreign_key:  true, default: ""
      t.references  :trade,       optional:true,  foreign_key:  true, default: ""
      t.integer     :action,      null:false
      t.string      :title
      t.text        :message
      t.integer     :todo_status, default: 0,     null: false
      t.boolean     :checked,     default: false, null: false

      t.timestamps
    end
  end
end
