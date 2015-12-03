class AlbumsController < ApplicationController

  def index
    @albums = Album.order(rank: :desc)
  end

  def create
    redirect_to movies_path
  end

  def new
  end

  def edit
  end

  def show
  end

  def update
    redirect_to movies_path
  end

  def destroy
    redirect_to movies_path
  end

end
