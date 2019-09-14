class Order < ApplicationRecord
  validates :recipient, :phone, :address, presence: true
  
  has_many :order_items
end
