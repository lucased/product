class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user, :admin?
  
  def admin?
    current_user.email == "admin@scc.com" if current_user
  end
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
end
