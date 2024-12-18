require 'rails_helper'

RSpec.describe OmdbService do
  let(:query) { 'Inception' }
  let(:imdb_id) { 'tt1375666' } # IMDb ID do filme "Inception"
  let(:service) { described_class.new(query) }

  describe '#search_movies' do
    context 'with a valid query', :vcr do
      it 'returns a list of movies' do
        search_results = service.search_movies
        expect(search_results).to be_an(Array)
        expect(search_results.first).to include('Title' => 'Inception')
      end
    end

    context 'with an invalid query', :vcr do
      let(:query) { 'InvalidQuery12345' }

      it 'returns an error' do
        search_results = service.search_movies
        expect(search_results).to include(:error)
      end
    end
  end

  describe '#fetch_movie_details' do
    context 'with a valid IMDb ID', :vcr do
      it 'returns movie details' do
        movie_details = service.fetch_movie_details(imdb_id)
        expect(movie_details).to include('Title' => 'Inception', 'Year' => '2010')
      end
    end

    context 'with an invalid IMDb ID', :vcr do
      let(:imdb_id) { 'invalid_id' }

      it 'returns an error' do
        movie_details = service.fetch_movie_details(imdb_id)
        expect(movie_details).to include(:error)
      end
    end
  end
end
