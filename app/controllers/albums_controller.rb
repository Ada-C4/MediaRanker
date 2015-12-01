class AlbumsController < ApplicationController
  def index
    @albums = Album.all
  end

  def show
    id = params[:id]
    @album = Album.find(id)
  end

  def new
    @album = Album.new
  end

  def create
    id = params[:id]
    Album.create(album_params[:album])
    redirect_to "/albums/#{id}"
  end

  def edit
    id = params[:id]
    @album = Album.find(id)
  end

  def update
    id = params[:id]
    @album = Album.find(id)
    @album.update(
    name: album_params[:album][:name],
    artist: album_params[:album][:artist],
    description: album_params[:album][:description]
    )
    redirect_to "/albums/#{id}"
  end

  def destroy
    id = params[:id]
    Album.destroy(id)
    redirect_to "/albums/"
  end

  def upvote
    id = params[:id]
    @album = Album.find(id)
    current_score = Album.find(id).upvotes
    if current_score.nil?
      new_score = 1
    else
      new_score = current_score + 1
    end
    @album.update(
    upvotes: new_score
    )
    redirect_to "/albums/#{id}"
  end

  private

  def album_params
    params.permit(album:[:name, :artist, :description, :upvotes])
  end
end
