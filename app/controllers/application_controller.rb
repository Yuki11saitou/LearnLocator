class ApplicationController < ActionController::Base
  before_action :require_login
  # 存在しないレビューを参照しようとした場合は、トップページにリダイレクト
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  private

  def not_authenticated
    redirect_to login_path, alert: t('alerts.require_login')
  end

  def record_not_found
    redirect_to root_path, alert: t('alerts.not_found')
  end
end
