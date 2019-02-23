class Loggedin::ApplicationController < ApplicationController
  before_action :authenticate_loggedin

  def authenticate_loggedin
    redirect_to login_url unless user_signed_in?
  end
end