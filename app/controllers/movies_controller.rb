class MoviesController < ApplicationController

  def get_movie
    id = params[:id]
    @movie = Movie.find(id)
  end

  def index
    @movies = Movie.all
  end

  def show
    get_movie
  end
  
  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.create(movie_params[:movie])
    redirect_to "/movies"
  end

  def edit
    get_movie
  end

  def update
    if params[:class] == "vote"
      get_movie
      @movie.update(:rank => @movie[:rank] + 1)
    end
    redirect_to "/movies"
  end

  private

  def movie_params
    params.permit(movie:[:name, :director, :description, :rank])
  end
end
