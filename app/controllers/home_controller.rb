class HomeController < ApplicationController
  def index
    @movies = Movie.order(upvotes: :desc).take(10)
    @books = Book.order(upvotes: :desc).take(10)
    @albums = Album.order(upvotes: :desc).take(10)
  end
end
