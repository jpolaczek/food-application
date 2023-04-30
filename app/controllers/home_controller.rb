class HomeController < ApplicationController
    def index
        @recipes = current_user.recipes.page params[:page]
    end

    def search
        @pagination_calculator ||= PaginationCalculator.new(current_page)

        @json_response = Rails.cache.fetch(params[:search] + current_page.to_s, expires_in: 30.minutes) do
            tasty_client.get_many(query: params[:search], from: @pagination_calculator.calculate_from)
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

    def current_page
        @current_page ||= (params[:page] || 1).to_i
    end
end
