require 'rails_helper'

RSpec.describe Presenters::Recipe do
    subject { described_class.new(json_object)}

    let(:json_object) do
        {
            "id" => id,
            "name" => name,
            "description" => description,
            "instructions" => steps,
            "sections" => sections
        }
    end
    let(:id) { 1 }
    let(:name) { "name" }
    let(:description) { "description" }
    let(:sections) { [double('section'), double('section')] }
    let(:steps) { [double('steps'), double('steps')] }

    before do
        sections.each { |section| expect(Presenters::Section).to receive(:new).with(section).once.and_return(section) }
        steps.each { |step| expect(Presenters::Instruction).to receive(:new).with(step).once.and_return(step) }
    end

    it 'creates recipe presenter object', :aggreate_errors do
        expect(subject.id).to eq id
        expect(subject.name).to eq name
        expect(subject.description).to eq description
        expect(subject.instructions).to eq steps
        expect(subject.sections).to eq sections
    end
end