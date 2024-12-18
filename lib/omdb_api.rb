require "httparty"

class OmdbApi
  include HTTParty
  base_uri "http://www.omdbapi.com/"

  def initialize
    @apikey = ENV["OMDB_API_KEY"]
  end

  def search(query)
    search_results = fetch_data({ s: query })

    return search_results if search_results.key?(:error)

    search_results["Search"].map do |movie|
      fetch_details(movie["imdbID"])
    end
  end

  def fetch_details(imdb_id)
    fetch_data({ i: imdb_id })
  end

  private

  def fetch_data(params)
    response = self.class.get("/", query: params.merge(apikey: @apikey))

    if response.success?
      response.parsed_response["Response"] == "True" ? response.parsed_response : { error: "Movie not found or error in API response" }
    else
      { error: "Failed to request data from OMDB API" }
    end
  rescue StandardError => e
    Rails.logger.error("OmdbApi fetch_data error: #{e.message}")
    { error: "Unexpected error while fetching data" }
  end
end
