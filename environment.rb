# frozen_string_literal: true

# Contains environment data
class Environment
  attr_accessor :forest_area, :co2_emission, :power_consumption

  def initialize(forest_area, co2_emission, power_consumption)
    @forest_area = forest_area
    @co2_emission = co2_emission
    @power_consumption = power_consumption
  end

  def to_s
    %(Environment:
        Forest area (sq.km): #{@forest_area}
        CO2 Emission (metric tonne): #{@co2_emission}
        Power consumption (kWh): #{@power_consumption})
  end
end
