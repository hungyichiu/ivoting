class Order < ApplicationRecord
  validates :recipient, :phone, :address, presence: true
  belongs_to :user
  has_many :order_items


  include AASM

  aasm column: :status, no_direct_assignment: true do
    state :pending, initial: true
    state :paid, :delivered, :refunded, :cancelled

    event :pay do
      transitions from: :pending, to: :paid

      after do
        puts "發送簡訊"
      end
    end

    event :cancel do
      transitions from: :pending, to: :cancelled
    end

    event :deliver do
      transitions from: :paid, to: :delivered
    end

    event :refund do
      transitions from: [:pending, :paid ], to: :refunded
    end
  end

end
