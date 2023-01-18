# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Get User Favorites' do
  it 'can get a users favorites' do
    user = User.create(name: 'Ahsoka Tano', email: 'atano@jedi.com', api_key: SecureRandom.base64)
    favorite = user.favorites.create!(country: 'Peru',
                                     recipe_link: 'https://www.epicurious.com/recipes/food/views/peruvian-ceviche-395483', recipe_title: 'Peruvian Ceviche')

    get "/api/v1/favorites?api_key=#{user.api_key}"

    expect(response).to have_http_status(200)

    parsed_response = JSON.parse(response.body, symbolize_names: true)

    expect(parsed_response).to have_key(:data)
    expect(parsed_response[:data].first).to have_key(:id)
    expect(parsed_response[:data].first).to have_key(:type)
    expect(parsed_response[:data].first).to have_key(:attributes)
    expect(parsed_response[:data].first[:attributes]).to have_key(:country)
    expect(parsed_response[:data].first[:attributes]).to have_key(:recipe_link)
    expect(parsed_response[:data].first[:attributes]).to have_key(:recipe_title)
    expect(parsed_response[:data].first[:attributes]).to have_key(:created_at)
  end

  it 'returns error message when api_key is invalid' do
    user = User.create(name: 'Ahsoka Tano', email: 'atano@jedi.com', api_key: SecureRandom.base64)
    favorite = user.favorites.create!(country: 'Peru',
                                     recipe_link: 'https://www.epicurious.com/recipes/food/views/peruvian-ceviche-395483', recipe_title: 'Peruvian Ceviche')

    get "/api/v1/favorites?api_key=wrong_api_key"

    expect(response).to have_http_status(400)

    # parsed_response = JSON.parse(response.body, symbolize_names: true)


  end
end
