class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #before_filter :validate_params #TODO: useful refactoring
  helper_method :current_user
  
  private
  
  def current_user
    @current_user ||= Business.find(session[:business_id]) if session[:business_id]
  end 
end