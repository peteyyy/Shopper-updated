class OrderItemsController < ApplicationController
  def index
    @items = current_user.orders.first.items
  end

  def create
  end

  def destroy
    current_item.destroy
    redirect_to cart_path
  end

  private

  helper_method :current_item
  def current_item
    OrderItem.find(params[:id])
  end

end
