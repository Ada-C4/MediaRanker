class AlbumsController < ApplicationController
  before_action :get_album, only: [:show, :edit, :destroy, :upvote, :update]

  def get_album
    @album = Album.find(params[:id])
  end

  def index
    @albums = Album.order(ranked: :desc)
  end

  def show
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.create(album_params)
    if @album.save
      redirect_to album_path(@album)
    else
      render "new"
    end
  end

  def edit
  end

  def update
    @album.update(album_params)
    if @album.save
      redirect_to album_path(@album)
    else
      render "edit"
    end
  end

  def destroy
    @album.destroy
    redirect_to albums_path
  end

  def upvote
    @album.ranked += 1
    @album.save
    redirect_to album_path(@album)
  end

  private

  def album_params
    params.require(:album).permit([:name, :artist, :description])
  end
end
