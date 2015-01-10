class ProductsController < ApplicationController

   # GET /reviews
# GET /reviews.json
  def index
    @products = Product.all
  end
# GET /reviews/1
# GET /reviews/1.json
  def show
    @product = Product.find(params[:id])
  end
# GET /reviews/new
# GET /reviews/new.json
  def new  
    @product = Product.new
  end
# GET /reviews/1/edit
  def edit
    @product = Product.find(params[:id])
  end
# POST /reviews
# POST /reviews.json
  def create
    @product = Product.new(myparams)
      respond_to do |format|
    if @product.save
      redirect_to products_path
    else
      format.html { render action: "new" }
      format.json { render json: @product.errors, status: :unprocessable_entity }
    end
                 end
  end
# PUT /reviews/1
# PUT /reviews/1.json
  def update
    @product = Product.find(params[:id])
    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
               end
  end
# DELETE /reviews/1
# DELETE /reviews/1.json
  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
  end
end


private 
   
  def myparams
    params.require(:product).permit(:image_url, :title, :description, :count, :price)
  end

end

