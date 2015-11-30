class MoviesController < ApplicationController
  def all_media
    @movies = Movie.all
    @books = Book.all
    @albums = Album.all
  end

  def index
    @content_list = Movie.all
    @item_path = "/movies/"
    @content_type = "Movie"
    @new_content_path = new_movie_path
  end

  def show
    @content = Movie.find(params[:id])
    @edit_path = edit_movie_path(params[:id])
    @content_path = movies_path
  end

  def new
    @item = Movie.new
    @person = :director
    @action = "create"
  end

  def create
    @person = :director
    new_params = movie_params[:movie]
    new_params[:votes] = 0
    @item = Movie.new(new_params)
    if @item.save
      redirect_to "/movies/#{movie.id}"
    else
      render "new"
    end
  end


  private

  def movie_params
    params.permit(movie:[:name, :director, :description])
  end

end
