class Movie < ApplicationRecord
  has_many :reviews
  has_many :critics, through: :reviews
  has_many :actor_movies
  has_many :actors, through: :actor_movies
  has_many :genre_movies
  has_many :genres, through: :genre_movies
  accepts_nested_attributes_for :actors

  def actors_attributes=(actors_attributes)
   actors_attributes.each do |i, actor|
     self.actors.build(actor)
   end
 end
end
