class MediaController < ApplicationController
  before_action :set_type
  before_action :creator, only: [:new, :edit, :create, :update]

  def index
    @items = type_class.order(votes: :desc)

    render "index"
  end

  def show
    @item = type_class.find(params[:id])

    case @type
    when "Book" then @special = "Written"
    when "Movie" then @special = "Directed"
    when "Album" then @special = "Recorded"
    end

    @type += "s"

    render "show"
  end

  def upvote
    upvoted = type_class.find(params[:id])
    upvoted.increment!(:votes)

    redirect_to polymorphic_path(upvoted)
  end

  def new
    @item = type_class.new
    @what = "New"

    render "form"
  end

  def create
    @item = type_class.new(type_params)

    if @item.save
      redirect_to polymorphic_path(@item)
    else
      @what = "New"
      render "form"
    end
  end

  def edit
    @item = type_class.find(params[:id])
    @what = "Edit"

    render "form"
  end

  def update
    @item = type_class.find(params[:id])
    @item.attributes = type_params

    if @item.save
      redirect_to polymorphic_path(@item)
    else
      @what = "New"
      render "form"
    end
  end

  def destroy
    item = type_class.find(params[:id])
    type_class.destroy(item.id)

    redirect_to polymorphic_path(type_class)
  end

  private

  def set_type
    @type = type
  end

  def type
    params[:type]
  end

  def type_class
    type.constantize
  end

  def creator
    case @type
    when "Book" then @special = "Author"
    when "Movie" then @special = "Director"
    when "Album" then @special = "Artist"
    end
  end

  def type_params
    params.require(type.downcase).permit(:name, :creator, :description)
  end
end
