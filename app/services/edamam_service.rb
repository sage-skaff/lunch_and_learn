class EdamamService
    def self.conn
        Faraday.new(url: "https://api.edamam.com/api") do |f|
            f.params['app_id'] = ENV['edamam_app_id']
            f.params['app_key'] = ENV['edamam_app_key']
        end
    end

    def self.get_recipes_by_country(country)
        response = conn.get("https://api.edamam.com/api/recipes/v2?type=public&q=#{country}")

        JSON.parse(response.body.gsub('null', '"null"'), symbolize_names: true)
    end
end