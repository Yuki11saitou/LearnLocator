class SpotsController < ApplicationController
  skip_before_action :require_login

  def map
    @spots = Spot.all
  end

end