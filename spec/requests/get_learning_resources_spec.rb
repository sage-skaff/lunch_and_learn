# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Get Recipes' do
  it 'returns learning resources by country', :vcr do
    country = 'Thailand'

    get "/api/v1/learning_resources?country=#{country}"

    expect(response).to be_successful

    parsed_response = JSON.parse(response.body, symbolize_names: true)

    expect(parsed_response).to be_a(Hash)
    expect(parsed_response).to have_key(:data)
    expect(parsed_response[:data]).to be_a(Array)
    expect(parsed_response[:data].first).to have_key(:id)
    expect(parsed_response[:data].first).to have_key(:type)
    expect(parsed_response[:data].first).to have_key(:attributes)
    expect(parsed_response[:data].first[:attributes]).to have_key(:country)
    expect(parsed_response[:data].first[:attributes]).to have_key(:video)
    expect(parsed_response[:data].first[:attributes][:video]).to have_key(:title)
    expect(parsed_response[:data].first[:attributes][:video]).to have_key(:youtube_video_id)
    expect(parsed_response[:data].first[:attributes]).to have_key(:images)
    expect(parsed_response[:data].first[:attributes][:images].first).to have_key(:alt_tag)
    expect(parsed_response[:data].first[:attributes][:images].first).to have_key(:url)
  end
end
