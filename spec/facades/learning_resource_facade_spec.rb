# frozen_string_literal: true

RSpec.describe LearningResourceFacade do
  it 'returns an array of image objects', :vcr do
    images = LearningResourceFacade.images('Thailand')

    expect(images.first).to be_an_instance_of(Image)
  end

  it 'returns a video object', :vcr do
    video = LearningResourceFacade.video('Thailand')

    expect(video).to be_an_instance_of(Video)
  end

  it 'returns a learning resource object', :vcr do
    learning_resource = LearningResourceFacade.learning_resource('Thailand')

    expect(learning_resource).to be_an_instance_of(LearningResource)
  end
end
