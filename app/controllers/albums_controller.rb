class AlbumsController < ApplicationController
  def index
    @albums = Album.all
  end

  def show
    @album = Album.find(params[:id])
  end

  def edit
    @album = Album.find(params[:id])
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.create(album_params)
    redirect_to album_path
  end

  def update
    id = params[:id]
    album = Album.find(id)
    album.update_attributes(album_params)
    redirect_to album_path(params[:id])
  end

  def destroy
    Album.destroy(params[:id])
    redirect_to albums_path
  end

  def upvote
    id = params[:id]
    @album = Album.find(id)
    @album.rank += 1
    @album.save
    render "show"
  end

  private

  def album_params
    params.require(:album).permit(:name, :artist, :description, :rank)
  end
end
