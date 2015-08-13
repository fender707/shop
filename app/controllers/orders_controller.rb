class OrdersController < ApplicationController

before_action :find_order, only: [:show,:destroy,:edit]
  def index 
    @orders = Order.paginate(:page => params[:page], :per_page => 10).order('created_at DESC')
  end

  def show
    @order = Order.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
         pdf = OrderPdf.new(@order)
         send_data pdf.render, filename: "order_#{@order.id}.pdf",
   			       type: "application/pdf",
			       disposition: "inline"
      end
    end
  end

  def create 
    @order = Order.new(order_params)
    @order.add_line_items_from_cart(current_cart)
      
      respond_to do |format|
        if @order.save
	  Cart.destroy(session[:cart_id])
	  session[:cart_id] = nil
	  #Notifier.welcome(@order).deliver
          format.html {redirect_to root_path, notice:
	    'Thank you for your order.'}
 	  format.json {render json: @order, status: :created,
	    location: @order }
	else
	  @cart = current_cart
           format.html { render action: "new" }
 	   format.json { render json: @order.errors, status: :unprocessable_entity }
	end
      end
  end  
    

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

  def destroy 
   @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_path}
      format.json { head :no_content }
    end
  end

  private
  
  def find_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:name, :address, :email, :country_id, :state_id)
  end
end
