class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #protect_from_forgery with: :null_session, only: Proc.new { |c| c.request.format.json? }
  helper_method :current_user, :logged_in?

  include SessionsHelper

  def logged_in?
    session[:user_id]
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
end
