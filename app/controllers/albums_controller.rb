class AlbumsController < ApplicationController
  def index
    albums = Album.all

    @media = albums.order(votes: :desc) if params[:order].nil?

    @media = albums.order(votes: :asc) if params[:order] == 'asc'
    @media = albums.order(votes: :desc) if params[:order] == 'desc'

  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params[:album])

    if @album.save
      redirect_to album_path(@album)
    else
      render :new
    end

  end

  def show
    @art = Album.find(params[:id])
    @art_attribute = @art.artist
  end

  def edit
    @album = Album.find(params[:id])
  end

  def update
    @album = Album.find(params[:id])
    @album.attributes = album_params[:album]

    if @album.save
      redirect_to album_path(@album)
    else
      render :edit
    end
  end

  def destroy
    album = Album.find(params[:id])
    album.destroy

    redirect_to albums_path
  end

  def upvote
    album = Album.find(params[:id])
    album.increment!(:votes)

    redirect_to :back
  end


  private

  def album_params
    params.permit(album:[:title, :artist, :description])
  end
end
