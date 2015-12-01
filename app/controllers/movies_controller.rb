class MoviesController < ApplicationController
  def index
    @items = Movie.order(votes: :desc)
    @type = "Movie"

    render "shared/index"
  end

  def show
    @item = Movie.find(params[:id])
    @type = "Movies"
    @special = "Directed"


    render "shared/show"
  end

  def upvote
    Movie.find(params[:id]).increment!(:votes)

    redirect_to :back
  end

  def new
    @item = Movie.new
    @special = "Director"

    render "shared/new"
  end

  def create
    @item = Movie.new(movie_params)

    if @item.save
      redirect_to movies_path
    else
      render "shared/new"
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def movie_params
    params.require(:movie).permit(:name, :creator, :description)
  end
end
