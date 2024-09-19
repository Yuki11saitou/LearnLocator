class SpotsController < ApplicationController
  skip_before_action :require_login

  def map
    @spots = Spot.includes(:category).all
  end

  def index
    # @q = Spot.ransack(params[:q])
    # @spots = @q.result(distinct: true).includes(:category).order(created_at: :desc).page(params[:page])
    @spots = Spot.includes(:category).all.page(params[:page])
  end

  def show
    @spot = Spot.find(params[:id])
  end

end