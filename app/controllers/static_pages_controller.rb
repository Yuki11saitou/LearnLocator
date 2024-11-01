class StaticPagesController < ApplicationController
  skip_before_action :require_login, only: %i[top terms_of_use privacy_policy]

  def top; end

  def terms_of_use; end

  def privacy_policy; end
end