class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.reset_password_email.subject
  #
  # def reset_password_email
  #   @greeting = "Hi"

  #   mail to: "to@example.org"
  # end

  # メールの送信元アドレス
  default from: ENV['GMAIL_USERNAME']

  # Sorceryのパスワードリセット機能では、デフォルトで reset_password_email という名前のメソッドを使用する
  def reset_password_email(user)
    @user = User.find(user.id)
    @url  = edit_password_reset_url(@user.reset_password_token)
    mail(to: user.email, subject: t('password_reset_mail.subject'), content_type: "text/html")
  end
end
