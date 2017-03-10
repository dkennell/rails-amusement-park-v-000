class SessionsController < ApplicationController
  
  def new
  	@user = User.new
  end

  def create
   	@user = User.find_by(name: params[:user][:name])
    session[:user_id] = @user.id
   	redirect_to "/users/#{@user.id}"
  end

  def destroy
    session.clear
    redirect_to root_path
  end
  
end
