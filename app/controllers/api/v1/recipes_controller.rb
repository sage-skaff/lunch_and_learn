# frozen_string_literal: true

module Api
  module V1
    class RecipesController < ApplicationController
      def index
        if params[:country]
          recipes = RecipeFacade.recipes_by_country(params[:country])
          render json: RecipeSerializer.new(recipes)
        elsif params[:country].blank?
          country = CountryFacade.random_country
          recipes = RecipeFacade.recipes_by_country(country.name)
          render json: RecipeSerializer.new(recipes)
        else
          render json: {"data": []}
        end
      end
    end
  end
end
