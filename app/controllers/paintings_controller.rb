class PaintingsController < ApplicationController

  before_action :paint_params, only: [:show, :create, :update, :destroy]

  def index
    @paintings = Painting.all
  end

  def create
    @painting = Painting.create(paint_params)
    @painting.title = current_user.email
    if @painting.save! 
      redirect_to paintings_path
    end
  end

  def destroy
    @painting = Painting.find(params[:id])
    @painting.title = current_user.email
    @painting.destroy
    redirect_to root_path
  end

  def new
    @painting = Painting.new
  end

  private

  

  def paint_params
    params.require(:painting).permit(:title, :name, :review, :image)
  end

end
