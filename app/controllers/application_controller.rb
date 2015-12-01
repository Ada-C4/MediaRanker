class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
    @movies = Movie.order(rank: :desc)
    @books = Book.order(rank: :desc)
    @albums = Album.order(rank: :desc)
  end
end
