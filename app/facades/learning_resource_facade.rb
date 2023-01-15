# frozen_string_literal: true

class LearningResourceFacade
  def self.images(query)
    UnsplashService.search_for_image(query).map do |image_data|
      Image.new(image_data)
    end
  end
end
