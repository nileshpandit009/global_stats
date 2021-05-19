# frozen_string_literal: true

# Contains GDP data
class GDP
  attr_accessor :current, :growth

  def initialize(current, growth)
    @current = current
    @growth = growth
  end

  def to_s
    %(GDP:
        Current ($US billion): #{@current}
        Growth rate: #{@growth})
  end
end
