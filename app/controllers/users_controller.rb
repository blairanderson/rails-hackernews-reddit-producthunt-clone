class UsersController < ApplicationController
  before_action :require_login, only: [:edit, :update, :destroy]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def new
    # user registration page
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      auto_login(@user)
      redirect_to root_path, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  def show
    #   profile page
  end

  def edit
    #   profile edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to root_path, notice: 'User was successfully destroyed.'
  end

  private
  def set_user
    @user = User.where(username: params[:id]).first
    unless @user
      return redirect_back_or_to root_path, notice: 'could not find user'
    end
  end

  # Only allow a trusted parameter "white list" through.
  def user_params
    params.require(:user).permit(
      :username,
      :password,
      :password_confirmation,
      :about
    )
  end
end
