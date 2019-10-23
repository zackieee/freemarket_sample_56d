class Notification < ApplicationRecord
  belongs_to :product,   optional: true
  belongs_to :trade,     optional: true
  belongs_to :sender,    class_name: 'User', foreign_key: 'sender_id'
  belongs_to :receiver,  class_name: 'User', foreign_key: 'receiver_id'

  #enum設定
  # enum status: { wait_shipping: 0, wait_accept: 1, wait_assess: 2, close: 3 }
  # enum action: { notice: 1, nice: 2, comment: 3, todo: 4 }
  enum checked: { yet: false, already: true }

  #scopeを定義してみる
  scope :recent,        ->                              { order( created_at: :DESC ) }
  scope :chenge_target, ->  ( trade_id,action,status )  { where( trade_id: trade_id, action: action, todo_status: status ) }

end
