module Presenters
    class Section
        attr_reader :name, :components

        def initialize(json_object)
            @name = json_object["name"]
            @components = []
            json_object["components"].each do |ingredient|
                @components << ::Presenters::Ingredient.new(ingredient)
            end
        end
    end
end