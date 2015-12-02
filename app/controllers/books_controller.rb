class BooksController < ApplicationController
  def index
    @items = Medium.where(kind: "book").order(votes: :desc)
    @type = "book"

    render "index"
  end

  def show
    @item = Medium.find(params[:id])
    @type = "Books"
    @special = "Written"


    render "show"
  end

  def upvote
    Medium.find(params[:id]).increment!(:votes)

    redirect_to :back
  end

  def new
    @item = Medium.new(kind: "book")
    @special = "Author"
    @url = polymorphic_path([@item.kind, @item, :index])

    render "form"
  end

  def create
    @item = Medium.new(book_params)
    @item.kind = "book"

    if @item.save
      redirect_to book_medium_path(@item)
    else
      render "form"
    end
  end

  def edit
    @item = Medium.find(params[:id])
    @special = "Author"
    @url = polymorphic_path([@item.kind, @item])

    render "form"
  end

  def update
    @item = Medium.find(params[:id])
    @item.attributes = book_params

    if @item.save
      redirect_to book_medium_path(@item)
    else
      render "form"
    end
  end

  def destroy
    item = Medium.find(params[:id])
    Medium.destroy(item.id)

    redirect_to book_medium_index_path
  end

  private

  def book_params
    params.require(:medium).permit(:name, :creator, :description)
  end
end
