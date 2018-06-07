class Actor < ApplicationRecord
  has_many :actor_movies
  has_many :movies, through: :actor_movies

  def name
    self.first_name + " " + self.last_name
  end
end
