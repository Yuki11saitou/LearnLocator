class OauthsController < ApplicationController
  skip_before_action :require_login

  def oauth
    # 指定されたプロバイダの認証ページにユーザーをリダイレクトさせる
    login_at(auth_params[:provider])
  end

  def callback
    provider = auth_params[:provider]

    # Google認証がキャンセルされた場合やエラーが発生した場合のハンドリング
    if params[:error]
      redirect_to root_path, alert: t('alerts.auth.cancelled', provider: provider.titleize)
      return
    end

    # 既存のユーザーをプロバイダ情報を元に検索し、存在すればログイン
    if (@user = login_from(provider))
      redirect_to root_path, notice: t('notices.auth.login_success', provider: provider.titleize)
    else
      begin
        # ユーザーが存在しない場合はプロバイダ情報を元に新規ユーザーを作成し、ログイン
        signup_and_login(provider)
        redirect_to root_path, notice: t('notices.auth.user_registration_success', provider: provider.titleize)
      rescue StandardError => e
        # エラーメッセージのログ出力
        logger.error("Login failed: #{e.message}")
        redirect_to root_path, alert: t('alerts.auth.failure', provider: provider.titleize)
      end
    end
  end

  private

  def auth_params
    params.permit(:provider, :code, :scope, :authuser, :prompt)
  end

  def signup_and_login(provider)
    @user = create_from(provider)
    reset_session
    auto_login(@user)
  end
end
