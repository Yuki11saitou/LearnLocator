require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザー登録できるとき' do
      it 'すべての値が正しく入力されている場合' do
        expect(@user).to be_valid
      end
    end

    context 'ユーザー登録できないとき(空欄)' do
      it 'ユーザー名が空欄' do
        @user.name = ''
        expect(@user).to be_invalid
        expect(@user.errors[:name]).to include("を入力してください")
      end

      it 'メールアドレスが空欄' do
        @user.email = ''
        expect(@user).to be_invalid
        expect(@user.errors[:email]).to include("を入力してください")
      end

      it 'パスワードが空欄' do
        @user.password = ''
        expect(@user).to be_invalid
        expect(@user.errors[:password]).to include("を入力してください")
      end

      it 'パスワード(確認用)が空欄' do
        @user.password_confirmation = ''
        expect(@user).to be_invalid
        expect(@user.errors[:password_confirmation]).to include("を入力してください")
      end
    end

    context 'ユーザー登録できないとき(その他)' do
      it 'メールアドレスがすでに存在している' do
        FactoryBot.create(:user, email: @user.email)
        expect(@user).to be_invalid
        expect(@user.errors[:email]).to include("はすでに存在します")
      end

      it 'パスワードの長さが4文字未満' do
        @user.password = '123'
        expect(@user).to be_invalid
        expect(@user.errors[:password]).to include("は4文字以上で入力してください")
      end

      it 'パスワードとパスワード(確認用)が一致しない' do
        @user.password_confirmation = 'differentpassword'
        expect(@user).to be_invalid
        expect(@user.errors[:password_confirmation]).to include("がパスワードと一致しません")
      end
    end
  end

  describe '#own?' do
    it 'オブジェクトがユーザーに属する場合、own?メソッドがtrueを返すこと' do
      object = double('object', user_id: @user.id)
      expect(@user.own?(object)).to be true
    end
  end

  describe '#like?' do
    it 'ユーザーが口コミにいいねをした場合、like?メソッドがtrueを返すこと' do
      @review = FactoryBot.create(:review)
      @user = FactoryBot.create(:user)
      @user.like(@review)
      expect(@user.like?(@review)).to be true
    end
  end

  describe '#unlike' do
    it 'ユーザーがいいねを解除した場合、like?メソッドがfalseを返すこと' do
      @review = FactoryBot.create(:review)
      @user = FactoryBot.create(:user)
      @user.unlike(@review)
      expect(@user.like?(@review)).to be false
    end
  end

  describe '#bookmark?' do
    it 'ユーザーがスポットをブックマークしている場合、bookmark?メソッドがtrueを返すこと' do
      @user = FactoryBot.create(:user)
      @spot = FactoryBot.create(:spot)
      @user.bookmark(@spot)
      expect(@user.bookmark?(@spot)).to be true
    end

    it 'ユーザーがスポットをブックマークしていない場合、bookmark?メソッドがfalseを返すこと' do
      @user = FactoryBot.create(:user)
      @spot = FactoryBot.create(:spot)
      expect(@user.bookmark?(@spot)).to be false
    end
  end

  describe '#bookmark' do
    it 'ユーザーがスポットをブックマークすると、bookmark?メソッドがtrueを返すこと' do
      @user = FactoryBot.create(:user)
      @spot = FactoryBot.create(:spot)
      @user.bookmark(@spot)
      expect(@user.bookmark?(@spot)).to be true
    end
  end

  describe '#unbookmark' do
    it 'ユーザーがブックマークを解除すると、bookmark?メソッドがfalseを返すこと' do
      @user = FactoryBot.create(:user)
      @spot = FactoryBot.create(:spot)
      @user.bookmark(@spot)
      @user.unbookmark(@spot)
      expect(@user.bookmark?(@spot)).to be false
    end
  end

  describe '.ransackable_attributes' do
    it '検索可能な属性の配列を返すこと' do
      expected_attributes = %w[id name created_at updated_at]
      expect(User.ransackable_attributes).to eq(expected_attributes)
    end
  end
end