class Cost < ApplicationRecord

  def self.calculate_cost cost
    distance = Distance.find_by(origin: cost[:origin], destination: cost[:destination])
    if distance
      distance_or = Distance.where.not(id: distance.id).where("origin = ? or destination = ?", cost[:origin], cost[:destination])
      total = distance_or.sum(:extension)

      if distance.extension < total
        @cost = distance.extension * cost[:weight] * 0.15    
      else
        @cost = total * cost[:weight] * 0.15    
      end
    else
      raise "Caminho não existe no sistema."
    end
  end
end
