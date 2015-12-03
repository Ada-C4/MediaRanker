class HomeController < ApplicationController

  def index
    @movies = Movie.all
    @movies_sort = @movies.sort_by{ |movie| movie[:rank] }.reverse
    @movies_ten = @movies_sort.first(10)

    @books = Book.all
    @books_sort = @books.sort_by{ |book| book[:rank] }.reverse
    @books_ten = @books_sort.first(10)

    @albums = Album.all
    @albums_sort = @albums.sort_by{ |albums| albums[:rank] }.reverse
    @albums_ten = @albums_sort.first(10)
  end
end
