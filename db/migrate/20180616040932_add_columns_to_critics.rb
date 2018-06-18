class AddColumnsToCritics < ActiveRecord::Migration[5.2]
  def change
    add_column :critics, :provider, :string
    add_column :critics, :uid, :string
    add_column :critics, :oauth_token, :string
    add_column :critics, :oauth_expires_at, :datetime
  end
end
