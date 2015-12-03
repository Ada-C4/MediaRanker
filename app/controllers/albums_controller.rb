class AlbumsController < ApplicationController

  def index
    @albums = Album.all.sort_by { |album| -album.rank }
  end

  def upvote
    a = Album.find(params[:id])
    a.rank += 1
    a.save
    redirect_to album_path(a)
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

  private

  def album_params
    params.permit(album:[:name, :artist, :description, :rank])
  end

end
