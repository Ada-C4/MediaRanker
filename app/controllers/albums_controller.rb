class AlbumsController < ApplicationController
  def index
    @albums = Album.all
  end

  def show
    @album = Album.find(params[:id])
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.create(album_params[:album])
    if @album.save
      redirect_to album_path(@album.id)
    else
      render "new"
    end
  end

  def edit
    @album = Album.find(params[:id])
  end

  def update
    @album = Album.find(params[:id])
    @album.attributes = album_params
    if @album.save
      render "show"
    else
      render "new"
    end
  end

  def destroy
    Album.destroy(params[:id])
    redirect_to albums_path
  end

  def upvote
    @album = Album.find(params[:id])
    @album.rank += 1
    @album.save
    redirect_to album_path(@album.id)
  end

  private

  def album_params
    params.permit(movie: [:name, :artist, :description])
  end
end
