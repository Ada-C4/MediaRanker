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
    ranking = @album.ranking + 1
    @album.update(ranking: ranking)
    redirect_to album_path(@album.id)
  end

  def create
    Album.create(album_params[:album])
    redirect_to albums_path
  end

  def destroy
    id = params[:id]
    Album.delete(id)
    redirect_to albums_path
  end

  def edit
    id = params[:id]
    @album = Album.find(id)
    session[:return_to] = request.referer
  end

  def update
    id = params[:id]
    album = album.find(id)
    album.update(
    name: album_params[:album][:name],
    artist: album_params[:album][:artist],
    description: album_params[:album][:description],
    )
    album.save
    if session[:return_to].nil?
      redirect_to "/"
    else
      redirect_to session[:return_to]
    end
    session[:return_to] = nil
  end


  private

  def album_params
    params.permit(book:[:name, :artist, :description])
  end
end
