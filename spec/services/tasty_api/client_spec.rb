require 'rails_helper'

RSpec.describe TastyApi::Client do
    subject { client.get_many(query: query, from: from) }

    let(:client) { described_class.new(TastyApi::Client::PATHS[:recipies_list]) }
    let(:query) { '' }
    let(:from) { 0 }
    let(:response) { File.read fixture_path + "/tasty_response.txt" }
    let(:http_double) { double 'http_client' }
    let(:expected_count) { 9681 }


    context 'when response is correct' do
        before do
            allow(HTTP).to receive(:headers).with({
                "X-RapidAPI-Key" => ENV['TASTY_API_KEY'],
                "X-RapidAPI-Host" => 'tasty.p.rapidapi.com'
            }).and_return http_double
            allow(http_double).to receive(:get).with('https://tasty.p.rapidapi.com/recipes/list', params: { q: query, from: from, size: 40 }).and_return response
        end

        shared_examples 'returning response from TastyAPI' do
            it 'returns hash result with count and recipies', :aggreate_errors do
                expect(subject).to eq JSON response
                expect(subject["count"]).to eq expected_count
                expect(subject["results"].count).to eq 40
            end
        end

        it_behaves_like 'returning response from TastyAPI'

        context 'when query given' do
            let(:query) { 'chicken' }
            let(:response) { File.read fixture_path + "/tasty_response_with_query.txt" }
            let(:expected_count) { 1240 }

            it_behaves_like 'returning response from TastyAPI'
        end
    end

    context 'error returned by httprb' do
        before do
            allow(HTTP).to receive(:headers).with({
                "X-RapidAPI-Key" => ENV['TASTY_API_KEY'],
                "X-RapidAPI-Host" => 'tasty.p.rapidapi.com'
            }).and_return http_double
            allow(http_double).to receive(:get).with('https://tasty.p.rapidapi.com/recipes/list', params: { q: query, from: from, size: 40 }).and_raise HTTP::Error, "example_error"
        end

        it 'catches error and returns message wrapped in a hash' do
            expect(subject).to eq({ 'errors' => "example_error"})
        end
    end
end