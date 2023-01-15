# frozen_string_literal: true

RSpec.describe Video do
  it 'exists' do
    data = {
      items: [
        {
          id: {
            videoId: '12345'
          },
          snippet: {
            title: 'Video Title'
          }
        }
      ]
    }

    video = Video.new(data)

    expect(video).to be_an_instance_of(Video)
    expect(video.youtube_video_id).to eq('12345')
    expect(video.title).to eq('Video Title')
  end
end
