# frozen_string_literal: true

module Api
  module V1
    class RecipesController < ApplicationController
      def index
        if params[:country]
          recipes = RecipeFacade.recipes_by_country(params[:country])
        else
          country = CountryFacade.random_country
          recipes = RecipeFacade.recipes_by_country(country.name)
        end
        render json: RecipeSerializer.new(recipes)
      end
    end
  end
end
