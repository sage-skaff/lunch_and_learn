# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Recipe do
  it 'exists' do
    recipe_info = {
      recipe: {
        label: "Andy Ricker's Naam Cheuam Naam Taan Piip (Palm Sugar Simple Syrup)",
        url: 'https://www.seriouseats.com/recipes/2013/11/andy-rickers-naam-cheuam-naam-taan-piip-palm-sugar-simple-syrup.html',
        image: 'image_url'
      }
    }

    country_name = 'Thailand'

    recipe = Recipe.new(recipe_info, country_name)
    expect(recipe).to be_a(Recipe)
  end
end
