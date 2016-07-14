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

  def edit
    @map = Map.find(params[:id])
  end

  def update
    @map = Map.find(params[:id])
    if @map.user != current_user
      return render text: 'Not Allowed', status: :forbidden
    end

    @map.update_attributes(map_params)
    if @map.valid?
      redirect_to map_path(@map)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @map = Map.find(params[:id])
    @map.destroy
    redirect_to maps_path
  end

  private

  def map_params
    params.require(:map).permit(:title, :description)
  end
end
