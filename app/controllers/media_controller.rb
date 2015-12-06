class MediaController < ApplicationController
  before_action only: [:show, :edit, :update, :destroy, :upvote] { @medium = Medium.find(params[:id]) }
  before_action :set_type

  def index
    @media = type_class.all
    @type = params[:type]
  end

  def show
  end

  def new
    @medium = type_class.new
    @type = @medium.type
  end

  def create
    @medium = Medium.new(medium_params)
      if @medium.save
        redirect_to @medium
      else
        render action: 'new'
      end
  end

  def edit
    @type = @medium.type
  end

  def update
    if @medium.update(medium_params)
      redirect_to @medium
    else
      redirect_to media_path(@medium.type, @medium, :edit)
    end
  end

  def destroy
    type = @medium.type
    @medium.destroy
    if type == "Movie"
      redirect_to movies_path
    elsif type == "Book"
      redirect_to books_path
    elsif type == "Album"
      redirect_to albums_path
    else
      redirect_to root
    end
  end

  def upvote
    current_score = @medium.upvotes
    if current_score.nil?
      new_score = 1
    else
      new_score = current_score + 1
    end
    @medium.update(
    upvotes: new_score
    )
    redirect_to @medium
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

  def medium_params
    params.require(type.underscore.to_sym).permit(:name, :type, :creator, :description, :upvotes)
  end

end
