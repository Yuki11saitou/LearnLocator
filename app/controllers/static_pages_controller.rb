class StaticPagesController < ApplicationController
  skip_before_action :require_login, only: %i[top difference]

  def top; end

  def difference; end

end