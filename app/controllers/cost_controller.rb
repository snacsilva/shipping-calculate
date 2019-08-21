class CostController < ApplicationController

  def index
    raise "Peso inválido!" if (cost_params[:weight] < 0 || cost_params[:weight] > 50)
    @cost = Cost.calculate_cost cost_params
    render json: @cost

  end

  private
    def cost_params
      params.require(:cost).permit(:origin, :destination, :weight)
    end
end
