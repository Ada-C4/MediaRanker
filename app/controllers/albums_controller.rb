class AlbumsController < ApplicationController
  include SharedMethods
  before_action :get_album, only:[:show, :destroy, :update, :edit, :upvote]
  def index
    @albums = Album.all.order(:upvotes).reverse
  end

  def new
    @album = Album.new
  end

  def destroy
    @album.destroy
    redirect_to albums_path
  end

  def update
    @album.update(album_params[:album]) ? (redirect_to album_path(@album)) : (render :edit)
  end

  def create
    album = Album.new(album_params[:album])
    if album.save
      redirect_to album_path(album.id)
    else
      @album = album
      render :new
    end
  end

  def upvote
    @album.upvotes += 1
    @album.save
    redirect_to album_path(@album)
  end

  private
  def get_album
    @album = Album.find(params[:id])
  end

  def album_params
    params.permit(album:[:id, :title, :creator, :description, :upvotes])
  end
end
