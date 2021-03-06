class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authorize_user
  helper_method :current_user

  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authorize_user
    redirect_to login_path unless current_user
  end
end
