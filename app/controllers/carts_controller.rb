class CartsController < ApplicationController  

  def index
    @carts = Cart.all
  end

  def show
    @cart = Cart.find(params[:id])
  end

  def new  
    @cart = Cart.new
  end

  def edit
    @cart = Cart.find(params[:id])
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
    @cart = Cart.find(params[:id])
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
    @cart = Cart.find(params[:id])
    @cart.destroy
    respond_to do |format|
      format.html { redirect_to carts_url }
      format.json { head :no_content }
  end
end

end
