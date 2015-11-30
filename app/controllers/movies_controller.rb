class MoviesController < ApplicationController
  def all_media
    @movies = Movie.all
    @books = Book.all
    @albums = Album.all
  end

  def index
    @movies = Movie.all
  end

end
