class StaticPagesController < ApplicationController


  # todo: differenceについては、後ほど精査
  skip_before_action :require_login, only: %i[top difference terms_of_use privacy_policy]

  def top; end


  # todo: differenceについては、後ほど精査
  def difference; end

  def terms_of_use; end

  def privacy_policy; end
end