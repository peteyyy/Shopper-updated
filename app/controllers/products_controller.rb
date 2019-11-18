class ProductsController < ApplicationController
  def index
    @product = Product.order(:title)
  end
  
  
  def new
    @product = Product.new
  end

end
