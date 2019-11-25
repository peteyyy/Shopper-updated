class Admin::ProductsController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @products = Products.new
  end


end
