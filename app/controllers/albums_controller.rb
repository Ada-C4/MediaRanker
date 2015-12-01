class AlbumsController < ApplicationController
  def index
    @media = Album.order(ranking: :desc)
  end

  def show
    @media = Album.find(params[:id])
  end

  def new
    @media = Album.new
  end

  def create
    @media = Album.new(strong_params)
    if @media.save
      redirect_to album_path(@media.id)
    else
      render "new"
    end
  end

  def edit
    @media = Album.find(params[:id])
  end

  def update
    @media = Album.find(params[:id])
    @media.attributes = strong_params
    if @media.save
      render "show"
    else
      render "edit"
    end
  end

  def destroy
    album = Album.find(params[:id])
    album.destroy
    redirect_to albums_path
  end

  def upvote
    @media = Album.find(params[:id])
    @media.ranking += 1
    @media.save
    render "show"
  end

  private

  def strong_params
    params.require(:album).permit(:name, :artist, :description, :ranking)
  end
end
