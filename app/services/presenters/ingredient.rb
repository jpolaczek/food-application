module Presenters
    class Ingredient
        attr_reader :raw_text

        def initialize(json_object)
            @raw_text = json_object["raw_text"]
        end
    end
end