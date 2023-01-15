# frozen_string_literal: true

class LearningResourceFacade
  def self.images(query)
    UnsplashService.search_for_image(query).map do |image_data|
      Image.new(image_data)
    end
  end

  def self.video(query)
    video_data = GoogleApiService.get_video(query)
    Video.new(video_data)
  end

  def self.learning_resource(country)
    countries_images = images(country)
    video = GoogleApiService.get_video(country)
    LearningResource.new(country, countries_images, video)
  end
end
