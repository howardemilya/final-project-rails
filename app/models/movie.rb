class Movie < ApplicationRecord
  has_many :reviews
  has_many :critics, through: :reviews
  has_many :actor_movies
  has_many :actors, through: :actor_movies
  has_many :genre_movies
  has_many :genres, through: :genre_movies
  accepts_nested_attributes_for :actors, reject_if: proc { |attributes| attributes['first_name'].blank? }

  def self.most_reviewed
    @movies = []
    Review.most_movie_ids.each do |k, v|
      @movies << self.find(k)
    end
    @movies
  end

  def average_star_rating
    Review.where(movie_id: self.id).average("star_rating").to_i
  end

  def self.best_rated
    self.joins(:reviews).order('star_rating DESC').limit(5)
  end


end
