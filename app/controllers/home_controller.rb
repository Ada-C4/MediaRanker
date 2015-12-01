class HomeController < ApplicationController
  def index
    @movies = Movie.order(upvotes: :desc)
    @books = Book.order(upvotes: :desc)
    @albums = Album.order(upvotes: :desc)
  end
end
