class AlbumsController < ApplicationController
  def index
    @albums = Album.all
  end

  def show
    id = params[:id]
    @album = Album.find(id)
  end

  private
end
