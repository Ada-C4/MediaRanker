class AlbumsController < ApplicationController
  before_action only: [:show, :edit, :update, :upvote] { @album = Album.find(params[:id]) }

  def index
    @albums = Album.order(rank: :desc)
  end

  def show
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.create(album_params[:album])
    if @album.save
      redirect_to "show"
    else
      render "new"
    end
  end

  def edit
  end

  def update
    @album.update(album_params[:album])
    if @album.save
      render "show"
    else
      render "new"
    end
  end

  def destroy
    Album.destroy(params[:id])
    redirect_to albums_path
  end

  def upvote
    @album.rank += 1
    @album.save
    redirect_to album_path(@album.id)
  end

  private

  def album_params
    params.permit(album: [:name, :artist, :description, :rank])
  end
end
