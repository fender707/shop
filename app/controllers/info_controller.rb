class InfoController < ApplicationController
  def index
    if params[:search]
      @products = Product.search(params[:search]).order("Created_at DESC")
    else
      @products = Product.all.order("Created_at DESC")
    end

  end
end
