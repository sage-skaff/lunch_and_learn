# frozen_string_literal: true

class GoogleApiService
  def self.conn
    Faraday.new(url: 'https://youtube.googleapis.com') do |faraday|
      faraday.params['key'] = ENV['youtube_api_key']
    end
  end

  def self.get_educational_video(country)
    response = conn.get("/youtube/v3/search?part=snippet&channelId=UCsT0YIqwnpJCM-mx7-gSA4Q&q=#{country} history&type=video")

    JSON.parse(response.body, symbolize_names: true)
  end
end
