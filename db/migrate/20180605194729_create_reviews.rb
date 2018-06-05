class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :movie_id
      t.integer :critic_id
      t.integer :star_rating
      t.text :content

      t.timestamps
    end
  end
end
