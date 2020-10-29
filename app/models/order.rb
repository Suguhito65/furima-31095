class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :address
  belongs_to_active_hash :prefecture
end
