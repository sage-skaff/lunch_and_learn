# frozen_string_literal: true

class UnsplashService
    def self.conn
        Faraday.new(url: 'https://api.unsplash.com') do |faraday|
            faraday.params['client_id'] = ENV['unsplash_id']
        end
    end

    def self.search_for_image(query)
        response = conn.get("/search/photos?query=#{query}")

        JSON.parse(response.body, symbolize_names: true)
    end
end