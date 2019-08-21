class Distance < ApplicationRecord
  before_save :validation

  def validation
    if self.extension < 0 || self.extension > 100000 
      raise 'Distância não permitida.'
    end
  end
end
