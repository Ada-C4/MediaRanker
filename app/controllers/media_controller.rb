class MediaController < ApplicationController
  def index
    @books = Book.all.order(:upvotes).reverse.take(10)
    @albums = Album.all.order(:upvotes).reverse.take(10)
    @movies = Movie.all.order(:upvotes).reverse.take(10)
  end
end
