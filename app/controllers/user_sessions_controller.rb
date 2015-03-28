class UserSessionsController < ApplicationController
  before_action :require_login, only: [:destroy]

  def new
    @user = User.new
  end

  def create
    if @user = login(login_params[:username], login_params[:password])
      redirect_back_or_to root_path, notice: 'Login successful'
    else
      render action: 'new', notice: 'Try Again'
    end
  end

  def destroy
    logout
    redirect_to root_path, notice: 'Logged out!'
  end

  private
  def login_params
    params.require(:login).permit(:username, :password)
  end
end
