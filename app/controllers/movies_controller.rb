class MoviesController < ApplicationController
  before_action :set_movie, only: [ :show, :edit, :update, :destroy, :add_comment ]
  before_action :convert_params_to_snake_case, only: [ :create, :update ]


  def index
    @movies = Movie.all
  end

  def show
  end

  def add_comment
    if params[:comment].present?
      @movie.add_comment(params[:comment])
      redirect_to movie_path(@movie), notice: "Comentário adicionado com sucesso."
    else
      redirect_to movie_path(@movie), alert: "O comentário não pode ser vazio."
    end
  end

  def new
    @movie = Movie.new
  end

  def edit
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save!
      redirect_to @movie, notice: "Movie was successfully created."
    else
      render :new
    end
  end

  def update
    if @movie.update(movie_params)
      redirect_to @movie, notice: "Movie was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @movie.destroy
    redirect_to movies_url, notice: "Movie was successfully destroyed."
  end

  private

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def convert_params_to_snake_case
    if params[:movie]
      params[:movie] = params[:movie].to_unsafe_h.transform_keys { |key| key.underscore }
    end
  end

  def movie_params
    params.require(:movie).permit(:title, :year, :genre, :director, :actors, :plot, :poster, :imdb_id)
  end
end
