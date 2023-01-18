# frozen_string_literal: true

class RecipeFacade
  def self.recipes_by_country(country_name)
    EdamamService.search_recipes(country_name)[:hits].first(20).map do |recipe|
      Recipe.new(recipe, country_name)
    end
  end
end
