class AddTradeStatusToTrades < ActiveRecord::Migration[5.2]
  def change
    add_column  :trades,  :trade_status,  :integer,  default: "0"
  end
end