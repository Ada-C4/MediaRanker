class MoviesController < ApplicationController
  before_action only: [:show, :edit, :update, :upvote] { @movie = Movie.find(params[:id]) }
  def index
    @movies = Movie.order(rank: :desc)
  end

  def show
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.create(movie_params[:movie])
    if @movie.save
      redirect_to "show"
    else
      render "new"
    end
  end

  def edit
  end

  def update
    @movie.update(movie_params[:movie])
    if @movie.save
      redirect_to "show"
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
