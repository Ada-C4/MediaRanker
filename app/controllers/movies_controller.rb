class MoviesController < ApplicationController

  def get_movie
    @movie = Movie.find(params[:id])
  end

  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def show
    get_movie
  end

  def edit
    get_movie
  end

  def update
    if params[:class] == "upvote"
      get_movie
      rank = @movie[:rank] + 1
      @movie.update(:rank => rank)
      render "show"
    else
      get_movie
      @movie.update(movie_params[:movie])
      redirect_to movie_path
    end
  end

  def create
    movie.create(movie_params[:movie])
    redirect_to movies_path
  end

  def destroy
  end

  private

  def movie_params
    params.permit(movie: [:name, :director, :description, :rank])
  end
end
