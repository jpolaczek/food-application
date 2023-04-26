require 'rails_helper'

RSpec.describe Presenters::RecipeList do
    subject { described_class.new(response, count)}

    let(:response) { [recipe_object_1, recipe_object_2] }
    let(:recipe_object_1) { { "recipes" => nil } }
    let(:recipe_object_2) { { "recipes" => [recipe_object_3]}}
    let(:recipe_object_3) { double "recipe" }
    let(:expected_count) { 9681 }
    let(:count) { 2 }   
    let(:presenter_double_1) { double 'presenter' }
    let(:presenter_double_2) { double 'presenter' }

    before do
        expect(Presenters::Recipe).to receive(:new).with(recipe_object_1).once.and_return(presenter_double_1)
        expect(Presenters::Recipe).to receive(:new).with(recipe_object_3).once.and_return(presenter_double_2)
    end

    it 'creates recipe presenter objects', :aggreate_errors do
        expect(subject.total_count).to eq 2
        expect(subject.recipes).to eq [presenter_double_1, presenter_double_2]
    end
end