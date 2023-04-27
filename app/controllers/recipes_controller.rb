class RecipesController < ApplicationController
    def new
        @recipe = Presenters::Recipe.new(JSON params['recipe'])
    end

    def create
        puts params["recipe"]
    end
end
