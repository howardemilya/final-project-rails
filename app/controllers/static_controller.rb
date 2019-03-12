class StaticController < ApplicationController

  def home
  end

  def best_rated
    @movies = Movie.best_rated
  end


end
