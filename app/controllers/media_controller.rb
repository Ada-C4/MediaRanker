class MediaController < ApplicationController
  before_action only: [:show, :edit, :update, :destroy, :vote] { @medium = Medium.find(params[:id]) }
  before_action only: [:edit, :destroy, :vote] { @type = @medium.type.pluralize }

  def index
    @media = Medium.where("type = '#{params[:type]}'")
    @type = Medium.find(1).type
  end

  def show
  end

  def new
    @medium = params[:type].constantize.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def upvote
  end

end
