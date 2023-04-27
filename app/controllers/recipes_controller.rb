class RecipesController < ApplicationController
    def new
        @recipe = Builders::Recipe.call(JSON params['recipe'])
        puts @recipe.sections.first.components.size
    end

    def create
        recipe = ::Recipe.create!(recipe_params)
        puts recipe.to_json(include: { instructions: [], sections: { include: :components } })
    end

    private

    def recipe_params
        params.require("recipe").permit(:name, :description, sections_attributes: [:name, components_attributes: [:raw_text]], instructions_attributes: [:display_text])
    end
end
