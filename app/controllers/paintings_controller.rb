class PaintingsController < ApplicationController

  before_action :paint_params, only: [:show, :create, :update, :destroy]

  def index
    @paintings = Painting.all
  end

  def create
    @painting = Painting.create(paint_params)
    if @painting.save 
      redirect_to paintings_path
    end
  end

  def new
    @painting = Painting.new
  end

  private

  def paint_params
    params.require(:painting).permit(:name, :review, :image)
  end

end
