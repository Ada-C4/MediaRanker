class MediaController < ApplicationController
  def index
    @movies = Movie.order(votes: :desc).first(10)
    @books = Book.order(votes: :desc).first(10)
    @albums = Album.order(votes: :desc).first(10)
  end
end
