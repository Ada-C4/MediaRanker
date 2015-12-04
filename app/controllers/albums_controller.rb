class AlbumsController < ApplicationController
  def index
    @model = Album.all
    @path = new_album_path
    @add_button = "Add New Album"
  end

  def show
    @media = Album.find(params[:id])
    @path = upvote_album_path(@media)
    @edit_path = edit_album_path(@media)
    @index_button = "View all Albums"
    @index_path = albums_path
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
    id = params[:id]
    @action = "update"
    @method = :patch
    @model = Album.find(id)
    render "new"
  end

  def update
    Album.update(params[:id], album_params)
    redirect_to album_path(params[:id])
  end

  def destroy
    id = params[:id]
    Album.find(id).destroy
    redirect_to albums_path
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
