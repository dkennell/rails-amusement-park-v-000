class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    session[:user_id] = @user.id
    redirect_to "/users/#{@user.id}"
  end

  def show
    if session[:user_id].nil?
      redirect_to root_path
    else
  	@user = User.find_by(id: params[:id])
    end
  end

  private

  def user_params
  	params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin)
  end

end