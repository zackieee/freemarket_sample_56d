class SnsCredential < ApplicationRecord
  belongs_to :user
  validates :uid, :provider, null: false
end
