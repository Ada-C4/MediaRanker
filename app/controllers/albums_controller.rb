class AlbumsController < ApplicationController

  def new
    @album = Album.new
  end

  def create
    @album = Album.create(album_params)
    redirect_to album_path(@album.id)
  end

  def show
    @album = Album.find(params[:id])
  end

  def edit
    @album = Album.find(params[:id])
  end

  def update
    album = Album.find(params[:id])
    album.update_attributes(album_params)
    redirect_to album_path(params[:id])
  end


  ###########PRIVATE############
  private

  def album_params
    params.require(:album).permit(:name, :artist, :description)
  end


end
