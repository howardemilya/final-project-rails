class CreateCritics < ActiveRecord::Migration[5.2]
  def change
    create_table :critics do |t|
      t.string :name
      t.string :password_digest
      t.string :email
      t.boolean :admin, default: false

      t.timestamps
    end
  end
end
