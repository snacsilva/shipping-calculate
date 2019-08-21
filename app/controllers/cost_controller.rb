class CostController < ApplicationController

  def index

    @cost = Cost.calculate_cost cost_params
    render json: @cost

  end

  private
    def cost_params
      params.require(:cost).permit(:origin, :destination, :weight)
    end
end
