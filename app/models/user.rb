class User < ApplicationRecord
  devise :database_authenticatable, :trackable, :omniauthable, omniauth_providers: [:google, :line, :yahoojp]

  has_many :question_boards

  def self.find_for_omniauth!(auth)
    User.find_or_create_by!(provider: auth.provider, uid: auth.uid) do |user|
      user.email    = auth.info.email
      user.name     = auth.info.name
      user.provider = auth.provider
      user.uid      = auth.uid
      user.token    = auth.credentials.token
      user.password = Devise.friendly_token[0, 20]
      user.meta     = auth.to_yaml
    end
  end
end
