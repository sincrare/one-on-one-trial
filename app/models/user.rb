class User < ApplicationRecord
  devise :trackable, :omniauthable, omniauth_providers: [:google]

  def self.find_for_google(auth)
    User.find_by(email: auth.info.email)

    return user if user
    User.create( email:    auth.info.email,
                 name:     auth.info.name,
                 provider: auth.provider,
                 uid:      auth.uid,
                 token:    auth.credentials.token,
                 password: Devise.friendly_token[0, 20],
                 meta:     auth.to_yaml)
  end
end
