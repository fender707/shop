class PaintingsController < ApplicationController

  before_action :paint_params, only: [:show, :create, :update, :destroy]

  def index
    @painting = Painting.all
  end

  def create
    @painting = Painting.create(params[:painting])
  end

  def new
    @painting = Painting.new
  end

  private

  def paint_params
    params.require(:painting).permit(:name, :review, :image)
  end

end
