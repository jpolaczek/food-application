require 'rails_helper'

RSpec.describe Presenters::IngredientSection do
    subject { described_class.new(json_object)}

    let(:json_object) do
        {
            "name" => name,
            "components" => ingredients
        }
    end
    let(:name) { "name" }
    let(:ingredients) { [double('ingredient'), double('ingredient')] }

    before do
        ingredients.each { |ingredient| expect(Presenters::Ingredient).to receive(:new).with(ingredient).once.and_return(ingredient) }
    end

    it 'creates ingredient sections presenter object', :aggreate_errors do
        expect(subject.name).to eq name
        expect(subject.ingredients).to eq ingredients
    end
end