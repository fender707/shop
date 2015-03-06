class InfoController < ApplicationController
  def index
    @products = Product.search(params[:keyword])
   # else
    #  @products = Product.all.order("Created_at DESC")
   # end

  end
end
