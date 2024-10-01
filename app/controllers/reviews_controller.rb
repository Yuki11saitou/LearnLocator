class ReviewsController < ApplicationController
  # todo : 後で内容精査
  # before_action :require_login, only: %i[new create destroy bookmarks]
  before_action :require_login, only: %i[new create show]


  # todo : 必要かどうかから、後で内容精査
  def index; end

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
