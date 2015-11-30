class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    # code to sort movies by number of votes
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params[:movie])
    @movie.save

    redirect_to movies_path
  end

  def show
    @movie = Movie.find(params[:id])
  end


  private

  def movie_params
    params.permit(movie:[:title, :director, :description])
  end

end
