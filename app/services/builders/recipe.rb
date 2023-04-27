module Builders
    class Recipe
        class << self
            def call(recipe)
                ::Recipe.new(
                    name: recipe["name"],
                    description: recipe["description"],
                    tasty_id: recipe["id"],
                    sections: recipe["sections"].map do |section| 
                        Builders::Section.call(section)
                    end,
                    instructions: recipe["instructions"].map do |instruction|
                        Instruction.new(
                            position: instruction["position"],
                            display_text: instruction["display_text"]
                        )
                    end
                )
            end
        end
    end
end