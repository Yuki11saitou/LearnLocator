class BookmarksController < ApplicationController
  before_action :require_login, only: %i[create destroy]

  def create
    @spot = Spot.find(params[:spot_id]) # spotと紐づけるためにspot_idを取得
    current_user.bookmark(@spot)
  end

  def destroy
    @spot = current_user.bookmarks.find(params[:id]).spot
    current_user.unbookmark(@spot)
  end
end
