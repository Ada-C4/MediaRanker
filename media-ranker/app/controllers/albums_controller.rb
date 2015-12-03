class AlbumsController < ApplicationController

  def index
    @albums = Album.order(rank: :desc)
  end

  def create
    album = Album.create(album_params)
    album.update_attribute(:rank, 1)
    redirect_to albums_path
  end

  def new
    @album = Album.new
  end

  def edit
  end

  def show
  end

  def update
    redirect_to movies_path
  end

  def destroy
    redirect_to movies_path
  end
  
private

  def album_params
    params.require(:album).permit(:title, :artist, :description)
    end

end
