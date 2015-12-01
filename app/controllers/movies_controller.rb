class MoviesController < ApplicationController
  before_action :get_movie, only: [:edit, :update, :destroy]
  def get_movie
    @movie = Movie.find(params[:id])
  end

  def index
    # @movie = Movie.find(params[:id])
    @movies = Movie.all
  end

  def new
    @url = "create"
    @movie = Movie.new
  end

  def create
    @movie = Movie.create(movie_params[:movie])
    redirect_to "/movies"
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def edit
    @legend = "Edit Movie"
  end

  def update
    Movie.update(params[:id], movie_params[:movie])
    redirect_to "/movies/#{@movie.id}"
  end

  def destroy
    Movie.destroy(params[:id])
    redirect_to movies_path
  end

  def upvote
    @movie = Movie.find(params[:id])
    @movie.rank += 1
    @movie.save
    render "show"
  end

private

  def movie_params
    params.permit(movie: [:name, :director, :description, :rank])
  end
end
