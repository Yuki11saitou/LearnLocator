class ProfilesController < ApplicationController
  before_action :set_user, only: %i[show edit update my_reviews my_likes]

  def show
    @total_my_reviews = @user.reviews.count
    @total_my_likes = @user.like_reviews.count

    # Spotに紐づくCategoryも含める
    @my_reviews = @user.reviews.includes(spot: :category).order(created_at: :desc).page(params[:page])
    @my_likes = @user.like_reviews.includes(spot: :category).order(created_at: :desc).page(params[:page])
  end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to profile_path, notice: t('notices.profile_update_success')
    else
      flash.now[:alert] = t('alerts.profile_update_failure')
      render :edit, status: :unprocessable_entity
    end
  end

  def my_reviews
    @my_reviews = @user.reviews.includes(spot: :category).order(created_at: :desc).page(params[:page]).per(5)
  end

  def my_likes
    @my_likes = @user.like_reviews.includes(spot: :category).order(created_at: :desc).page(params[:page]).per(5)
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def user_params
    params.require(:user).permit(:name, :email, :avatar, :avatar_cache)
  end
end
