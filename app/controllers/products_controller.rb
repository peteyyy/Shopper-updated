class ProductsController < ApplicationController
  def new
    @products = Product.new
  end

  def index
    @products = Products.all
    @order_item = current_order.order_items.new
  end
end
