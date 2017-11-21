module SessionsHelper

  def log_in(user)
    session[:user_id] = user.id
    flash[:message] = "You are signed in."
  end
end
