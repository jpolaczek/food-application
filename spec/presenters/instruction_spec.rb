require 'rails_helper'

RSpec.describe Presenters::Instruction do
    subject { described_class.new(json_object)}

    let(:json_object) do
        {
            "display_text" => display_text,
            "position" => position
        }
    end
    let(:display_text) { "display_text" }
    let(:position) { 1 }

    it 'creates instruction step presenter object', :aggreate_errors do
        expect(subject.display_text).to eq display_text
        expect(subject.position).to eq position
    end
end