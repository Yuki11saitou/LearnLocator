class PasswordResetsController < ApplicationController
  skip_before_action :require_login

  def new; end

  def create
    @user = User.find_by(email: params[:email])
    @user&.deliver_reset_password_instructions! # 「存在しないメールアドレスです」という旨の文言を表示すると、逆に存在するメールアドレスを特定されてしまうため、あえて成功時のメッセージを送信させている
    redirect_to login_path, notice: t('notices.password_reset_mail_submit')
  end

  def edit
    @token = params[:id]
    @user = User.load_from_reset_password_token(@token)
    # @user が存在しない場合に not_authenticated メソッドを呼び出す
    not_authenticated if @user.blank?
  end

  def update
    @token = params[:id]
    @user = User.load_from_reset_password_token(@token)

    return not_authenticated if @user.blank?

    # パスワードとパスワード確認が空の場合、エラーメッセージを表示する（これがないと捕捉できない）
    if params[:user][:password].blank? || params[:user][:password_confirmation].blank?
      flash.now[:alert] = t('alerts.password_blank')
      render :edit, status: :unprocessable_entity
      return
    end

    @user.password_confirmation = params[:user][:password_confirmation]
    # password_confirmationとpasswordが一致していれば、パスワードを更新する
    if @user.change_password(params[:user][:password])
      redirect_to login_path, notice: t('notices.password_reset_success')
    else
      flash.now[:alert] = t('alerts.password_reset_failure')
      render :edit, status: :unprocessable_entity
    end
  end
end
