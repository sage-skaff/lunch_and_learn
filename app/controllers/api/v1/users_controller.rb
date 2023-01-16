# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      def create
        user = User.create(user_params)
        return unless user.save

        render json: UserSerializer.new(user), status: 201
      end

      private

      def user_params
        params.require(:user).permit(:name, :email, :api_key)
      end
    end
  end
end
