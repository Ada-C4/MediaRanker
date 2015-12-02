class AlbumsController < ApplicationController
  def index
    @albums = Album.all
  end

  def show
    @albums = Album.find(params[:id])
  end

  def new
    @albums = Album.new
  end

  def create
    @albums = Album.create(album_params[:album])
    if @albums.save
      redirect_to album_path(@albums.id)
    else
      render "new"
    end
  end

  def edit
    @albums = Album.find(params[:id])
  end

  def update
    @albums = Album.find(params[:id])
    album.update(params[:id], album_params[:album])
    redirect_to album_path(params[:id])
  end

  def destroy
    Album.destroy(params[:id])
    redirect_to albums_path
  end

  def upvote
    @albums = Album.find(params[:id])
    @albums.rank += 1
    @albums.save
    redirect_to album_path(@albums.id)
  end

  private

  def album_params
    params.permit(movie: [:name, :artist, :description])
  end
end
