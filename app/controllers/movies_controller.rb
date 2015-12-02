class MoviesController < ApplicationController
  def index
    @items = Medium.where(kind: "movie").order(votes: :desc)
    @type = "movie"

    render "index"
  end

  def show
    @item = Medium.find(params[:id])
    @type = "Movies"
    @special = "Directed"

    render "show"
  end

  def upvote
    Medium.find(params[:id]).increment!(:votes)

    redirect_to :back
  end

  def new
    @item = Medium.new(kind: "movie")
    @special = "Director"
    @url = polymorphic_path([@item.kind, @item, :index])

    render "form"
  end

  def create
    @item = Medium.new(movie_params)
    @item.kind = "movie"

    if @item.save
      redirect_to movie_medium_path(@item)
    else
      @url = polymorphic_path([@item.kind, @item, :index])

      render "form"
    end
  end

  def edit
    @item = Medium.find(params[:id])
    @special = "Director"
    @url = polymorphic_path([@item.kind, @item])

    render "form"
  end

  def update
    @item = Medium.find(params[:id])
    @item.attributes = movie_params

    if @item.save
      redirect_to movie_medium_path(@item)
    else
      render "form"
    end
  end

  def destroy
    item = Medium.find(params[:id])
    Medium.destroy(item.id)

    redirect_to movie_medium_index_path
  end

  private

  def movie_params
    params.require(:medium).permit(:name, :creator, :description)
  end
end
