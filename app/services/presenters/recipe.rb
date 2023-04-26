module Presenters
    class Recipe
        attr_reader :name, :id, :description, :ingredient_sections, :instruction_steps

        def initialize(json_object)
            @name = json_object["name"]
            @id = json_object["id"]
            @description = json_object["description"]
            @instruction_steps = []
            @ingredient_sections = []

            json_object["instruction_steps"].each do |step|
                @instruction_steps << Presenters::InstructionStep.new(step)
            end

            json_object["sections"].each do |ingredient_section|
                @ingredient_sections << Presenters::IngredientSection.new(ingredient_section)
            end
        end
    end
end