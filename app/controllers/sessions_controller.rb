class SessionsController < ApplicationController

  def new
  end

  def create
    if auth_hash = request.env['omniauth.auth']
      user = User.find_or_create_by_omniauth(auth_hash)
      log_in user
      flash[:message] = "You are signed in."
      redirect_to root_path
    else

    user = User.find_by(username: params[:username].downcase)

      if user && user.authenticate(params[:password])
        log_in user
        flash[:message] = "You are signed in."
        redirect_to root_path
      else
        flash[:alert] = "Please check login info, and try again"
        render :new
      end
    end
  end

  def destroy
    session.delete :user_id
    flash[:message] = "You are logged out"
    redirect_to root_path
  end
end
