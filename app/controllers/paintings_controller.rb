class PaintingsController < ApplicationController

  before_action :paint_params, only: [:show, :create, :update, :destroy]

  def index
    @painting = Painting.all
  end

  private

  def paint_params
    params.require(:painting).permit(:name, :review, :image)
  end

end
