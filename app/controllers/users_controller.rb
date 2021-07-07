class UsersController < ApplicationController
  before_action :authenticate_user!, only: :show
  def show
    @user = User.find(params[:id])
    @comment = @user.comments
    @posts = @user.posts
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if current_user.update(user_params)
    #   redirect_to user_path(current_user)
    # else
    current_user.save
    redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :nickname, :password, :password_confirmation)
  end
end
