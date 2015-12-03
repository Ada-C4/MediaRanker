class AlbumsController < ApplicationController
  def get_album
    id = params[:id]
    @album = Album.find(id)
  end

  def index
    @albums = Album.all
  end

  def show
    get_album
  end

  def new
    @album = Album.new
    @title = "Add New album"
    @action = "create"
  end

  def create
    @album = Album.create(album_params[:album])
    redirect_to "/albums"
  end

  def edit
    @album = Album.find(params[:id])
    @title = "Edit #{@album.name}"
    @action = "update"
  end

  def upvote
    @album = Album.find(params[:id])
    @album.increment!(:rank)
    redirect_to :back
  end

  def update
    @album = Album.update(params[:id], name: album_params[:album][:name])
    redirect_to "/albums/#{@album.id}"
  end

  def destroy
    Album.destroy(params[:id])
    redirect_to '/albums'
  end

  private

  def album_params
    params.permit(album:[:name, :artist, :description, :rank])
  end
end
