# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google
    omniauth!('Google')
  end

  def line
    omniauth!('LINE')
  end

  def yahoojp
    omniauth!('YAHOO ID')
  end

  private

  def omniauth!(provider_name)
    @user = User.find_for_omniauth!(request.env['omniauth.auth'])

    if @user.persisted?
      flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: provider_name
      sign_in_and_redirect @user, event: :authentication
    else
      redirect_to new_user_registration_url
    end
  end
end
