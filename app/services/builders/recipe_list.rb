module Builders
    class RecipeList
        class << self
            def call(json_list)
                recipes = []

                json_list.each do |json_object|
                    if json_object["recipes"]
                        json_object["recipes"].each do |recipe|
                            recipes << Builders::Recipe.call(recipe)
                        end
                    else
                        recipes << ::Builders::Recipe.call(json_object)
                    end
                end
                recipes
            end
        end
    end
end