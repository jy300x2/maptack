class MapsController < ApplicationController
  before_action :authenticate_user!

  def index
    @maps = Map.all
  end

  def new
    @map = Map.new
  end

  def create
    @map = current_user.maps.create(map_params)
    redirect_to map_path(@map)
  end

  def show
    @map = Map.find(params[:id])
  end

  def destroy
  end

  private

  def map_params
    params.require(:map).permit(:title, :description)
  end
end
