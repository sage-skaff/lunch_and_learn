# frozen_string_literal: true

class LearningResourceSerializer
  include JSONAPI::Serializer

  set_id { nil }
  attributes :country, :video, :images
end