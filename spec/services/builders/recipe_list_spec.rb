require 'rails_helper'

RSpec.describe Builders::RecipeList do
    describe '.call' do
        subject { described_class.call(response)}

        let(:response) { [recipe_object_1, recipe_object_2] }
        let(:recipe_object_1) { { "recipes" => nil } }
        let(:recipe_object_2) { { "recipes" => [recipe_object_3]}}
        let(:recipe_object_3) { double "recipe" }
        let(:expected_count) { 9681 }
        let(:count) { 2 }   
        let(:recipe_1) { build :recipe }
        let(:recipe_2) { build :recipe }

        before do
            expect(Builders::Recipe).to receive(:call).with(recipe_object_1).once.and_return(recipe_1)
            expect(Builders::Recipe).to receive(:call).with(recipe_object_3).once.and_return(recipe_2)
        end

        it 'creates recipe objects' do
            expect(subject).to eq [recipe_1, recipe_2]
        end
    end
end