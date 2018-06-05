class CreateGenreMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :genre_movies do |t|
      t.integer :genre_id
      t.integer :movie_id

      t.timestamps
    end
  end
end
