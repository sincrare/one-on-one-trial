class User < ApplicationRecord
  devise :database_authenticatable, :trackable, :omniauthable, omniauth_providers: [:google, :line, :yahoojp]

  has_many :question_boards

  # 呼び出し元でまとめられそう
  def self.find_for_google(auth)
    find_for_omniauth!(auth)
  end

  def self.find_for_line(auth)
    find_for_omniauth!(auth)
  end

  def self.find_for_yahoojp(auth)
    find_for_omniauth!(auth)
  end

  private

  # find_for_omniauth!としておく
  def self.find_for_omniauth!(auth)

    # 検索と初期化を簡潔に書く
    User.find_or_create_by!(provider: auth.provider, uid: auth.uid) do |user|
      user.email =    auth.info.email
      user.name =     auth.info.name
      user.provider = auth.provider
      user.uid =     auth.uid
      user.token =   auth.credentials.token
      user.password = Devise.friendly_token[0, 20]
      user.meta  =   auth.to_yaml
    end
  end
end
