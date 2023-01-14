class RestCountriesService
    def self.conn
        Faraday.new("https://restcountries.com")
    end

    def self.get_all_countries
        response = conn.get("/v3.1/all")

        JSON.parse(response.body.gsub('null', '"null"'), symbolize_names: true)
    end
end