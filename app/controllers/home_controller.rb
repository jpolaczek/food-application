class HomeController < ApplicationController
    def index
    end

    def search
        @results = tasty_client.get_many(query: params[:search], from: params[:from])
    end

    private

    def tasty_client
        @tasty_client ||= TastyApi::Client.new(TastyApi::Client::PATHS[:recipies_list])
    end
end
