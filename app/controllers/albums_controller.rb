class AlbumsController < ApplicationController
  def index
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
