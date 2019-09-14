class Order < ApplicationRecord
  validates :recipient, :phone, :address, presence: true
  belongs_to :user
  has_many :order_items
end
