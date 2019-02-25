class User < ApplicationRecord
  devise :database_authenticatable, :trackable, :omniauthable, omniauth_providers: [:google, :line, :yahoojp]

  has_many :question_boards

  def self.find_for_google(auth)
    user = User.find_by(provider: auth.provider, uid: auth.uid)

    return user if user
    User.create( email:    auth.info.email,
                 name:     auth.info.name,
                 provider: auth.provider,
                 uid:      auth.uid,
                 token:    auth.credentials.token,
                 password: Devise.friendly_token[0, 20],
                 meta:     auth.to_yaml)
  end

  def self.find_for_line(auth)
    user = User.find_by(provider: auth.provider, uid: auth.uid)

    return user if user
    User.create( email:    auth.info.email,
                 name:     auth.info.name,
                 provider: auth.provider,
                 uid:      auth.uid,
                 token:    auth.credentials.token,
                 password: Devise.friendly_token[0, 20],
                 meta:     auth.to_yaml)
  end

  def self.find_for_yahoojp(auth)
    user = User.find_by(provider: auth.provider, uid: auth.uid)

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
