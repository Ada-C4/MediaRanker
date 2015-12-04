class WelcomeController < ApplicationController

  def index
    @movies = Movie.all.order(rank: :desc)
    @books = Book.all.order(rank: :desc)
    @albums = Album.all.order(rank: :desc)
  end

end
