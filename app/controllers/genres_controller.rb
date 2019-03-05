class GenresController < ApplicationController

  def index
  end

  def show
    @genre = Genre.find(params[:id])
  end

  def new
    if current_user && current_user.admin
      @genre = Genre.new
    else
      redirect_to movies_path
    end
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to genres_path(@genre)
    else
      redirect_to new_genre_path
    end
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end


end
