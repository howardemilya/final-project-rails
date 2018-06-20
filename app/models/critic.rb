class Critic < ApplicationRecord
  has_secure_password
  has_many :reviews
  has_many :movies, through: :reviews

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |critic|
      critic.provider = auth.provider
      critic.uid = auth.uid
      critic.name = auth.info.name
      critic.oauth_token = auth.credentials.token
      critic.oauth_expires_at = Time.at(auth.credentials.expires_at)
      critic.password = "password"
      critic.save!
    end
  end
end
