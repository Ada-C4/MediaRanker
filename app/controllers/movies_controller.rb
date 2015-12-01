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
    @title = "Add New Movie"
    @action = "create"
  end

  def create
    @movie = Movie.create(movie_params[:movie])
    redirect_to "/movies"
  end

  def edit
    @movie = Movie.find(params[:id])
    @title = "Edit #{@movie.name}"
    @action = "update"
  end

  def upvote
    if params[:class] == "vote"
      get_movie
      @movie.update(:rank => @movie[:rank] + 1)
    end
    redirect_to "/movies/#{@movie.id}"
  end

  def update
    @movie = Movie.update(params[:id], name: movie_params[:movie][:name], director: movie_params[:movie][:director], description: movie_params[:movie][:description], rank: movie_params[:movie][:rank])
    redirect_to "/movies"
  end

  def destroy
    Movie.destroy(params[:id])
    redirect_to '/movies'
  end

  private

  def movie_params
    params.permit(movie:[:name, :director, :description, :rank])
  end
end
