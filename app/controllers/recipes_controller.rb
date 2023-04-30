class RecipesController < ApplicationController
    before_action :load_recipe, only: [:show, :edit, :update]

    def new
        @recipe = Builders::Recipe.call(JSON params['recipe'])
    end

    def create
        if recipe = current_user.recipes.create(recipe_params)
            redirect_to recipe_path(recipe), notice: 'Recipe created'
        else
            render :new
        end
    end

    def show
    end

    def edit
    end

    def update
        if @recipe.update(recipe_params)
            redirect_to recipe_path(@recipe), notice: 'Recipe updated'
        else
            render :edit
        end
    end

    private

    def load_recipe
        @recipe ||= current_user.recipes.find(params[:id])
    end

    def recipe_params
        params.require("recipe").permit(:name, :description, sections_attributes: [:name, :id, components_attributes: [:raw_text, :id]], instructions_attributes: [:position, :id, :display_text])
    end
end
