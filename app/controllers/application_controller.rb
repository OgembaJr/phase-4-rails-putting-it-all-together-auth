class ApplicationController < ActionController::API
  include ActionController::Cookies
  include ActionController::RequestForgeryProtection
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  
  def authenticate_user!
    unless user_signed_in?
      flash[:error] = "You need to sign in or sign up before continuing."
      redirect_to new_session_path
    end
  end
  
end
