class CostController < ApplicationController

  def index
    distance = Distance.find_by(origin: cost_params[:origin], destination: cost_params[:destination])
    @cost = distance.extension * cost_params[:weight] * 0.15    
    render json: @cost
  end

  private
    def cost_params
      params.require(:cost).permit(:origin, :destination, :weight)
    end
end
