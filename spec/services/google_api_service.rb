# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GoogleApiService do
    it 'finds an educational video by country' do
        response = GoogleApiService.get_educational_video('Thailand')

        expect(response).to be_a(Hash)
        expect(response).to have_key(:items)
        expect(response[:items]).to be_a(Array)
        expect(response[:items].first).to have_key(:id)
        expect(response[:items].first[:id]).to have_key(:videoId)
        expect(response[:items].first).to have_key(:snippet)
        expect(response[:items].first[:snippet]).to have_key(:title)
    end
end