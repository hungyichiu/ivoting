require 'rails_helper'

RSpec.describe Order, type: :model do


describe '驗證收件人相關資料' do
  context '有效資料' do
    it '填寫完整資料' do
      # o3 = Order.new(recipient: 'kk', phone: '12321435', address: '1223445')
      order = build(:order)
      expect(order.valid?).to be true      
    end
  end

  context '無效資料' do
    it '資料不完整' do
      
      # o1 = Order.new
      # o2 = Order.new(recipient: 'kk', phone: '12321435')
      order = build(:order, :invalid)
      expect(order.valid?).to be false
      # expect(o2.valid?).to be false
   
      
    end
  end
end
end
