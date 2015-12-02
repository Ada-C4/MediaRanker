class WelcomeController < ApplicationController
  def index
    @movies = Medium.where(kind: "movie").order(votes: :desc).first(10)
    @books = Medium.where(kind: "book").order(votes: :desc).first(10)
    @albums = Medium.where(kind: "album").order(votes: :desc).first(10)
  end
end
