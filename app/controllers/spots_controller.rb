class SpotsController < ApplicationController
  skip_before_action :require_login

  def map
    @spots = Spot.all
  end

  def index
    @spots = Spot.all.order(created_at: :desc).page(params[:page])
  end

  def show
    @spot = Spot.find(params[:id])
  end

end