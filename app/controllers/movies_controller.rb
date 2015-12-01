class MoviesController < ApplicationController
  def index
    @items = Movie.order(votes: :desc)
    @type = "Movie"

    render "index"
  end

  def show
    @item = Movie.find(params[:id])
    @type = "Movies"
    @special = "Directed"


    render "show"
  end

  def upvote
    Movie.find(params[:id]).increment!(:votes)

    redirect_to :back
  end

  def new
    @item = Movie.new
    @special = "Director"

    render "form"
  end

  def create
    @item = Movie.new(movie_params)

    if @item.save
      redirect_to movies_path
    else
      render "new"
    end
  end

  def edit
    @item = Movie.find(params[:id])
    @special = "Director"

    render "new"
  end

  def update
    @item = Movie.find(params[:id])
    @item.attributes = movie_params

    if @item.save
      redirect_to movies_path
    else
      render "new"
    end
  end

  def destroy
    Movie.destroy(Movie.find(params[:id]))

    redirect_to movies_path
  end

  private

  def movie_params
    params.require(:movie).permit(:name, :creator, :description)
  end
end
