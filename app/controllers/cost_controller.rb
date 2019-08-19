class CostController < ApplicationController

  def index
    # puts cookies[:origin]
    p request.headers["Cookie"]

    distance = Distance.find_by(origin: cost_params[:origin], destination: cost_params[:destination])
    if distance
      distance_or = Distance.where.not(id: distance.id).where("origin = ? or destination = ?", cost_params[:origin], cost_params[:destination])
      total = distance_or.sum(:extension)

      if distance.extension < total
        @cost = distance.extension * cost_params[:weight] * 0.15    
      else
        @cost = total * cost_params[:weight] * 0.15    
      end
      render json: @cost
    else
      render json: { msg: "Caminho não existe no sistema."} , status: :unprocessable_entity
    end
  end

  private
    def cost_params
      params.require(:cost).permit(:origin, :destination, :weight)
    end
end
