class CartsController < ApplicationController
  before_action :check_login, only: [:checkout]

  def show
    
  end

  def destroy
    session[:cart5987] = nil
    redirect_to products_path, notice: "購物車已清空！"
  
  end

  def checkout
    
  end
 
  private
  def check_login
    redirect_to new_user_session_path, notice: " 請先登入會員 " unless user_signed_in?
  end

  
  
end
