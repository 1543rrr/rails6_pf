class Users::SessionsController < Devise::SessionsController
  
  def guest_sign_in
    user = User.guest
    if sign_in user
    redirect_to posts_path, notice: 'ゲストユーザーとしてログインしました。'
    else
      sign_out user
      redirect_to root_path, notice: 'ゲストユーザーとしてログアウトしました。'
    end
  end
end