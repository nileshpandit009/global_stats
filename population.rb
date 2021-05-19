# frozen_string_literal: true

# Contains population data
class Population
  attr_accessor :total, :growth_rate, :density

  def initialize(total = nil, growth_rate = nil, density = nil)
    @total = total
    @growth_rate = growth_rate
    @density = density
  end

  def to_s
    %(Population:
        Total (millions): #{@total}
        Growth rate: #{@growth_rate}
        Density (per sq.km): #{@density})
  end
end
