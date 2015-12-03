class AlbumsController < ApplicationController
  def index
    @model = Album.all
    @path = new_album_path
    @add_button = "Add New Album"
  end

  def show
    @media = Album.find(params[:id])
    @path = upvote_album_path(@media)
  end

  def new
    @model = Album.new
    @action = "create"
    @method = :post
    @title = "New Album"
    @artist_type = "Artist"
  end

  def create
    Album.create(album_params)
    redirect_to albums_path
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def upvote
    @media = Album.find(params[:id])
    @media.increment!(:votes)
    redirect_to album_path(@media)
  end

private
  def album_params
    #this makes strong params
    params.require(:album).permit(:title, :artist, :description, :votes)
  end
end
