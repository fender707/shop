class CartsController < ApplicationController  

  before_action :find_cart, only: [ :show, :destroy, :update, :edit]

  def index
    @carts = Cart.all
  end

  def show
  end

  def new  
    @cart = Cart.new
  end

  def edit
  end

  def create
    @cart = Cart.new(params[:cart])
      respond_to do |format|
    if @cart.save
      redirect_to carts_path
    else
      format.html { render action: "new" }
      format.json { render json: @cart.errors, status: :unprocessable_entity }
    end
                 end
  end

  def update
    respond_to do |format|
      if @cart.update_attributes(params[:cart])
        format.html { redirect_to @cart, notice: 'Cart was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
               end
  end

  def destroy
    @cart = current_cart
    @cart.destroy
    session[:cart_id] = nil
    respond_to do |format|
      format.html { redirect_to root_path,
      notice: 'Your cart is currently empty!' }
      format.json { head :ok }
  end
end

  private
    def find_cart
      @cart = Cart.find(params[:id])
    end

end
