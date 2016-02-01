class HomepageController < ApplicationController
  def home
    @books = Book.order(ranking: :desc).limit(10)
    @albums = Album.order(ranking: :desc).limit(10)
    @movies = Movie.order(ranking: :desc).limit(10)
  end
end
