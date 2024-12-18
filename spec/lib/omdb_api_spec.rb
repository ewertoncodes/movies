require 'rails_helper'

RSpec.describe OmdbApi do
  let(:api) { described_class.new }

  describe '#search' do
    context 'with a valid query', :vcr do
      it 'returns a list of movies' do
        search_results = api.search('Inception')
        expect(search_results).to be_an(Array)
        expect(search_results.first).to include('Title' => 'Inception')
      end
    end

    context 'with an invalid query', :vcr do
      it 'returns an error' do
        search_results = api.search('InvalidQuery12345')
        expect(search_results).to include(:error)
      end
    end
  end

  describe '#fetch_details' do
    context 'with a valid IMDb ID', :vcr do
      it 'returns movie details' do
        movie_details = api.fetch_details('tt1375666') # IMDb ID for "Inception"
        expect(movie_details).to include('Title' => 'Inception', 'Year' => '2010')
      end
    end

    context 'with an invalid IMDb ID', :vcr do
      it 'returns an error' do
        movie_details = api.fetch_details('invalid_id')
        expect(movie_details).to include(:error)
      end
    end
  end
end
