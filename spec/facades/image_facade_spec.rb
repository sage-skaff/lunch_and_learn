# frozen_string_literal: true

RSpec.describe ImageFacade do
  it 'returns an array of image objects', :vcr do
    images = ImageFacade.images('Thailand')

    expect(images.first).to be_an_instance_of(Image)
  end
end
