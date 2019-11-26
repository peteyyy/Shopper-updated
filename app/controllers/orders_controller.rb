class OrdersController < ApplicationController

  def new
  end

  def create
  end

   def add_item
    product_id = params[:product_id]
    quantity = params[:quantity]
    product = Product.find(product_id)
    order_item = current_order.items.find_or_create_by(product_id: product_id, quantity: quantity, order_id: current_order.id)
    redirect_to cart_path
  end

  private


  helper_method :current_order
  def current_order
    current_user.orders.each do |order|
      if order.status == "cart"
        return @order = order
      end
    end
    if !@order
      return @order = Order.create(:order_params)
    end
  end

  def order_params
    params.require(:order).permit(:user_id, :status, :subtotal)
  end
end
