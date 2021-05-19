# frozen_string_literal: true

# So far we have Country data in country obj
# We need a way to store data of same country year-wise

# This class contains all data about a country
class Country
  attr_accessor :name, :year, :no_of_states, :capital,
                :military_strength, :state_of_country,
                :population, :people, :gdp, :market, :environment

  def initialize(name, year)
    @name = name
    @year = year
  end

  def to_s
    %(Country:
      #{@name} (#{@year})
      Capital: #{@capital}
      No. of states: #{@no_of_states}
      Military strength: #{@military_strength}
      State of country: #{@state_of_country}
      #{@population}
      #{@people}
      #{@environment}
      #{@gdp}
      #{@market}\n)
  end

  def eql?(other)
    @name.eql?(other.name) && @year.eql?(other.year)
  end

  def ==(other)
    eql?(other)
  end

  def hash
    [name, year].hash
  end
end
