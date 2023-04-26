module Presenters
    class RecipeList
        attr_reader :recipes, :total_count

        def initialize(json_list, count)
            @recipes = []
            @total_count = count

            json_list.each do |json_object|
                if json_object["recipes"]
                    json_object["recipes"].each do |recipe|
                        @recipes << ::Presenters::Recipe.new(recipe)
                    end
                else
                    @recipes << ::Presenters::Recipe.new(json_object)
                end
            end
        end
    end
end