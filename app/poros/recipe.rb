# frozen_string_literal: true

class Recipe
  attr_reader :name, :image, :url, :country_name

  def initialize(recipe, country_name)
    @name = recipe[:recipe][:label]
    @image = recipe[:recipe][:image]
    @url = recipe[:recipe][:url]
    @country_name = country_name
  end
end
