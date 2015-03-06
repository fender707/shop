class ProductsController < ApplicationController

  before_action :find_product, only: [:show,:update,:destroy,:edit]
   # GET /reviews
# GET /reviews.json
  def index
    if params[:search]
      @products = Product.search(params[:keyword])
    else
      @products = Product.all.order("Created_at DESC")
    end
  end
# GET /reviews/1
# GET /reviews/1.json
  def show
  end
# GET /reviews/new
# GET /reviews/new.json
  def new  
    @product = Product.new
  end
# GET /reviews/1/edit
  def edit
  end
# POST /reviews
# POST /reviews.json
  def create
    @product = Product.new(myparams)
      respond_to do |format|
    if @product.save
      format.html {redirect_to @product, notice: 'Product was successfully created.'}
    else
      format.html { render action: "new" }
      format.json { render json: @product.errors, status: :unprocessable_entity }
    end
                 end
  end
# PUT /reviews/1
# PUT /reviews/1.json
  def update
    respond_to do |format|
      if @product.update_attributes(myparams)
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
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
  end
end


private 
   
  def find_product
    @product = Product.find(params[:id])
  end

  def myparams
    params.require(:product).permit(:image_url, :title, :description, :count, :price)
  end

end

