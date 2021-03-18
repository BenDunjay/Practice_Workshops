class ApplicationController < ActionController::API
  #   helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  protected

  def authenticate_user
    unless current_user
      redirect_to new_session_url, alert: "You need to sign in or sign up before continuing."
    end
  end
end
