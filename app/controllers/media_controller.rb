class MediaController < ApplicationController
  before_action :set_type

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
    type_class.find(params[:id]).increment!(:votes)

    redirect_to :back
  end

  def new
    @item = type_class.new

    case @type
    when "Book" then @special = "Author"
    when "Movie" then @special = "Director"
    when "Album" then @special = "Artist"
    end

    render "form"
  end

  def create
    @item = type_class.new(type_params)

    if @item.save
      redirect_to polymorphic_path(@item)
    else
      render "form"
    end
  end

  def edit
    @item = type_class.find(params[:id])
    
    case @type
    when "Book" then @special = "Author"
    when "Movie" then @special = "Director"
    when "Album" then @special = "Artist"
    end

    render "form"
  end

  def update
    @item = type_class.find(params[:id])
    @item.attributes = type_params

    if @item.save
      redirect_to polymorphic_path(@item)
    else
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
    Medium.types.include?(params[:type]) ? params[:type] : "Medium"
  end

  def type_class
    type.constantize
  end

  def type_params
    params.require(type.downcase).permit(:name, :creator, :description)
  end
end
