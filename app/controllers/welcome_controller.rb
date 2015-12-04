class WelcomeController < ApplicationController
  def home
    @movies= Movie.all
    @albums= Album.all
    @books= Book.all
  end
end
