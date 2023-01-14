# frozen_string_literal: true

class Recipe
  attr_reader :title, :image, :url, :country

  def initialize(recipe, country_name)
    @title = recipe[:recipe][:label]
    @image = recipe[:recipe][:image]
    @url = recipe[:recipe][:url]
    @country = country_name
  end
end
