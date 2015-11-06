class ProductsController < ApplicationController
  before_action :authenticate_user!
  include Rails.application.routes.url_helpers
  before_action :find_product, only: [:show,:update,:destroy,:edit]
   # GET /reviews
# GET /reviews.json
  def index

    if params[:search]
      @products = Product.search(params[:keyword]).filter(params[:filter])
      @categories = Category.all
      @new_path = new_product_path
      @product_a = Product.new         #for modal partial rendering
    else
      @products = Product.all.order("Created_at DESC")
      @categories = Category.all
      @new_path = new_product_path
      @product_a = Product.new         #for modal partial rendering
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
respond_to do |format|
    format.html  #If it's a html request this line tell rails to look for new_release.html.erb in your views directory
    format.js #If it's a js request this line tell rails to look for new_release.js.erb in your views directory
  end
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

