class AlbumsController < ApplicationController
  def index
    @albums = Album.order(ranked: :desc)
  end

  def show
    @album = Album.find(params[:id])
  end

  def new
    @album = Album.new
  end

  def create
    album = Album.create(album_params)
    redirect_to album_path(album)
  end

  def edit
    @album = Album.find(params[:id])
  end

  def update
    @album = Album.find(params[:id])
    @album.update(album_params)
    redirect_to album_path(@album)
  end

  def destroy
    album = Album.find(params[:id])
    album.destroy
    redirect_to albums_path
  end

  def upvote
    album = Album.find(params[:id])
    album.ranked += 1
    album.save
    redirect_to album_path(album)
  end

  private

  def album_params
    params.require(:album).permit([:name, :artist, :description])
  end
end
