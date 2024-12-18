class OmdbController < ApplicationController
  def search
    if params[:query].present?
      omdb_api = OmdbApi.new
      @search_results = omdb_api.search(params[:query])

      if @search_results.include?(:error)
        @search_results = []
      end
    else
      @search_results = []
    end
  end


  def show
    imdb_id = params[:id]
    omdb_service = OmdbService.new(imdb_id)
    @movie = omdb_service.fetch_movie_details(imdb_id)
  end
end
