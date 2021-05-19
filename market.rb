# frozen_string_literal: true

# Contains market data
class Market
  attr_accessor :tax_revenue, :imports, :exports

  def initialize(tax_revenue, imports, exports)
    @tax_revenue = tax_revenue
    @imports = imports
    @exports = exports
  end

  def to_s
    %(Market:
        Tax revenue (% of GDP): #{@tax_revenue}
        Imports (% of GDP): #{@imports}
        exports (% of GDP): #{@exports})
  end
end
