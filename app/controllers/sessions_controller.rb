class SessionsController < ApplicationController

  def new
  end

  def create
  end

  def destroy
    session.delete :user_id
    flash[:message] = "You are logged out"
    redirect_to root_path
  end
end
