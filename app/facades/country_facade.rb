# frozen_string_literal: true

class CountryFacade
  # def self.country(country_name)
  #   country_info = RestCountriesService.get_country(country_name)
  #   Country.new(country_info, country_name)
  # end

  def self.countries
    RestCountriesService.get_all_countries.map do |country|
      Country.new(country)
    end
  end

  def self.random_country
    countries.sample
  end
end
