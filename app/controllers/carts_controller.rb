class CartsController < ApplicationController
  

  def show
    
  end

  def destroy
    session[:cart5987] = nil
    redirect_to products_path, notice: "購物車已清空！"
  
  end
 

  
  
end