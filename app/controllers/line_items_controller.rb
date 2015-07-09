class LineItemsController < ApplicationController

  def create
    @cart = current_cart
    product = Product.find(params[:product_id])
    @line_item = @cart.add_product(product.id)
    respond_to do |format|
      if @line_item.save
        format.html { redirect_to @line_item.cart }
        format.js { @current_item = @line_item }
      end
    end
  end

  def destroy
    @cart = current_cart
    @line_item = LineItem.find(params[:id])
    
    @line_item.destroy
    respond_to do |format|
      if @line_item.save
        format.html { redirect_to @line_item.cart }
        format.js 
      end
    end
  end

end
