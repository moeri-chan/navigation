class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by_name(params[:user_name])
    if user && user.authenticate(params[:user_password])
      session[:user_id] = user.id
      flash.alert = "Now signed in."
      redirect_to :back
    else
      flash.alert = "Invalid email or password"
      redirect_to :back
    end
  end
  
  def log_in_params
    params.require(:user_name)
    params.require(:user_password)
  end
end
