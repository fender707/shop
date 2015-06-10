class InfoController < ApplicationController
  def index
    if params[:filter]
      @products = Product.filter(params[:filter]).order("Created_at DESC")
    else
      @products = Product.search(params[:keyword]).order("Created_at DESC").limit(5); 
    end
  @cart = current_cart
  end
end
