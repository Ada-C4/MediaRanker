class MoviesController < ApplicationController

  def get_movie
    id = params[:id]
    @movie = Movie.find(id)
  end

  def index
    @movies = Movie.all
    @movies_sort = @movies.sort_by{ |movie| movie[:rank] }.reverse
  end

  def show
    get_movie
  end

  def new
    @movie = Movie.new
    @title = "Add New Movie"
    @action = "create"
  end

  def create
    @movie = Movie.create(movie_params[:movie])
    @movie.update(:rank => 0)
    if @movie.save
      redirect_to "/movies"
    else
      render "/movies/new"
    end
  end

  def edit
    @movie = Movie.find(params[:id])
    @title = "Edit #{@movie.name}"
    @action = "update"
  end

  def upvote
    @movie = Movie.find(params[:id])
    @movie.increment!(:rank)
    # if params[:class] == "vote"
    #   get_movie
    #   @movie.update(:rank => @movie[:rank] + 1)
    # end
    redirect_to :back
  end

  def update
    @movie = Movie.update(params[:id], name: movie_params[:movie][:name], director: movie_params[:movie][:director], description: movie_params[:movie][:description])
    if @movie.save
      redirect_to "/movies/#{@movie.id}"
    else
      render :edit
    end
  end

  def destroy
    Movie.destroy(params[:id])
    redirect_to '/movies'
  end

  private

  def movie_params
    params.permit(movie:[:name, :director, :description, :rank])
  end
end
