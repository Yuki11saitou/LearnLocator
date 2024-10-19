class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      auto_login(@user)
      redirect_to root_path, notice: t('notices.user_registration_success')
    else
      flash.now[:alert] = t('alerts.user_registration_failure')
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :avatar, :avatar_cache, :password, :password_confirmation)
  end
end
