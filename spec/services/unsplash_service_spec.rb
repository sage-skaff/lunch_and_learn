# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UnsplashService do
  it 'finds images by search query', :vcr do
    response = UnsplashService.search_for_image('Thailand')

    expect(response).to be_a(Array)
    expect(response.first).to have_key(:alt_description)
    expect(response.first).to have_key(:urls)
    expect(response.first[:urls]).to have_key(:raw)
  end
end
