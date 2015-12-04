class AlbumsController < ApplicationController

  def index
    @albums = Album.all.sort_by { |album| -album.rank }
  end

  def upvote
    album = Album.find(params[:id])
    album.rank += 1
    album.save
    redirect_to album_path(album)
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params[:album])
    if @album.save
      redirect_to album_path(@album)
    else
      render "new"
    end
  end

  def show
    @album = Album.find(params[:id])
  end

  def edit
    @album = Album.find(params[:id])
  end

  def update
    @album = Album.find(params[:id])
    @album.update( album_params[:album])
    if @album.save
      redirect_to album_path(@album)
    else
      render "edit"
    end
  end

  def destroy
    Album.destroy(params[:id])
    redirect_to albums_path
  end

  private

  def album_params
    params.permit(album:[:name, :artist, :description, :rank])
  end

end
