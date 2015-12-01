class AlbumsController < ApplicationController

  def index
    @albums = Album.all.sort_by { |album| -album.rank }
  end

  def upvote
    a = Album.find(params[:id])
    a.rank += 1
    a.save
    redirect_to album_path(a)
  end

end
