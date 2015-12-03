class HomeController < ApplicationController

  def index
    @movies = Movie.all
    @albums = Album.all
    @books = Book.all
  end
end
