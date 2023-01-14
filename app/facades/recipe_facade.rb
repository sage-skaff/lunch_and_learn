# frozen_string_literal: true

class RecipeFacade
  def self.recipes_by_country(country_name)
    demonym = CountryFacade.country(country_name).demonym
    EdamamService.search_recipes(demonym)[:hits].first(20).map do |recipe|
      Recipe.new(recipe, country_name)
    end
  end
end
