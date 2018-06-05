class Movie < ApplicationRecord
  has_many :reviews
  has_many :critics, through: :reviews
  has_many :actor_movies
  has_many :actors, through: :actor_movies
  has_many :genre_movies
  has_many :genres, through: :genre_movies
end
