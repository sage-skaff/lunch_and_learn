# frozen_string_literal: true

module Api
  module V1
    class LearningResourcesController < ApplicationController
      def index
        resource = LearningResourceFacade.learning_resource(params[:country])
        render json: LearningResourceSerializer.new(resource)
      end
    end
  end
end
