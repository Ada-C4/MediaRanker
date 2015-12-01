class AlbumsController < ApplicationController

  def index
    @albums = Album.all
  end

  def upvote
    @album = Album.find(params[:id])
    @album.update_attribute(:ranking, @album.ranking + 1)
    redirect_to action: :show
  end

  def show
    @album = Album.find(params[:id])
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.create(title: album_params[:album][:title],
                 description: album_params[:album][:description],
                 artist: album_params[:album][:artist],
                 ranking: 0)
    redirect_to album_path(@album.id)
  end

  def edit
  end

  def update
  end

  def destroy
    id = params[:id]
    Album.destroy(id)
    redirect_to albums_path
  end

  private

  def album_params
    params.permit(album:[:title, :description, :ranking, :artist])
  end
end
