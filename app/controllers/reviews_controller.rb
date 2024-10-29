class ReviewsController < ApplicationController
  skip_before_action :require_login, only: %i[index show auto_search]
  before_action :set_review, only: %i[edit update destroy]

  def index
    # すべてのレビューを対象に、SpotやCategoryを含めつつ、レビューの「いいね」数もカウント
    @q = Review.left_joins(:likes)
               .select('reviews.*, COUNT(likes.id) AS likes_count') # いいね数をカウント
               .group('reviews.id')
               .ransack(params[:q])

    @reviews = if params.dig(:q, :s)&.include?('likes_count')
                 # いいね数で並べ替える場合
                 @q.result
                   .includes(:user, spot: :category)
                   .order("likes_count #{params.dig(:q, :s).split.last.upcase}") # likes_countを並べ替え
                   .page(params[:page]).per(5)
               else
                 # デフォルトは作成日順
                 @q.result
                   .includes(:user, spot: :category)
                   .order(created_at: :desc)
                   .page(params[:page]).per(5)
               end
  end

  def new
    @review = Review.new
    @spot = Spot.find(params[:spot_id])
  end

  def create
    @review = current_user.reviews.build(review_params)
    @spot = @review.spot
    if @review.save
      redirect_to review_path(@review), notice: t('notices.review_creation_success')
    else
      flash.now[:alert] = t('alerts.review_creation_failure')
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @review = Review.find(params[:id])
    @spot = @review.spot
  end

  def edit
    @spot = @review.spot
  end

  def update
    @spot = @review.spot
    if @review.update(review_params)
      redirect_to review_path(@review), notice: t('notices.review_update_success')
    else
      flash.now[:alert] = t('alerts.review_update_failure')
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @spot = @review.spot # 口コミ数をturboでリアルタイム更新するために使用
    @review.destroy!
  end

  private

  def set_review
    @review = current_user.reviews.find(params[:id])
  end

  def review_params
    if params[:action] == 'update'
      params.require(:review).permit(:body, :spot_id)
    else
      params.require(:review).permit(:body).merge(spot_id: params[:spot_id])
    end
  end

  # オートコンプリート機能
  def auto_search
    @spots = Spot.where("name ILIKE ?", "%#{params[:q]}%")
    respond_to do |format|
      format.js
    end
  end
end
