class AlbumsController < ApplicationController

  def index
    @albums = Album.all
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.create(album_params)
    @album.update(:rank => 0)
    if @album.save
      redirect_to album_path(@album.id)
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
    @album.update_attributes(album_params)
    if @album.save
      redirect_to album_path(params[:id])
    else
      render "edit"
    end
  end

  def destroy
    Album.destroy(params[:id])
    redirect_to albums_path
  end

  def upvote
    album = Album.find(params[:id])
    rank = album.rank
    rank += 1
    album.update(rank: rank)
    redirect_to :back
  end



  ###########PRIVATE############
  private

  def album_params
    params.require(:album).permit(:name, :artist, :description)
  end


end
