class DistancesController < ApplicationController
  before_action :set_distance, only: [:show, :update, :destroy]

  def index
    @distances = Distance.all

    render json: @distances
  end

  def show
    render json: @distance
  end

  def create
    @distance = Distance.new(distance_params)

    if @distance.save
      render json: @distance, status: :created, location: @distance
    else
      render json: @distance.errors, status: :unprocessable_entity
    end
  end

  def update
    if @distance.update(distance_params)
      render json: @distance
    else
      render json: @distance.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @distance.destroy
  end

  private
    def set_distance
      @distance = Distance.find(params[:id])
    end

    def distance_params
      params.require(:distance).permit(:origin, :destination, :extension)
    end
end
