module Presenters
    class IngredientSection
        attr_reader :name, :ingredients

        def initialize(json_object)
            @name = json_object["name"]
            @ingredients = []
            json_object["components"].each do |ingredient|
                @ingredients << ::Presenters::Ingredient.new(ingredient)
            end
        end
    end
end