require 'rails_helper'

RSpec.describe Presenters::Ingredient do
    subject { described_class.new(json_object)}

    let(:json_object) { { "raw_text" => raw_text}}
    let(:raw_text) { "raw_text" }

    it 'creates ingredient presenter object' do
        expect(subject.raw_text).to eq raw_text
    end
end