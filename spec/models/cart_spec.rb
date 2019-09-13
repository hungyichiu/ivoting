require 'rails_helper'

RSpec.describe Cart, type: :model do
  describe "購物車基本功能" do
      it "可以把商品丟到到購物車裡，然後購物車裡就有東西了" do
        cart = Cart.new
        cart.add_item(1)
        expect(cart.empty?).to be false
      end
      it "如果加了相同種類的商品到購物車裡，購買項目（CartItem）並不會增加，但商品的數量會改變" do
        cart= Cart.new

        5.times {cart.add_item(1)}
        3.times {cart.add_item(2)}

        expect(cart.items.length).to be 2
        expect(cart.items.first.quantity).to be 5
        expect(cart.items.last.quantity).to be 3
      end
      it "商品可以放到購物車裡，也可以再拿出來" do
        cart = Cart.new
        p1 = Product.create(name: 'OnePunch')
        p2 = Product.create(name: 'Hunter')

        5.times {cart.add_item(p1.id)}
        3.times {cart.add_item(p2.id)}

        expect(cart.items.first.product_id).to be p1.id
        expect(cart.items.last.product_id).to be p2.id
        expect(cart.items.first.product).to be_a Product
      end
      
      it "可以計算整台購物車的總消費金額" do
        cart = Cart.new
        p1 = Product.create(name: 'OnePunch', price: 100)
        p2 = Product.create(name: 'Hunter', price: 50)

        5.times {cart.add_item(p1.id)}
        3.times {cart.add_item(p2.id)}

        expect(cart.total_cost).to be 650
      end
      it "特別活動可能可搭配折扣（例如聖誕節的時候全面打 9 折，或是滿額滿千送百）" do
        t = Time.local(2008, 2, 10, 10, 5, 0)
        Timecop.travel(t)

        cart = Cart.new
        p1 = Product.create(name: 'OnePunch', price: 100)
        p2 = Product.create(name: 'Hunter', price: 50)

        5.times {cart.add_item(p1.id)}
        4.times {cart.add_item(p2.id)}

        expect(cart.total_cost).to eq 630

      end
    end

    describe "購物車進階功能" do
      it "可以將購物車內容轉換成 Hash，存到 Session 裡"
      it "可以把 Session 的內容（Hash 格式），還原成購物車的內容"
    end
end

# 基本功能
# 以下是我們對於購物車的期望：

# 可以把商品丟到到購物車裡，然後購物車裡就有東西了。
# 如果加了相同種類的商品到購物車裡，購買項目（CartItem）並不會增加，但商品的數量會改變。
# 商品可以放到購物車裡，也可以再拿出來。
# 每個 Cart Item 都可以計算它自己的金額（小計）。
# 可以計算整台購物車的總消費金額。
# 特別活動可搭配折扣（例如聖誕節的時候全面打 9 折，或是滿額滿千送百或滿額免運費）。
# 進階功能
# 因為購物車將會以 Session 方式儲存，所以：

# 可以將購物車內容轉換成 Hash 並存到 Session 裡。
# 也可以存放在 Session 的內容（Hash 格式），還原成購物車的內容。
