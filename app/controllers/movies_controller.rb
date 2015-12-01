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
    elsif params[:class] == "upvote_i"
      get_movie
      rank = @movie[:rank] + 1
      @movie.update(:rank => rank)
      redirect_to movies_path
    else
      get_movie
      @movie.update(movie_params[:movie])
      redirect_to movie_path
    end
  end

  def create
    @movie = Movie.new(movie_params[:movie])
    @movie.update(:rank => 0)
    if @movie.save
      redirect_to movies_path
    else
      render "new"
    end
  end

  def destroy
    Movie.destroy(params[:id])
    redirect_to movies_path
  end

  private

  def movie_params
    params.permit(movie: [:name, :director, :description, :rank])
  end
end
