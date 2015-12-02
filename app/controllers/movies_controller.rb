class MoviesController < ApplicationController
  before_action only: [:show, :edit, :update, :upvote] { @movie = Movie.find(params[:id]) }
  def index
    @movies = Movie.all
  end

  def show
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
  end

  def update
    @movie.update(movie_params[:movie])
    if @movie.save
      redirect_to movie_path(@movie)
    else
      render "new"
    end
  end

  def destroy
    Movie.destroy(params[:id])
    redirect_to movies_path
  end

  def upvote
    @movie.rank += 1
    @movie.save
    redirect_to movie_path(@movie)
  end

  private

  def movie_params
    params.permit(movie: [:name, :director, :description, :rank])
  end
end
