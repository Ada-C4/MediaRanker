class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index
    @books = Book.order(rank: :desc).limit(3)
    @albums = Album.order(rank: :desc).limit(3)
    @movies = Movie.order(rank: :desc).limit(3)
  end

end
