class AlbumsController < ApplicationController

  def index
    @content_list = Album.order(votes: :desc)
    @item_path = "/albums/"
    @content_type = "album"
    @new_content_path = new_album_path
  end

  def show
    @content = Album.find(params[:id])
    @edit_path = edit_album_path(params[:id])
    @content_path = albums_path
    @item_path = "/albums/"
    @content_type = "Album"
    @correct_string = "Recorded by: "
    @person = @content.artist
  end

  def new
    @item = Album.new
    @person = :artist
    @action = "create"
  end

  def create
    @person = :author
    new_params = album_params[:album]
    new_params[:votes] = 0
    @item = Album.new(new_params)
    if @item.save
      redirect_to "/albums/#{@item.id}"
    else
      render "new"
    end
  end

  def edit
    @item = Album.find(params[:id])
    @person = :artist
    @action = "update"
  end

  def update
    @person = :artist
    @item = Album.update(params[:id], album_params[:album])
    if @item.save
      redirect_to "/albums/#{@item.id}"
    else
      render "new"
    end
  end


  def destroy
    Album.destroy(params[:id])
    redirect_to albums_path
  end

  def upvote
    id = params[:id]
    album = Album.find(id)
    votes = album.votes + 1
    album.update(votes: votes)
    redirect_to "/albums/#{id}"
  end

  private

  def album_params
    params.permit(album:[:name, :artist, :description])
  end

end
