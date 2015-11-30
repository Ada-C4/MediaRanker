class AlbumsController < ApplicationController
	before_action :set_album, only: [:edit, :show, :update, :destroy] 

  def new
  	@album = Album.new
  end

  def create
  	@album = Album.new(album_params)
  	if @album.save
  		redirect_to album_path(@album)
  	else 
  		render 'new'
  	end
  end

  def edit
  end

  def update
  	@album.update(album_params)
  	redirect_to album_path(@album)
  end

  def index
  	@albums = Album.all
  end

  def show
  end

  def destroy
  	@album.destroy
  	redirect_to albums_path
  end

  private 

  def album_params
  	return params.require(:album).permit(:name, :artist, :description)
  end

  def set_album
  	@album = Album.find(params[:id])
  end
end
