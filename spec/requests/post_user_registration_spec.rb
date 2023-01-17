# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Post User Registration' do
  it 'creates a new user from json body' do
    json_payload = {
      "name": 'Ahsoka Tano',
      "email": 'atano@jedi.com'
    }

    post '/api/v1/users', params: json_payload.to_json,
                          headers: { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

    expect(response).to have_http_status(201)

    parsed_response = JSON.parse(response.body, symbolize_names: true)

    expect(parsed_response).to have_key(:data)
    expect(parsed_response[:data]).to have_key(:type)
    expect(parsed_response[:data]).to have_key(:id)
    expect(parsed_response[:data]).to have_key(:attributes)
    expect(parsed_response[:data][:attributes]).to have_key(:name)
    expect(parsed_response[:data][:attributes]).to have_key(:email)
    expect(parsed_response[:data][:attributes]).to have_key(:api_key)
    expect(parsed_response[:data][:attributes][:api_key]).not_to be_empty
  end

  it 'returns an error message if email address is already used' do
    user = User.create!(name: 'Ahsoka Tano', email: 'atano@jedi.com', api_key: SecureRandom.base64)

    json_payload = {
      "name": 'Ahsoka Tano',
      "email": 'atano@jedi.com'
    }

    post '/api/v1/users', params: json_payload.to_json,
                          headers: { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

    expect(response).to have_http_status(400)

    parsed_response = JSON.parse(response.body, symbolize_names: true)

    expect(parsed_response).to have_key(:errors)
    expect(parsed_response[:errors].first).to have_key(:status)
    expect(parsed_response[:errors].first).to have_key(:message)
  end
end
