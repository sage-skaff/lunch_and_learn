# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Country do
  it 'exists' do
    country_info = {
      name: {
        common: 'Thailand'
      },
      demonyms: {
        eng: {
          f: 'Thai'
        }
      },
      subregion: 'South-Eastern Asia'
    }

    country = Country.new(country_info)

    expect(country).to be_an_instance_of(Country)
  end
end
