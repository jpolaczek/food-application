module Presenters
    class Recipe
        attr_reader :name, :id, :description, :sections, :instructions

        def initialize(json_object)
            @name = json_object["name"]
            @id = json_object["id"]
            @description = json_object["description"]
            @instructions = []
            @sections = []

            json_object["instructions"].each do |step|
                @instructions << Presenters::Instruction.new(step)
            end

            json_object["sections"].each do |ingredient_section|
                @sections << Presenters::Section.new(ingredient_section)
            end
        end
    end
end