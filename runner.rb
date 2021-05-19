# frozen_string_literal: true

require './country'
require './gdp'
require './population'
require './people'
require './market'
require './environment'
require './database'
require './outputs/imf_loan'
require './outputs/unsc_seat'
require './outputs/war_prediction'

# Runner class
class CountryDatabase
  extend Database
  include IMFLoan
  include UNSCSeat
  include War
  def initialize
    CountryDatabase.populate_data
  end

  def show_menu
    puts "\nWelcome to country database"
    puts '1. Add new country data'
    puts '2. Display one record'
    puts '3. Display all records'
    puts '4. Delete a countries data'
    puts '5. IMF eligibility'
    puts '6. UNSC seat eligibility'
    puts '7. War winning chances'
    puts '0. Exit'
    puts 'Choose operation: '

    gets.chomp.to_i
  end

  def add_new_data
    name_year = read_name_year

    new_c = read_country_common_data(name_year)
    new_c.population = read_population_data
    new_c.gdp = read_gdp_data
    new_c.people = read_people_data
    new_c.environment = read_environment_data
    new_c.market = read_market_data

    CountryDatabase.insert(new_c)
  end

  def delete_by_name_year
    n_y = read_name_year
    name = n_y.first[0]
    year = n_y.first[1]
    CountryDatabase.delete(name, year)
    puts "Successfully deleted: #{name} #{year}"
  end

  def search_by_name_year
    n_y = read_name_year
    name = n_y.first[0]
    year = n_y.first[1]
    CountryDatabase.search(name, year)
  end

  def display_record
    n_y = read_name_year
    name = n_y.first[0]
    year = n_y.first[1]
    CountryDatabase.display_record(name, year)
  end

  def imf_loan_eligibility
    n_y = read_name_year
    name = n_y.first[0]
    year = n_y.first[1]
    check_imf_eligibility(CountryDatabase.search(name, year))
  end

  def unsc_seat_eligibility
    n_y = read_name_year
    name = n_y.first[0]
    year = n_y.first[1]
    check_unsc_eligibility(CountryDatabase.search(name, year))
  end

  def war_winning_chances
    n_y = read_name_year
    name = n_y.first[0]
    year = n_y.first[1]
    super(CountryDatabase.search(name, year))
  end

  def input(message)
    puts message
    gets.chomp
  end

  def read_name_year
    name = input('Enter country name')
    year = input('Enter year').to_i
    { name => year }
  end

  private

  def read_country_common_data(name_year)
    new_c = Country.new(name_year.first[0], name_year.first[1])
    new_c.no_of_states = input('Enter number of states: ').to_i
    new_c.state_of_country = input('What is the status of country? (Developed / Developing)')
    new_c.military_strength = input('What is the military strength?').to_i
    new_c
  end

  def read_gdp_data
    cur_gdp = input('What is current gdp? (billions $US)').to_f
    annual_gr = input('What is annual growth? (annual %)').to_f
    GDP.new(cur_gdp, annual_gr)
  end

  def read_population_data
    tot_pop = input('What is population? (in millions)').to_f
    gr = input('What is population growth rate? (annual %)').to_f
    dn = input('What is population density? (Per Sq.Km)').to_f
    Population.new(tot_pop, gr, dn)
  end

  def read_people_data
    sr = input('What is sex ratio? (males / female)').to_f
    literacy = input('What is literacy percentage?').to_f
    life_expectancy = input('What is life expectancy? (years)').to_f
    People.new(sr, literacy, life_expectancy)
  end

  def read_environment_data
    forest_area = input('Total forest area? (sq.km)').to_f
    co2 = input('CO2 emission? (metric tonne)').to_f
    power_consumption = input('Power Consumption? (kWh)').to_f
    Environment.new(forest_area, co2, power_consumption)
  end

  def read_market_data
    tax = input('Tax revenue? (% of GDP)').to_f
    imports = input('Amount of goods imported? (% of GDP)').to_f
    exports = input('Amount of goods exported? (% of GDP)').to_f
    Market.new(tax, imports, exports)
  end
end

cdb = CountryDatabase.new

exit_flag = false
until exit_flag
  choice = cdb.show_menu

  case choice
  when 1
    cdb.add_new_data
  when 2
    cdb.display_record
  when 3
    CountryDatabase.display_all
  when 4
    cdb.delete_by_name_year
  when 5
    cdb.imf_loan_eligibility
  when 6
    cdb.unsc_seat_eligibility
  when 7
    cdb.war_winning_chances
  when 0
    puts 'Bye :)'
    exit_flag = true
  else
    puts 'Invalid choice'
  end
end
