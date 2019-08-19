class DistancesController < ApplicationController

  def create
    @distance = Distance.find_by(origin: distance_params[:origin], destination: distance_params[:destination])
    if @distance
      @distance.update_attributes(distance_params)
    else
      @distance = Distance.new(distance_params)
    end

    if @distance.save
      render json: @distance, status: :created, location: @distance
    else
      render json: @distance.errors, status: :unprocessable_entity
    end
  end

  private
    def distance_params
      params.require(:distance).permit(:origin, :destination, :extension)
    end
end
