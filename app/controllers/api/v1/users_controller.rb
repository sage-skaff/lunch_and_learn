# frozen_string_literal: true

class Api::V1::UsersController < ApplicationController
    def create
        user = User.create(user_params)
        if user.save
            render json: UserSerializer.new(user), status: 201
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :api_key)
    end
end