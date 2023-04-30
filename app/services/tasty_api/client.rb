require 'uri'
require 'net/http'
require 'http'

module TastyApi
    class Client
        SIZE = 40
        HOST = 'tasty.p.rapidapi.com'.freeze
        RECIPIES_PATH = '/recipes/list'.freeze

        PATHS = {
            recipies_list: '/recipes/list'
        }
        
        private_constant :HOST, :RECIPIES_PATH

        def initialize(path)
            @path = path
        end

        def get_many(query: '', from: 0)
            begin
                JSON(HTTP.headers({
                    "X-RapidAPI-Key" => ENV['TASTY_API_KEY'],
                    "X-RapidAPI-Host" => HOST
                }).get('https://' + HOST + path, :params => {from: from, q: query, size: SIZE}).to_s)
            rescue HTTP::Error, HTTP::ConnectionError, HTTP::RequestError, HTTP::ResponseError, 
                HTTP::StateError, HTTP::TimeoutError, HTTP::ConnectTimeoutError, HTTP::HeaderError => e
                { 'errors' => e.message }
            end
        end

        private

        attr_reader :path
    end
end