class OmdbService
  def initialize(query)
    @query = query
    @omdb_api = OmdbApi.new
  end

  def search_movies
    @omdb_api.search(@query)
  end

  def fetch_movie_details(imdb_id)
    @omdb_movie = @omdb_api.fetch_details(imdb_id)
  end
end
