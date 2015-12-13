class AlbumsController < ApplicationController
  before_action :find_media, except: [:index, :new, :create]

  def index
    @media = Album.order(ranking: :desc)
  end

  def show
  end

  def new
    @media = Album.new
  end

  def create
    @media = Album.new(strong_params)
    @media.ranking = 0
    if @media.save
      render "show"
    else
      render "new"
    end
  end

  def edit
  end

  def update
    @media.attributes = strong_params
    if @media.save
      render "show"
    else
      render "edit"
    end
  end

  def destroy
    @media.destroy
    redirect_to albums_path
  end

  def upvote
    @media.ranking += 1
    @media.save
    render "show"
  end

  private

  def strong_params
    params.require(:album).permit(:name, :artist, :description)
  end

  def find_media
    if params[:id].nil?
      @media = Album.find(params[:album_id])
    else
      @media = Album.find(params[:id])
    end
  end
end
