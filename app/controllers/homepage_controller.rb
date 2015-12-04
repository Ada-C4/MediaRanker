class HomepageController < ApplicationController
  def index
    max = 10
    @books = Book.limit(max).order(:upvotes).reverse
    @movies = Movie.limit(max).order(:upvotes).reverse
    @albums = Album.limit(max).order(:upvotes).reverse
  end
end
