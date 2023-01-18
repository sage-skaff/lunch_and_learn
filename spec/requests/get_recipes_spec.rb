# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Get Recipes', vcr: { record: :new_episodes } do
  it 'returns recipes by country' do
    country = 'Thailand'

    get "/api/v1/recipes?country=#{country}"

    expect(response).to be_successful

    parsed_response = JSON.parse(response.body, symbolize_names: true)

    expect(parsed_response).to be_a(Hash)
    expect(parsed_response).to have_key(:data)
    expect(parsed_response[:data]).to be_a(Array)
    expect(parsed_response[:data].first).to have_key(:id)
    expect(parsed_response[:data].first).to have_key(:type)
    expect(parsed_response[:data].first).to have_key(:attributes)
    expect(parsed_response[:data].first[:attributes]).to have_key(:title)
    expect(parsed_response[:data].first[:attributes]).to have_key(:url)
    expect(parsed_response[:data].first[:attributes]).to have_key(:image)
    expect(parsed_response[:data].first[:attributes]).to have_key(:country)
    expect(parsed_response[:data].first[:attributes][:country]).to eq('Thailand')
  end

  it 'returns empty if empty string is present' do
    get '/api/v1/recipes?country='

    expect(response).to be_successful

    parsed_response = JSON.parse(response.body, symbolize_names: true)

    expect(parsed_response).to be_a(Hash)
    expect(parsed_response).to have_key(:data)
    expect(parsed_response[:data]).to eq([])
  end

  it 'returns random country if no params are present' do
    get '/api/v1/recipes'

    expect(response).to be_successful

    parsed_response = JSON.parse(response.body, symbolize_names: true)

    expect(parsed_response).to be_a(Hash)
    expect(parsed_response).to have_key(:data)
    expect(parsed_response[:data]).to be_a(Array)
    expect(parsed_response[:data].first).to have_key(:id)
    expect(parsed_response[:data].first).to have_key(:type)
    expect(parsed_response[:data].first).to have_key(:attributes)
    expect(parsed_response[:data].first[:attributes]).to have_key(:title)
    expect(parsed_response[:data].first[:attributes]).to have_key(:url)
    expect(parsed_response[:data].first[:attributes]).to have_key(:country)
    expect(parsed_response[:data].first[:attributes]).to have_key(:image)
  end
end
