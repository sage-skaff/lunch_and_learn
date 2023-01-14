require 'rails_helper'

RSpec.describe RecipeFacade do
    it 'gets recipes by country' do
        country = "Thailand"
        recipes = EdamamFacade.recipes_by_country(country)

        expect(recipes).to be_a(Hash)
    end
end