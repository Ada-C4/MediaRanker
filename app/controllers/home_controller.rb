class HomeController < ApplicationController

  def index
    @movies = Movie.all.sort_by { |movie| -movie.rank }.first(10)
    @albums = Album.all.sort_by { |album| -album.rank }.first(10)
    @books = Book.all.sort_by { |book| -book.rank }.first(10)
  end
end
