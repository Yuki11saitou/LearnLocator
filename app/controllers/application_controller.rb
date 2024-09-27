class ApplicationController < ActionController::Base
  before_action :require_login

  private

  def not_authenticated
    redirect_to login_path, flash: { danger: t('alerts.require_login') }
  end
end
