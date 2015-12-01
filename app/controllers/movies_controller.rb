class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movies = Movie.find(params[:id])
    @creater = "Directed by:"
  end

  def new
    @movies = Movie.new
  end

  def create
    @movies = Movie.create(movie_params[:movie])
    if @movies.save
      redirect_to movie_path(@movies.id)
    else
      render "new"
    end
  end

  def edit
    @movies = Movie.find(params[:id])
  end

  def update
    @movies = Movie.find(params[:id])
    Movie.update(params[:id], movie_params[:movie])
    redirect_to movie_path(params[:id])
  end

  def destroy
    Movie.destroy(params[:id])
    redirect_to movies_path
  end

  def upvote
    @movies = Movie.find(params[:id])
    @movies.rank += 1
    @movies.save
    redirect_to movie_path(@movies.id)
  end

  private

  def movie_params
    params.permit(movie: [:name, :director, :description])
  end
end
