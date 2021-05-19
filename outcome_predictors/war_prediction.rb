# frozen_string_literal: true

# Examines chance of winning a war of a country
module War
  def war_winning_chances(country)
    ms = country.military_strength
    gdp = country.gdp.current
    status = country.state_of_country
    if ms > 2_000_000 && gdp > 5000 && status.eql?('DEVELOPED')
      puts "#{country.name} has very high chance of winning war"
    elsif ms > 1_000_000 && gdp > 2000 && gdp < 5000 && status.eql?('DEVELOPING')
      puts "#{country.name} has good chance of winning war"
    else
      puts "\nWar wining chances cannot be determined"
    end
  end
end
