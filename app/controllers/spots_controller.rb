class SpotsController < ApplicationController
  skip_before_action :require_login

  def map
    @spots = Spot.includes(:category).all
  end

  def index
    @q = Spot.ransack(params[:q])

    # 並べ替えが"rating"の場合のみ、ratingがnilのレコードを除外する
    if params[:q] && params[:q][:s] && params[:q][:s].include?('rating')
      @spots = @q.result(distinct: true).includes(:category).where.not(rating: nil).order(created_at: :desc).page(params[:page])
    else
      @spots = @q.result(distinct: true).includes(:category).order(created_at: :desc).page(params[:page])
    end

    # ソート機能のため、カテゴリを取得(現状、カテゴリID:1(自習室), 2(コワーキング)のみ)
    @categories = Category.where(id: [1, 2])
  end

  # todo : 後で内容精査
  def show
    @spot = Spot.find(params[:id])
    # @review = Review.new # 口コミ投稿フォーム用なので、ここでは多分不要
    @reviews = @spot.reviews.includes(:user).order(created_at: :desc).page(params[:page]).per(3)
  end


  # # todo : 後でbookmark機能実装時に内容精査
  # private

  # def bookmarks
  #   @q = current_user.bookmark_spots.ransack(params[:q])
  #   @spots = @q.result(distinct: true).includes(:user).order(created_at: :desc).page(params[:page])
  # end
end