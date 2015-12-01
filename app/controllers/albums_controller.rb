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

  ###########PRIVATE############
  private

  def album_params
    params.require(:album).permit(:name, :artist, :description)
  end


end
