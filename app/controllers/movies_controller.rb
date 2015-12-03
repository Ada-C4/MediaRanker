class MoviesController < ApplicationController
  def index
    @model = Movie.all
    @path = new_movie_path
    @add_button = "Add New Movie"
  end

  def show
    @media = Movie.find(params[:id])
    @path = upvote_movie_path(@media)
  end

  def new
    @model = Movie.new
    @action = "create"
    @method = :post
    @title = "New Movie"
    @artist_type = "Directed By"
  end

  def create
    Movie.create(movie_params)
    redirect_to movies_path
  end

  def upvote
    @media = Movie.find(params[:id])
    @media.increment!(:votes)
    redirect_to movie_path(@media)
  end

private
  def movie_params
    #this makes strong params
    params.require(:movie).permit(:title, :artist, :description, :votes)
  end
end
