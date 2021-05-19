# frozen_string_literal: true

# In-memory database of countries
module Database
  DATA = []

  RAW_DATA = [
    ['India', 'New Delhi', 41, 'DEVELOPING', 1352.62, 1.00, 454.90, 2713.17, 6.10, 1.10, 74.04, 69.00, 716.30, 1.82, 1107.00, 12.00, 24.00,
     20.00, 2_610_550],
    ['Japan', 'Tokyo', 48, 'DEVELOPED', 126.53, -0.20, 347.10, 4954.81, 0.30, 1.06, 99.00, 84.00, 249.40, 8.94, 8983.30, 15.30, 18.00, 19.00,
     303_150],
    ['France', 'Paris', 134, 'DEVELOPED', 66.97, 0.20, 122.30, 2787.20, 1.80, 1.05, 99.00, 83.00, 170.90, 6.89, 8119.20, 24.20, 33.00, 32.00,
     240_200],
    ['China', 'Beijing', 34, 'DEVELOPED', 1392.73, 0.50, 147.80, 13_894.82, 6.70, 1.13, 99.80, 77.00, 2162.20, 7.18, 4212.40, 9.10, 18.00,
     19.00, 2_545_000],
    ['Korea South', 'Seoul', 35, 'DEVELOPING', 51.61, 0.50, 529.20, 1724.85, 2.90, 1.05, 97.90, 83.00, 63.10, 12.11, 10_320.80, 15.50, 37.00,
     42.00, 3_699_000],
    ['Pakistan', 'Islamabad', 7, 'DEVELOPING', 212.22, 2.10, 275.30, 314.57, 5.80, 1.09, 59.00, 67.00, 38.10, 0.99, 703.20, 2.40, 20.00,
     9.00, 653_800],
    ['United Arab Emirates', 'Abu Dhabi', 9, 'DEVELOPED', 9.63, 1.50, 135.60, 422.22, 1.20, 1.04, 93.23, 78.00, 3.20, 22.04, 11_029.30,
     0.10, 67.00, 93.00, 63_000],
    ['United Kingdom', 'London', 114, 'DEVELOPED', 66.46, 0.60, 274.70, 2860.67, 1.30, 1.05, 99.00, 81.00, 31.70, 5.78, 5927.40, 25.60,
     32.00, 31.00, 228_350],
    ['United States', 'Washington D.C.', 60, 'DEVELOPED', 326.69, 0.50, 35.70, 20_580.16, 2.90, 1.05, 99.00, 79.00, 3098.00, 15.50,
     13_883.30, 9.90, 15.00, 12.00, 2_229_250]
  ].freeze

  def insert(country_obj)
    DATA.push(country_obj)
  end

  def search(name, year)
    DATA.select { |rec| rec.name.eql?(name) && rec.year.eql?(year) }[0]
  end

  def delete(name, year)
    DATA.delete(search(name, year))
  end

  def display_record(name, year)
    puts search(name, year).to_s
  end

  def display_all
    DATA.each { |c| puts c.to_s }
  end

  def populate_data
    countries = RAW_DATA.collect do |c_arr|
      c = Country.new(c_arr[0], 2018)
      c.capital = c_arr[1]
      c.no_of_states = c_arr[2]
      c.state_of_country = c_arr[3]
      c.population = Population.new(c_arr[4], c_arr[5], c_arr[6])
      c.gdp = GDP.new(c_arr[7], c_arr[8])
      c.people = People.new(c_arr[9], c_arr[10], c_arr[11])
      c.environment = Environment.new(c_arr[12], c_arr[13], c_arr[14])
      c.market = Market.new(c_arr[15], c_arr[16], c_arr[17])
      c.military_strength = c_arr[18]
      c
    end

    countries.each { |c| Database::DATA.push(c) }
  end
end
