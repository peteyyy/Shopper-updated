class ProductsController < ApplicationController
  def index
    @product = Product.order(:title)
  end
  
  
  def new
    @product = Product.new
  end

#???  not part of video
#  def index
#    @product = Product.all
#    @order_item = current_order.order_items.new
#  end
end
