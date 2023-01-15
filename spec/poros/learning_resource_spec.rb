# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LearningResource do
  it 'exists' do
    country = 'Portugal'

    image_data = [
      {
        alt_description: 'image1_alt_description',
        urls: { raw: 'image1_url' }
      },
      {
        alt_description: 'image2_alt_description',
        urls: { raw: 'image2_url' }
      }
    ]

    video_data = {
      items: [
        {
          id: { videoId: 'video1_id' },
          snippet: { title: 'video1_title' }
        }
      ]
    }

    learning_resource = LearningResource.new(country, image_data, video_data)
    expect(learning_resource).to be_an_instance_of(learning_resource)
  end
end
