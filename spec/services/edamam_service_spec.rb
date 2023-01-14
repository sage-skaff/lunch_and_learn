require 'rails_helper'

RSpec.describe EdamamService do
    it 'gets recipes for a particular country' do
        country = "Thailand"
        response = EdamamService.get_recipes_by_country(country)

        expect(response).to be_a(Hash)
    end
end