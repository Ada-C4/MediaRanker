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
  		@media = Album.new(album_params)
  		render 'new'
  	end
  end

  def edit
  end

  def update
  	if @media.update(album_params)
  		redirect_to album_path(@media)
  	else 
  		redirect_to edit_album_path(@media)
  	end
  end

  def index
  	@media = Album.order(votes: :desc)
  end

  def show
  end

  def destroy
  	@media.destroy
  	redirect_to albums_path
  end

  def upvote
  	@media.votes += 1
  	@media.save
  	redirect_to :back
  end

  private 

  def album_params
  	return params.require(:album).permit(:name, :artist, :description)
  end

  def set_album
  	@media = Album.find(params[:id])
  end
end
