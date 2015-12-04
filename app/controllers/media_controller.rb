class MediaController < ApplicationController
  before_action only: [:show, :edit, :update, :destroy, :vote] { @medium = Medium.find(params[:id]) }
  before_action :set_type

  def index
    @media = type_class.all
    @type = Medium.find(1).type
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
        render :new
      end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def upvote
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
    params.permit(medium:[:name, :type, :creator, :description, :upvotes])
  end

end
