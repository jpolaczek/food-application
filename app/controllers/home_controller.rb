class HomeController < ApplicationController
    def index
    end

    def search
        @json_response = tasty_client.get_many(query: params[:search], from: params[:from])
        if @json_response["errors"]
            @errors = @json_response["errors"]
        else
            Presenters::RecipeList.new(@json_response["results"], @json_response["count"])
        end
    end

    private

    def tasty_client
        @tasty_client ||= TastyApi::Client.new(TastyApi::Client::PATHS[:recipies_list])
    end

    def 
end
