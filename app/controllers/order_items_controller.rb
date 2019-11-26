class OrderItemsController < ApplicationController
  def index
    @items = current_user.orders.first.items
  end

  def create
  end

  def destroy
  end

end
