class InfoController < ApplicationController
  def index
    if params[:set_locale]
	 redirect_to root_path(locale: params[:set_locale])
    else
      if params[:filter]
        @products = Product.filter(params[:filter]).order("Created_at DESC")
      else
        @products = Product.search(params[:keyword]).order("Created_at DESC").limit(5); 
      end
    end
  @cart = current_cart
  end
end
