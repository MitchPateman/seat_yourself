class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id 
      flash[:notice] = "Successfully logged in!!"
      redirect_to restaurants_path
    else
      flash.now[:alert] = "Invalid email or password"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Successfully logged out!!"
    redirect_to restaurants_path
  end
end
