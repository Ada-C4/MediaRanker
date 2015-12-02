class AlbumsController < ApplicationController
  def index
    @albums = Album.order(ranking: :desc)
  end

  def show
    id = params[:id]
    @album = Album.find(id)
  end

  def new
    @album = Album.new
  end

  def upvote
    @album = Album.find(params[:id])
    if @album.ranking.nil?
      ranking = 1
    else
      ranking = @album.ranking + 1
    end
    @album.update(ranking: ranking)
    redirect_to album_path(@album.id)
  end

  def create
    @album = Album.create(album_params[:album])
    if @album.save
      redirect_to album_path(@album)
    else
      render "new"
    end
  end

  def destroy
    id = params[:id]
    Album.delete(id)
    redirect_to albums_path
  end

  def edit
    id = params[:id]
    @album = Album.find(id)
  end

  def update
    id = params[:id]
    @album = Album.find(id)
    @album.attributes = {
    name: album_params[:album][:name],
    artist: album_params[:album][:artist],
    description: album_params[:album][:description],
    }
    if @album.save
      redirect_to album_path(@album.id)
    else
      render "edit"
    end
  end


  private

  def album_params
    params.permit(album:[:name, :artist, :description])
  end
end
