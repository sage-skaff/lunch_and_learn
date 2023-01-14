# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RestCountriesService do
  it 'gets a list of all countries' do
    response = RestCountriesService.get_all_countries

    expect(response).to be_a(Array)
    expect(response.first).to be_a(Hash)
    expect(response.first).to have_key(:name)
    expect(response.first).to have_key(:demonyms)
    expect(response.first[:demonyms]).to have_key(:eng)
    expect(response.first).to have_key(:subregion)
    expect(response.first[:name]).to have_key(:common)
  end

  it 'gets a country by name' do
    response = RestCountriesService.get_country(country)

    expect(response).to be_a(Array)
    expect(response.first).to be_a(Hash)
    expect(response.first).to have_key(:name)
    expect(response.first).to have_key(:demonyms)
    expect(response.first[:demonyms]).to have_key(:eng)
    expect(response.first).to have_key(:subregion)
    expect(response.first[:name]).to have_key(:common)
  end
end
