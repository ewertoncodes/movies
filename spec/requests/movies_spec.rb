require 'rails_helper'

RSpec.describe 'MoviesController', type: :request do
  let!(:movie) { create(:movie, title: 'Inception', year: 2010) }

  describe 'GET /movies' do
    it 'returns a successful response' do
      get movies_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /movies/:id' do
    context 'when the movie exists' do
      it 'returns a successful response' do
        get movie_path(movie)
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when the movie does not exist' do
      it 'returns a not found response' do
        get movie_path(id: 'nonexistent')
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe 'POST /movies' do
    context 'with valid parameters' do
      let(:movie_params) { attributes_for(:movie) }

      it 'creates a new movie' do
        expect do
          post movies_path, params: { movie: movie_params }
        end.to change(Movie, :count).by(1)
      end
    end

    context 'with invalid parameters' do
      let(:movie_params) { { title: nil, year: nil } }

      it 'does not create a new movie' do
        expect do
          post movies_path, params: { movie: movie_params }
        end.not_to change(Movie, :count)
      end
    end
  end

  describe 'PUT /movies/:id' do
    context 'with valid parameters' do
      let(:new_attributes) { { title: 'New Title' } }

      it 'updates the movie' do
        put movie_path(movie), params: { movie: new_attributes }
        expect(movie.reload.title).to eq('New Title')
      end
    end

    context 'with invalid parameters' do
      let(:invalid_attributes) { { title: nil } }

      it 'does not update the movie' do
        put movie_path(movie), params: { movie: invalid_attributes }
        expect(movie.reload.title).not_to eq(nil)
      end
    end
  end

  describe 'DELETE /movies/:id' do
    it 'destroys the movie' do
      expect do
        delete movie_path(movie)
      end.to change(Movie, :count).by(-1)
    end
  end

  describe 'POST /movies/:id/add_comment' do
    context 'with a valid comment' do
      it 'adds a comment to the movie' do
        post add_comment_movie_path(movie), params: { comment: 'Great movie!' }
        expect(movie.reload.comments).to include('Great movie!')
      end
    end

    context 'with an invalid comment' do
      it 'does not add a comment to the movie' do
        post add_comment_movie_path(movie), params: { comment: '' }
        expect(movie.reload.comments).not_to include('')
      end
    end
  end
end
