class AlbumsController < ApplicationController

  def get_album
    @album = Album.find(params[:id])
  end

  def index
    @albums = Album.all
  end

  def new
    @album = Album.new
  end

  def edit
    get_album
  end

  def show
    get_album
  end

  def update
    if params[:class] == "upvote"
      get_album
      rank = @album[:rank] + 1
      @album.update(:rank => rank)
      render "show"
    else
      get_album
      @album.update(album_params[:album])
      redirect_to album_path
    end
  end


  def create
    @album = Album.new(album_params[:album])
    if @album.save
      redirect_to albums_path
    else
      render "new"
    end
  end

  def destroy
    Album.destroy(params[:id])
    redirect_to albums_path
  end

  private

  def album_params
    params.permit(album: [:name, :artist, :description, :rank])
  end

end
