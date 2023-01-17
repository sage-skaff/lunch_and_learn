# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      include JSONAPI::Errors
      def create
        user = User.create(user_params)
        if user.save
          user.update(api_key: SecureRandom.base64)
          render json: UserSerializer.new(user), status: 201
        else
          render json: user.errors, status: :bad_request
        end
      end

      private

      def user_params
        params.require(:user).permit(:name, :email, :api_key)
      end
    end
  end
end
