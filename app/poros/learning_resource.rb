# frozen_string_literal: true

class LearningResource
  attr_reader :country, :images, :video

  def initialize(country, images, video)
    @country = country
    @images = images
    @video = video
  end
end
