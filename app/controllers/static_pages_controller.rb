class StaticPagesController < ApplicationController


  # todo: differenceについては、後ほど精査
  skip_before_action :require_login, only: %i[top difference]

  def top; end


  # todo: differenceについては、後ほど精査
  def difference; end

end