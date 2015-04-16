class InfoController < ApplicationController
  def index
    if params[:filter]
      @products = Product.search(params[:keyword]).order("Created_at DESC").filter(params[:filter])
    else
      @products = Product.search(params[:keyword]).order("Created_at DESC").limit(6); 
    end
  end
end
