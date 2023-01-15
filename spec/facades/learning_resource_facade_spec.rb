# frozen_string_literal: true

RSpec.describe LearningResourceFacade do
  it 'returns an array of image objects', :vcr do
    images = LearningResourceFacade.images('Thailand')

    expect(images.first).to be_an_instance_of(Image)
  end
end
