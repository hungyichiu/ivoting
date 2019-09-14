class CartsController < ApplicationController
  before_action :check_login, only: [:checkout]

  def show
    
  end

  def destroy
    session[:cart5987] = nil
    redirect_to products_path, notice: "購物車已清空！"
  
  end

  def checkout
    # @order = Order.new 
    @order = current_user.orders.build # 一對多的寫法
             # current_user.build_order 一對一的寫法
    
  end
 
  private
  def check_login
    redirect_to new_user_session_path, notice: " 請先登入會員 " unless user_signed_in?
  end

  
  
end
