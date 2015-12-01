class AlbumsController < ApplicationController

  def index
    @albums = Album.all.order(:upvotes).reverse
  end

  def show
    @album = Album.find(params[:id])
  end

  def new
    @album = Album.new
  end

  def edit
    @album = Album.find(params[:id])
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to album_path(@album.id)
    else
      render :new
    end
  end

  def update
    Album.update(params[:id], album_params)
    redirect_to album_path(params[:id])
  end

  def upvote
    album = Album.find(params[:id])
    album.upvotes += 1
    album.save!
    redirect_to album_path(params[:id])
  end

  private

   def album_params
     params.require(:album).permit(:name, :artist, :description)
   end

end
