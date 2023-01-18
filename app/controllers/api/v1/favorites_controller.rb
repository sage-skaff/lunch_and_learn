# frozen_string_literal: true

module Api
  module V1
    class FavoritesController < ApplicationController
      def index
        if User.find_by(api_key: params[:api_key]) != nil
          user = User.find_by(api_key: params[:api_key])
          render json: FavoriteSerializer.new(user.favorites), status: 200
        else
          render json: { "error": 'Unable to find favorites' }, status: :bad_request
        end
      end

      def create
        if User.find_by(api_key: params[:api_key]) != nil
          user = User.find_by(api_key: params[:api_key])
          favorite = Favorite.create(favorite_params)
          favorite.user_id = user.id
          favorite.save
          render json: { "success": 'Favorite added successfully' }, status: 201
        else
          render json: { "error": 'Unable to add favorite' }, status: :bad_request
        end
      end

      private

      def favorite_params
        params.require(:favorite).permit(:country, :recipe_link, :recipe_title, :user_id)
      end
    end
  end
end
