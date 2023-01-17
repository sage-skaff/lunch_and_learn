# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Post User Favorite' do
  it 'creates a user favorite from json body' do
    user = User.create!(name: 'Ahsoka Tano', email: 'atano@jedi.com', api_key: SecureRandom.base64)
    json_payload = {
      "api_key": user.api_key,
      "country": 'Peru',
      "recipe_link": 'https://www.epicurious.com/recipes/food/views/peruvian-ceviche-395483',
      "recipe_title": 'Peruvian Ceviche'
    }
    post '/api/v1/favorites', params: json_payload.to_json,
                              headers: { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

    expect(response).to have_http_status(201)

    parsed_response = JSON.parse(response.body, symbolize_names: true)

    expected_response = {
      "success": 'Favorite added successfully'
    }
    expect(parsed_response).to eq(expected_response)
  end

  it 'sends an error message if the api key is invalid' do
    user = User.create!(name: 'Ahsoka Tano', email: 'atano@jedi.com', api_key: SecureRandom.base64)
    json_payload = {
      "api_key": 'wrong_api_key',
      "country": 'Peru',
      "recipe_link": 'https://www.epicurious.com/recipes/food/views/peruvian-ceviche-395483',
      "recipe_title": 'Peruvian Ceviche'
    }

    post '/api/v1/favorites', params: json_payload.to_json,
                              headers: { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

    expect(response).to have_http_status(400)

    parsed_response = JSON.parse(response.body, symbolize_names: true)

    expect(parsed_response).to have_key(:errors)
    expect(parsed_response[:errors].first).to have_key(:status)
    expect(parsed_response[:errors].first).to have_key(:message)
  end
end
