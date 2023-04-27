require 'rails_helper'

RSpec.describe Builders::Section do
    describe '.call' do
        subject { described_class.call(json_object)}

        let(:json_object) do
            {
                "name" => name,
                "components" => components
            }
        end
        let(:name) { "name" }
        let(:components) { [component_1, component_2] }
        let(:component_1) { { raw_text: "tomato" } }
        let(:component_2) { { raw_text: "potato" } }

        it 'builds section and components', :aggreate_errors do
            expect(subject.name).to eq name
            expect(subject.components.size).to eq components.size
            components.each_with_index do |component, index|
                expect(subject.components[index].raw_text).to eq components[index]["raw_text"]
            end
        end
    end
end