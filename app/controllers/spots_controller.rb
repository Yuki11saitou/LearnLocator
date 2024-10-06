class SpotsController < ApplicationController
  skip_before_action :require_login

  def map
    @spots = Spot.includes(:category, :reviews).all
  end

  def index
    # 口コミ数でのソートを考慮し、LEFT JOIN でレビュー数を取得しておく
    @q = Spot.left_joins(:reviews).select('spots.*, COUNT(reviews.id) AS reviews_count').group('spots.id').ransack(params[:q])

    if params.dig(:q, :s)&.include?('reviews_count')
      # 口コミ数で並べ替える場合
      @spots = @q.result(distinct: true)
                .includes(:category, :reviews)
                .order("reviews_count #{params.dig(:q, :s).split.last.upcase}") # ここで reviews_count を明示的に並べ替え
                .page(params[:page])
    elsif params.dig(:q, :s)&.include?('rating')
      # 評価順で並べ替える場合
      @spots = @q.result(distinct: true)
                .includes(:category, :reviews)
                .where.not(rating: nil)
                .order(created_at: :desc)
                .page(params[:page])
    else
      # 並べ替えリンクを使用しない場合
      @spots = @q.result(distinct: true)
                .includes(:category, :reviews)
                .order(created_at: :desc)
                .page(params[:page])
    end

    # ソート機能のため、カテゴリを取得(自習室とコワーキングのみ)
    @categories = Category.where(id: [1, 2])
  end

  def show
    @spot = Spot.find(params[:id])
    @reviews = @spot.reviews.includes(:user).order(created_at: :desc).page(params[:page]).per(3)
  end


  # # todo : 後でbookmark機能実装時に内容精査
  # private

  # def bookmarks
  #   @q = current_user.bookmark_spots.ransack(params[:q])
  #   @spots = @q.result(distinct: true).includes(:user).order(created_at: :desc).page(params[:page])
  # end
end