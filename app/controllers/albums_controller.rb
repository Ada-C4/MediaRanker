class AlbumsController < ApplicationController
  before_action :get_album, only: [:edit, :update, :destroy]
  def get_album
    @album = Album.find(params[:id])
  end

  def index
    @albums = Album.all
  end

  def new
    @url = "create"
    @legend = "New Album"
    @album = Album.new
  end

  def create
    @album = Album.create(album_params[:album])
    if @album.save
      redirect_to albums_path
    else
      render :new
    end
  end

  def show
    @album = Album.find(params[:id])
  end

  def edit
    @album = Album.find(params[:id])
    @legend = "Edit Album"
  end

  def update
    Album.update(params[:id], album_params[:album])
    redirect_to "/albums/#{@album.id}"
  end

  def destroy
    Album.destroy(params[:id])
    redirect_to albums_path
  end

  def upvote
    @album = Album.find(params[:id])
    @album.rank += 1
    @album.save
    render "show"
  end

private

  def album_params
    params.permit(album: [:name, :artist, :description, :rank])
  end

end
