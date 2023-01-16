# frozen_string_literal: true

RSpec.describe 'Post User Registration' do
  it 'creates a new user from json body' do
    json_payload = {
      "name": 'Ahsoka Tano',
      "email": 'atano@jedi.com'
    }

    post '/api/v1/users', user: json_payload,
                          headers: { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

    expect(response).to have_http_status(201)
    expect(response).to have_key(:data)
    expect(response[:data]).to have_key(:type)
    expect(response[:data]).to have_key(:id)
    expect(response[:data]).to have_key(:attributes)
    expect(response[:data][:attributes]).to have_key(:name)
    expect(response[:data][:attributes]).to have_key(:email)
    expect(response[:data][:attributes]).to have_key(:api_key)
  end

  it 'returns an error message if email address is already used' do
    user = User.new(name: 'Ahsoka Tano', email: 'atano@jedi.com', api_key: '000000000')

    json_payload = {
      "name": 'Ahsoka Tano',
      "email": 'atano@jedi.com'
    }

    post '/api/v1/users', user: json_payload,
                          headers: { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

    expect(response).to have_http_status(400)
    expect(response).to have_key(:errors)
    expect(response[:errors].first).to have_key(:status)
    expect(response[:errors].first).to have_key(:message)
  end
end
