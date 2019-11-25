class ProductsController < ApplicationController
  def index
    @product = Product.order(:title)
  end
  
  
  def new
    @product = Product.new
  end

  def show
    @product = Product.find(params[:id])
  end
end
