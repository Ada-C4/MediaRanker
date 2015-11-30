class MoviesController < ApplicationController
  def all_media
    @movies = Movie.all
    @books = Book.all
    @albums = Album.all
  end

  def index
    @movies = Movie.all
  end

  def show
    @content = Movie.find(params[:id])
    @edit_path = edit_movie_path(params[:id])
    @content_path = movies_path
  end

end
