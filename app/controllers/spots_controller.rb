class SpotsController < ApplicationController
  skip_before_action :require_login

  def map; end
end