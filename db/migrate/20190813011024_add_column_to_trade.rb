class AddColumnToTrade < ActiveRecord::Migration[5.2]
  def change
    add_column :trades, :pay_id, :string, after: :buyer_id
  end
end
