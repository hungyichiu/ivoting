class Cart
  attr_reader :items
  def initialize(items = [] )
    @items = items
  end

  def add_item(product_id)
    # @items << product_id
    found_item = items.find{ |item| item.product_id == product_id }

    if found_item
      found_item.increment(1)
    else
      @items << CartItem.new(product_id)
    end

  end

  def empty?
    @items.empty?
  end

  def present?
    !empty? 
  end

  def total_cost
     total = @items.reduce(0){|sum,i| sum + i.expense}
     if super_good_day?
       total = total * 0.9
     end
     total
  end

  def serialize
    # {
    #   "items" => [
    #     {"product_id" => 1, "quantity" => 3},
    #     {"product_id" => 2, "quantity" => 2}
    #   ]
    # }
    list = @items.map{|i| {"product_id" => i.product_id, "quantity" => i.quantity} }

    { "items" => list }
    # list = []

    # @items.each do|i| 
    #   list << {"product_id" => i.product_id, "quantity" => i.quantity}
    # end

  end

  def self.from_hash(hash = nil)

    if hash && hash['items']
      # list = []
      # hash["items"].each do |i|
      #   list << CartItem.new(i["product_id"], i["quantity"])
      # end
      # Cart.new(list)
      list = hash['items'].map{ |i| CartItem.new(i["product_id"], i["quantity"]) }
      new list
    else
      # Cart.new
      new
    end
    
  end


  private
  def super_good_day?
    Time.now.month == 2 && Time.now.day == 10
  end

  def is_xmas
    Time.now.month == 12 && Time.now.day == 25
  end
end