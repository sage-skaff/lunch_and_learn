# frozen_string_literal: true

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
    country_name = 'Thailand'

    country = Country.new(country_info, country_name)

    expect(country).to be_an_instance_of(Country)
  end
end