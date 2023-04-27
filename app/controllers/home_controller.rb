class HomeController < ApplicationController
    def index
    end

    def search
        @json_response = tasty_client.get_many(query: params[:search], from: params[:from])

        if @json_response["errors"]
            @errors = @json_response["errors"]
        else
            @recipes = Builders::RecipeList.call(@json_response["results"])
        end
    end

    def show_recipe
        @recipe = Builders::Recipe.new(JSON params['recipe'])
    end

    private

    def tasty_client
        @tasty_client ||= TastyApi::Client.new(TastyApi::Client::PATHS[:recipies_list])
    end
end
