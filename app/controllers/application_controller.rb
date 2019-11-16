class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :current_cart

  def current_cart
    @current_cart ||= ShoppingCart.new(token: cart_token)
  end
  
  helper_method :current_cart
  
  private
#how does api work into this?
    def cart_token
      return @cart_token unless @cart_token.nil?

      session[:cart_token] ||= SecureRandom.hex(0)
      @cart_token = session[:cart_token]
    end
  
end
