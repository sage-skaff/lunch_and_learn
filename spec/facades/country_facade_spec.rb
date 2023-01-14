# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CountryFacade do
  it 'creates country object from name search' do
    country_name = 'Thailand'
    country_object = CountryFacade.country(country_name)

    expect(country_object).to be_an_instance_of(Country)
  end
end
