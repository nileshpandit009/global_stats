# frozen_string_literal: true

# Contains People data
class People
  attr_accessor :sex_ratio, :literacy, :life_expectancy

  def initialize(sex_ratio, literacy, life_expectancy)
    @sex_ratio = sex_ratio
    @literacy = literacy
    @life_expectancy = life_expectancy
  end

  def to_s
    %(People:
        Sex ratio: #{@sex_ratio}
        Literacy (%): #{@literacy}
        Life expectancy (years): #{@life_expectancy})
  end
end
