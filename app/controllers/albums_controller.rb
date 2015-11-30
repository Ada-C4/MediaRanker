class AlbumsController < ApplicationController
  def index
  end

  def upvote
    @album = Album.find(params[:id])
    @album.update_attribute(:ranking, @album.ranking + 1)
    redirect_to action: :show
  end

  def show
    @album = Album.find(params[:id])
  end

  def new
  end
  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def new
  end

  private

  def album_params
    params.permit(album:[:title, :description, :ranking, :artist])
  end
end
