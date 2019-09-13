require 'rails_helper'

RSpec.describe CartItem, type: :model do
  it "每個 Cart Item 都可以計算它自己的金額（小計）" do
        cart = Cart.new
        p1 = Product.create(name: 'OnePunch', price: 100)
        p2 = Product.create(name: 'Hunter', price: 50)

        5.times {cart.add_item(p1.id)}
        3.times {cart.add_item(p2.id)}

        expect(cart.items.first.expense).to be 500
        expect(cart.items.last.expense).to be 150
  end
end
