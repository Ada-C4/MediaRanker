class AlbumsController < ApplicationController
  def index
    @media = Album.order(ranking: :desc)
  end

  def show
    @album = Album.find(params[:id])
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(strong_params)
    if @album.save
      redirect_to album_path(@album.id)
    else
      render "new"
    end
  end

  def edit
    @album = Album.find(params[:id])
  end

  def update
    @album = Album.find(params[:id])
    @album.attributes = strong_params
    if @album.save
      render "show"
    else
      render "new"
    end
  end

  def destroy
    album = Album.find(params[:id])
    album.destroy
    redirect_to albums_path
  end

  def upvote
    @album = Album.find(params[:id])
    @album.ranking += 1
    @album.save
    render "show"
  end

  private

  def strong_params
    params.require(:album).permit(:name, :artist, :description, :ranking)
  end
end
