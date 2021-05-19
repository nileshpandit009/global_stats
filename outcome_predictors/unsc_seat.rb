# frozen_string_literal: true

# Examines country data and determines whether UNSC seat will be granted.
module UNSCSeat
  def check_unsc_eligibility(country)
    population = country.population
    if country.military_strength > 200_000 && population.total > 300
      puts "#{country.name} could be granted a temporary seat at UNSC"
    else
      puts "#{country.name} does not meet criteria for a temporary seat at UNSC"
    end
  end
end
