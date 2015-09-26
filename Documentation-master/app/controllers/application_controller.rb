class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  before_action :require_login
  # before_action :activate_login
  # before_action :validate_login

  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_login
    redirect_to log_in_path unless current_user.present?
  end

  def admin_login
    redirect_to log_in_path unless current_user.role=="admin"
  end

  def validate_login
    redirect_to log_in_path unless current_user.status==true
  end

end
