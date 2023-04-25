require 'uri'
require 'net/http'

module TastyApi
    class Client
        SIZE = 39
        HOST = 'tasty.p.rapidapi.com'.freeze
        PATH = '/recipes/list'.freeze
        
        private_constant :SIZE, :HOST

        class << self
            def get_recipies(query: nil, from: 0)
                uri = URI('https://' + HOST + PATH)
                uri.query = URI.encode_www_form({from: from, q: query})

                http = Net::HTTP.new(uri.host, uri.port)
                http.use_ssl = true

                request = Net::HTTP::Get.new(uri)
                request["X-RapidAPI-Key"] = '0ca35fcb06mshc6e508c246f8688p180a96jsn803cde04515a'
                request["X-RapidAPI-Host"] = HOST

                response = http.request(request)
            end

            def set_uri

            end

        end
    end
end