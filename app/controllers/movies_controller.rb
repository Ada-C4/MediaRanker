class MoviesController < ApplicationController
  before_action :get_movie, only: [:show, :edit, :destroy, :upvote, :update]

  def get_movie
    @movie = Movie.find(params[:id])
  end

  def index
    @movies = Movie.order(ranked: :desc)
  end

  def show
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.create(movie_params)
    if @movie.save
      redirect_to movie_path(@movie)
    else
      render "new"
    end
  end

  def edit
  end

  def update
    @movie.update(movie_params)
    if @movie.save
      redirect_to movie_path(@movie)
    else
      render "edit"
    end
  end

  def destroy
    @movie.destroy
    redirect_to movies_path
  end

  def upvote
    @movie.ranked += 1
    @movie.save
    redirect_to movie_path(@movie)
  end

  private

  def movie_params
    params.require(:movie).permit([:name, :director, :description])
  end
end
