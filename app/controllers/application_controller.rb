class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  helper_method :current_cart

  private
  def record_not_found
    render :file => 'public/404.html', 
           :status => :not_found,
           :layout => false
  end

  def current_cart
    # Cart.from_hash(session[:cart5987]) #這樣寫有問題
    # @cart = @cart || Cart.from_hash(session[:cart5987])

    @cart || @cart = Cart.from_hash(session[:cart5987])
    # @cart ||= Cart.from_hash(session[:cart5987])  
    
  end
end
