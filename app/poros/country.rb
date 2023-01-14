# frozen_string_literal: true

class Country
  attr_reader :name, :demonym, :subregion

  def initialize(country_info, country_name)
    @name = country_name.capitalize
    @demonym = country_info[:demonyms][:eng][:f]
    @subregion = country_info[:subregion]
  end
end
