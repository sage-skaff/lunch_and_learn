# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UnsplashService do
  it 'finds images by search query' do
    response = UnsplashService.search_for_image('Thailand')

    expect(response).to be_a(Hash)
    expect(response).to have_key(:results)
    expect(response[:results]).to be_a(Array)
    expect(response[:results].first).to have_key(:alt_description)
    expect(response[:results].first).to have_key(:urls)
    expect(response[:results].first[:urls]).to have_key(:raw)
  end
end
