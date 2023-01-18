# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CountryFacade do
  # it 'creates country object from name search', :vcr do
  #   country_name = 'Thailand'
  #   country_object = CountryFacade.country(country_name)

  #   expect(country_object).to be_an_instance_of(Country)
  # end

  it 'creates countries from list of all countries', :vcr do
    country_list = CountryFacade.countries

    expect(country_list).to be_an(Array)
    expect(country_list).to all(be_an_instance_of(Country))
  end

  it 'creates a random country', :vcr do
    country = CountryFacade.random_country

    expect(country).to be_an_instance_of(Country)
  end
end
