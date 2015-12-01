class MediaController < ApplicationController
  def index
    @books = Book.all.order(:upvotes).reverse.take(5)
    @albums = Album.all.order(:upvotes).reverse.take(5)
    @movies = Movie.all.order(:upvotes).reverse.take(5)
  end
end
