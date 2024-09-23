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

  def show
    @spot = Spot.find(params[:id])
  end

end