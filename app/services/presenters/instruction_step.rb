module Presenters
    class InstructionStep
        attr_reader :display_text, :position

        def initialize(json_object)
            @display_text = json_object["display_text"]
            @position = json_object["position"]
        end
    end
end