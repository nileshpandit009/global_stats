# frozen_string_literal: true

# Examines the country data and determines whether loan will be approved
module IMFLoan
  def check_imf_eligibility(country)
    gdp = country.gdp
    if gdp.current > 2000 && gdp.growth > 2.5
      puts "#{country.name} is eligible for IMF Loan"
    else
      puts "#{country.name} is NOT eligible for IMF Loan"
    end
  end
end
