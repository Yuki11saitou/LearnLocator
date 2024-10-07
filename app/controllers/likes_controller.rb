class LikesController < ApplicationController
  before_action :require_login, only: %i[create destroy]

  def create
    @review = Review.find(params[:review_id]) # reviewと紐づけるためにreview_idを取得
    current_user.like(@review)
  end

  def destroy
    @review = current_user.likes.find(params[:id]).review
    current_user.unlike(@review)
  end
end
