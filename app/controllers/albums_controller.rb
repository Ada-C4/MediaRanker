class AlbumsController < ApplicationController
  def index
    @items = Album.order(votes: :desc)
    @type = "Album"

    render "shared/index"
  end

  def show
    @item = Album.find(params[:id])
    @type = "Albums"
    @special = "Recorded"


    render "shared/show"
  end

  def upvote
    Album.find(params[:id]).increment!(:votes)

    redirect_to :back
  end

  def new
    @item = Album.new
    @special = "Artist"

    render "shared/new"
  end

  def create
    @item = Album.new(album_params)

    if @item.save
      redirect_to albums_path
    else
      render "shared/new"
    end
  end

  def edit
    @item = Album.find(params[:id])
    @special = "Artist"

    render "shared/new"
  end

  def update
    @item = Album.find(params[:id])
    @item.attributes = album_params

    if @item.save
      redirect_to albums_path
    else
      render "shared/new"
    end
  end

  def destroy
    Album.destroy(Album.find(params[:id]))

    redirect_to albums_path
  end

  private

  def album_params
    params.require(:album).permit(:name, :creator, :description)
  end
end
