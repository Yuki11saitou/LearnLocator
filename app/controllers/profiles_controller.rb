class ProfilesController < ApplicationController
  before_action :set_user, only: %i[show edit update my_reviews my_likes]

  def show
    @total_my_reviews = @user.reviews.count
    @total_my_likes = @user.like_reviews.count
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
    # SpotやCategoryを含めつつ、レビューの「いいね」数もカウントする
    @q = @user.reviews
              .left_joins(:likes)
              .select('reviews.*, COUNT(likes.id) AS likes_count') # いいね数をカウント
              .group('reviews.id')
              .ransack(params[:q])

    @my_reviews = if params.dig(:q, :s)&.include?('likes_count')
                    # いいね数で並べ替える場合
                    @q.result
                      .includes(spot: :category)
                      .order("likes_count #{params.dig(:q, :s).split.last.upcase}") # likes_countを並べ替え
                      .page(params[:page]).per(5)
                  else
                    # デフォルトは作成日順
                    @q.result
                      .includes(spot: :category)
                      .order(created_at: :desc)
                      .page(params[:page]).per(5)
                  end
  end

  def my_likes
    # SpotやCategoryを含めつつ、レビューの「いいね」数もカウントする
    @q = @user.like_reviews
              .left_joins(:likes)
              .select('reviews.*, COUNT(likes.id) AS likes_count') # いいね数をカウント
              .group('reviews.id')
              .ransack(params[:q])

    @my_likes = if params.dig(:q, :s)&.include?('likes_count')
                  # いいね数で並べ替える場合
                  @q.result
                    .includes(spot: :category)
                    .order("likes_count #{params.dig(:q, :s).split.last.upcase}") # likes_countを並べ替え
                    .page(params[:page]).per(5)
                else
                  # デフォルトは作成日順
                  @q.result
                    .includes(spot: :category)
                    .order(created_at: :desc)
                    .page(params[:page]).per(5)
                end
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def user_params
    params.require(:user).permit(:name, :email, :avatar, :avatar_cache)
  end
end
