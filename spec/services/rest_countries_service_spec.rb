require 'rails_helper'

RSpec.describe RestCountriesService do
    it 'gets a list of all countries' do
        response = RestCountriesService.get_all_countries

        expect(response).to be_a(Hash)
    end
end