class WelcomeController < ApplicationController
  def index
    @albums = Album.first(10)
    @books = Book.first(10)
    @movies = Movie.first(10)
  end
end
