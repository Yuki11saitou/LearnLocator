require 'rails_helper'

RSpec.describe UserMailer, type: :mailer do
  describe '#reset_password_email' do
    let(:user) { FactoryBot.create(:user, reset_password_token: 'fake_token') }
    let(:mail) { UserMailer.reset_password_email(user) }

    it '送信元アドレスが正しく設定されていること' do
      expect(mail.from).to eq([ENV.fetch('GMAIL_USERNAME', 'default@example.com')])
    end

    it '送信先アドレスが正しく設定されていること' do
      expect(mail.to).to eq([user.email])
    end

    it '件名が正しく設定されていること' do
      expect(mail.subject).to eq(I18n.t('password_reset_mail.subject'))
    end
  end
end