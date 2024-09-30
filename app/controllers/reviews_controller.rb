class ReviewsController < ApplicationController
  # todo : 後で内容精査
  # before_action :require_login, only: %i[new create destroy bookmarks]
  before_action :require_login, only: %i[new]


  # todo : 必要かどうかから、後で内容精査
  def index; end


  # todo : 後で内容精査
  def new
    # @review = @spot.reviews.build
    @review = Review.new # こちらでもいいかも
    @spot = Spot.find(params[:spot_id])
  end


  # todo : 後で内容精査
  def create
    review = current_user.reviews.build(review_params)
    if review.save
      redirect_to spot_path(review.spot), notice: t('notices.review_creation_success')
    else
      # render spot_path(review.spot), alert: '口コミの投稿に失敗しました。' # ここはrender :newの方がいいかも
      flash.now[:alert] = t('alerts.review_creation_failure')
      render :new, status: :unprocessable_entity # xシェアするならそのままでもいいかも？
    end
  end


  # def destroy
  #   @review = current_user.reviews.find(params[:id])
  #   @spot = @comment.spot
  #   @reviews = @spot.reviews.includes(:user).order(created_at: :desc)
  #   @review.destroy!
  # end


  # def bookmarks
  #   @q = current_user.bookmark_boards.ransack(params[:q])
  #   @boards = @q.result(distinct: true).includes(:user).page(params[:page]).order(created_at: :desc)
  # end

  private

  def review_params
    params.require(:review).permit(:body).merge(spot_id: params[:spot_id])
  end

end
