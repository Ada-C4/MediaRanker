class WelcomeController < ApplicationController
  def index
    movies = Movie.all
    @movies = movies.order(votes: :desc).first(10)

    books = Book.all
    @books = books.order(votes: :desc).first(10)
    
    albums = Album.all
    @albums = albums.order(votes: :desc).first(10)
  end
end
