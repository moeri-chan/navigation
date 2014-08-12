class SessionsController < ApplicationController
  def create
    user = User.where(name: params[:user_name]).first
    if user && user.authenticate(params[:user_password])
      session[:user_id] = user.id
      flash.alert = "Now signed in"
      redirect_to :back
    else
      flash.alert = "Invalid email or password"
      redirect_to :back
    end
  end

  def destroy
    session[:user_id] = nil
    flash.alert = "Now signed out"
    redirect_to :back
  end
end
