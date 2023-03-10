# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EdamamService do
  it 'searches recipes by query', :vcr do
    query = 'Thai'
    response = EdamamService.search_recipes(query)

    expect(response).to be_a(Hash)
  end
end
