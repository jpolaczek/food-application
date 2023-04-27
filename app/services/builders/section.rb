module Builders
    class Section
        class << self
            def call(section)
                ::Section.new(
                    name: section["name"],
                    components: section["components"].map do |component|
                        Component.new(raw_text: component["raw_text"])
                    end
                )
            end
        end
    end
end