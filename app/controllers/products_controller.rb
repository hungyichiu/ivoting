class ProductsController < ApplicationController
  before_action :find_product, only: [:show, :add_to_cart]

  def index
    @products = Product.all
  end

  def show
    
  end

  def add_to_cart
    # cart = Cart.new
    # cart = Cart.from_hash(session[:cart5987])
    current_cart.add_item(@product.id)

    session[:cart5987] = current_cart.serialize

    redirect_to products_path, notice: '已加入購物車'
  end

  private
  
  def find_product
    @product = Product.find(params[:id])  
  end

  def current_cart
    # Cart.from_hash(session[:cart5987]) #這樣寫有問題
    # @cart = @cart || Cart.from_hash(session[:cart5987])

    @cart || @cart = Cart.from_hash(session[:cart5987])
    # @cart ||= Cart.from_hash(session[:cart5987])  
    
  end
  
end
