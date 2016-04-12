class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  helper_method :current_admin

  def current_admin 
    @admin_user ||= Admin.find(session[:admin_id]) if session[:admin_id] 
  end
  
  def require_admin
    redirect_to '/login' unless current_admin
  end
end
