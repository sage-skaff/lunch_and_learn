# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RecipeFacade do
  it 'gets recipes by country' do
    country = 'Thailand'
    recipes = RecipeFacade.recipes_by_country(country)

    expect(recipes).to be_a(Array)
  end
end
