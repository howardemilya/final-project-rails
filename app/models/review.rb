class Review < ApplicationRecord
  belongs_to :critic
  belongs_to :movie

  def self.most_movie_ids
    self.group(:movie_id).order('count_id DESC').limit(5).count(:id)
  end
  
end
