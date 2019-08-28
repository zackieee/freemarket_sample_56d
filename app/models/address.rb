class Address < ApplicationRecord
  belongs_to :user
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  # 指定なしの場合のバリデーション
  validates :postal_code,
    presence: true,
    format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'のフォーマットが不適切です'}
  validates :prefecture_id,
    presence: true
  validates :city,
    presence: true,
    length:{ maximum: 50}
  validates :address_number,
    presence: true,
    length:{ maximum: 100}
  validates :building_name,
    length:{ maximum: 100} 

  # 発送元・お届け先住所入力画面用のバリデーション
  with_options on: :address do | address |
    address.validates :postal_code,
      presence: true,
      format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'のフォーマットが不適切です'}
    address.validates :prefecture_id,
      presence: true
    address.validates :city,
      presence: true,
      length:{ maximum: 50}
    address.validates :address_number,
      presence: true,
      length:{ maximum: 100}
    address.validates :building_name,
      length:{ maximum: 100} 
  end

end
