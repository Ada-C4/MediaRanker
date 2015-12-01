class AlbumsController < ApplicationController
	before_action :set_album, only: [:edit, :show, :update, :destroy, :upvote] 

  def new
  	@media = Album.new
  end

  def create
  	@album = Album.new(album_params)
  	@album.votes = 0
  	if @album.save
  		redirect_to album_path(@album)
  	else 
  		render 'new'
  	end
  end

  def edit
  	@media = @album
  end

  def update
  	@album.update(album_params)
  	redirect_to album_path(@album)
  end

  def index
  	@media = Album.order(votes: :desc)
  end

  def show
  end

  def destroy
  	@album.destroy
  	redirect_to albums_path
  end

  def upvote
  	@album.votes += 1
  	@album.save
  	redirect_to :back
  end

  private 

  def album_params
  	return params.require(:album).permit(:name, :artist, :description)
  end

  def set_album
  	@album = Album.find(params[:id])
  end
end
