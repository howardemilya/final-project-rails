class MoviesController < ApplicationController

  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @critic = Critic.find(session[:user_id])
    if logged_in? && @critic.admin
      @movie = Movie.new
    else
      redirect_to movies_path
    end
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to movie_path(@movie)
    else
      redirect_to "/movies/new"
    end
  end

  

  def edit
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :plot, :genre_ids => [], :actor_ids => [])
  end


end
