class AlbumsController < ApplicationController
  def index
    @albums = Album.all
  end

  def show
    @album = Album.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
    @album = Album.find(params[:id])
  end

  def update
    @album = Album.find(params[:id])
    @album.update(album_params)
  end

  def destroy
  end

  private

  def album_params
    params.require(:album).permit([:name, :artist, :description])
  end
end
