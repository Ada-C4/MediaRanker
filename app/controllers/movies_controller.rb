class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
    @creater = "Directed by:"
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.create(movie_params[:movie])
    if @movie.save
      redirect_to movie_path(@movie.id)
    else
      render "new"
    end
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    Movie.update(params[:id], movie_params[:movie])
    redirect_to movie_path(params[:id])
  end

  def destroy
    Movie.destroy(params[:id])
    redirect_to movies_path
  end

  def upvote
    @movie = Movie.find(params[:id])
    @movie.rank += 1
    @movie.save
    redirect_to movie_path(@movie.id)
  end

  private

  def movie_params
    params.permit(movie: [:name, :director, :description])
  end
end
