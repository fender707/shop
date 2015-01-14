class OrdersController < ApplicationController

  def new 
    @cart = current_cart
    if @cart.line_items.empty?
      redirect_to root_path, notice: "Your cart is empty"
      return
    end
  
    @order = Order.new
    respond_to do |format|
      format.html
    end
  end
end
