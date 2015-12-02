class AlbumsController < ApplicationController
  def index
    @items = Medium.where(kind: "album").order(votes: :desc)
    @type = "album"

    render "index"
  end

  def show
    @item = Medium.find(params[:id])
    @type = "Albums"
    @special = "Recorded"


    render "show"
  end

  def upvote
    Medium.find(params[:id]).increment!(:votes)

    redirect_to :back
  end

  def new
    @item = Medium.new(kind: "album")
    @special = "Artist"
    @url = polymorphic_path([@item.kind, @item, :index])

    render "form"
  end

  def create
    @item = Medium.new(album_params)
    @item.kind = "album"

    if @item.save
      redirect_to album_medium_path(@item)
    else
      @url = polymorphic_path([@item.kind, @item, :index])

      render "form"
    end
  end

  def edit
    @item = Medium.find(params[:id])
    @special = "Artist"
    @url = polymorphic_path([@item.kind, @item])

    render "form"
  end

  def update
    @item = Medium.find(params[:id])
    @item.attributes = album_params

    if @item.save
      redirect_to album_medium_path(@item)
    else
      @url = polymorphic_path([@item.kind, @item, :index])

      render "form"
    end
  end

  def destroy
    item = Medium.find(params[:id])
    Medium.destroy(item.id)

    redirect_to album_medium_index_path
  end

  private

  def album_params
    params.require(:medium).permit(:name, :creator, :description)
  end
end
