class Admin::ProductsController < ApplicationController
  before_action :authenticate_user!
  
  def new
  end


end
