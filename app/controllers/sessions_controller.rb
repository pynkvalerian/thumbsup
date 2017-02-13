class SessionsController < ApplicationController
  def create
    begin
      @user = User.from_omniauth(request.env['omniauth.auth'])
      session[:user_id] = @user.id
      flash[:success] = "Welcome, #{@user.name}!"
      redirect_to new_thumbs_up_path
    rescue
      flash[:warning] = "There was an error while trying to authenticate you..."
      redirect_to sign_in_path
    end

  end

  def destroy
    session[:user_id] = nil
  end
end
