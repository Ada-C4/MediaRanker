class AlbumsController < ApplicationController

  def index
    @albums = Album.order(rank: :desc)
  end

  def create
    album = Album.create(album_params)
    album.update_attribute(:rank, 1)
    redirect_to albums_path
  end

  def new
    @album = Album.new
  end

  def edit
    @album = Album.find(params[:id])
  end

  def show
    @album = Album.find(params[:id])
  end

  def update
    album = Album.find(params[:id])
    album.update(album_params)
    redirect_to albums_path
  end

  def destroy
    album = Album.find(params[:id])
    album.destroy
    redirect_to albums_path
  end

  def upvote
    album = Album.find(params[:id])
    rank = album.rank + 1
    album.update_attribute(:rank, rank)
    redirect_to(:back)
  end

private

  def album_params
    params.require(:album).permit(:title, :artist, :description)
    end

end
