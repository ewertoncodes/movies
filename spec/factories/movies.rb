FactoryBot.define do
  factory :movie do
    title { "Inception" }
    year { 2010 }
    genre { "Sci-Fi" }
    director { "Christopher Nolan" }
    actors { "Leonardo DiCaprio, Joseph Gordon-Levitt" }
    plot { "A mind-bending thriller about dreams within dreams." }
    poster { "http://example.com/poster.jpg" }
    imdb_id { "tt1375666" }
  end
end
