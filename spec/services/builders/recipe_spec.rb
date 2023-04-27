require 'rails_helper'

RSpec.describe Builders::Recipe do
    describe '#.call' do
        subject { described_class.call(json_object)}

        let(:json_object) do
            {
                "id" => tasty_id,
                "name" => name,
                "description" => description,
                "instructions" => instructions,
                "sections" => sections
            }
        end
        let(:tasty_id) { 1 }
        let(:name) { "name" }
        let(:description) { "description" }
        let(:sections) { [double('section'), double('section')] }
        let(:built_sections) { [build(:section), build(:section)] }
        let(:instructions) { [instruction_1, instruction_2] }
        let(:instruction_1) { { position: 1, display_text: "cook it" } }
        let(:instruction_2) { { position: 2, display_text: "cook it again" } }

        before do
            sections.each_with_index do |section, index|
                expect(Builders::Section).to receive(:call).with(section).once.and_return(built_sections[index])
            end
        end

        it 'builds recipe object with associated objects', :aggreate_errors do
            expect(subject.tasty_id).to eq tasty_id
            expect(subject.name).to eq name
            expect(subject.description).to eq description

            expect(subject.instructions.size).to eq 2
            subject.instructions.each_with_index do |instruction, index|
                expect(subject.instructions[index].display_text).to eq instructions[index]["display_text"]
                expect(subject.instructions[index].position).to eq instructions[index]["position"]
            end
            expect(subject.sections).to eq built_sections
        end
    end
end