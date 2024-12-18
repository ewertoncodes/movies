class Movie
  include Mongoid::Document
  field :title, type: String
  field :year, type: String
  field :genre, type: String
  field :director, type: String
  field :actors, type: String
  field :plot, type: String
  field :poster, type: String
  field :imdb_id, type: String
  field :comments, type: Array, default: []


  validates :title, :year, :genre, presence: true


  def add_comment(content)
    self.comments << content
    save
  end
end
