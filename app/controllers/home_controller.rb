class HomeController < ApplicationController
    def index
        @recipes = current_user.recipes
    end

    def search
        @json_response = Rails.cache.fetch(params[:search], expires_in: 30.minutes) do
            tasty_client.get_many(query: params[:search], from: params[:from])
        end

        if @json_response["results"]
            @recipes = Builders::RecipeList.call(@json_response["results"])
        else
            flash[:error] = "Errors encountered: " + [@json_response["errors"].to_s + @json_response["message"].to_s].join(", ")
        end
    end

    private

    def tasty_client
        @tasty_client ||= TastyApi::Client.new(TastyApi::Client::PATHS[:recipies_list])
    end
end
