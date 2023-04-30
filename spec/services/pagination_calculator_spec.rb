require 'rails_helper'

RSpec.describe PaginationCalculator do
    let(:calculator) { described_class.new(current_page) }
    let(:current_page) { 3 }

    describe '#calculate_from' do  
        subject { calculator.calculate_from }

        it 'calculates from value based on current page and fetch size' do
            expect(subject).to eq 80
        end
    end

    describe '#next?' do
        subject { calculator.next?(total_count) }
        let(:total_count)  { 100 }

        it 'returns boolean value stating whether next page of results is available' do
            expect(subject).to eq false
        end

        context 'when more results available based on total count' do
            let(:current_page) { 2 }

            it 'returns boolean value stating whether next page of results is available' do
                expect(subject).to eq true
            end
        end
    end

    describe '#previous?' do
        subject { calculator.previous? }

        it 'returns boolean value stating whether previous page should be available' do
            expect(subject).to eq true
        end

        context 'when current_page is 1' do
            let(:current_page) { 1 }

            it 'returns boolean value stating whether previous page should be available' do
                expect(subject).to eq false
            end
        end
    end
end