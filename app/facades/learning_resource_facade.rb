# frozen_string_literal: true

class LearningResourceFacade
  def self.images(query)
    UnsplashService.search_for_image(query).map do |image_data|
      Image.new(image_data)
    end
  end

  def self.video(query)
    video_data = GoogleApiService.get_educational_video(query)
    Video.new(video_data)
  end

  def self.learning_resource(country)
    LearningResource.new(country, images(country), video(country))
  end
end
