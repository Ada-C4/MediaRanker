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
    if @album.save
      redirect_to album_path(@album.id)
    else
      render "new"
    end
  end

  def edit
    id = params[:id]
    @album = Album.find(id)
  end

  def update
    id = params[:id]
    @album = Album.find(id)
    if @album.update(album_params[:album])
      redirect_to album_path(@album.id)
    else
      render "edit"
    end
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
