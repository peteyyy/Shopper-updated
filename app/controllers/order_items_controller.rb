class OrderItemsController < ApplicationController
  def index
    @items = current_cart.order.items
  end

  def create
    current_cart.add_item(product_id: params[:product_id], quantity: params[:quantity])
    redirect_to products_path
  end

  #def create
   # @order = current_order
   # @item = @order.order_items.new(items_params)
   # @order.save
   # session[:order_id] = @order.id 
   # redirects_to products_path
 # end

  private

  def items_params
    params.require(:order_item).permit(:quantity, :product_id)
    end

  def destroy
    @order = current_order
    @item = @order.order_items.find(params[:id])
    @item.destroy
    @order.save
    redirect_to cart_path
  end

end
