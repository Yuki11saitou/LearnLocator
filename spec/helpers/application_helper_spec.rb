require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe '#flash_background_color' do
    it 'noticeの場合、正しい背景色を返すこと' do
      expect(helper.flash_background_color(:notice)).to eq('bg-green-500')
    end

    it 'alertの場合、正しい背景色を返すこと' do
      expect(helper.flash_background_color(:alert)).to eq('bg-red-500')
    end

    it 'errorの場合、正しい背景色を返すこと' do
      expect(helper.flash_background_color(:error)).to eq('bg-yellow-500')
    end

    it '未知のタイプの場合、デフォルトの背景色を返すこと' do
      expect(helper.flash_background_color(:unknown)).to eq('bg-gray-500')
    end
  end

  describe '#page_title' do
    it 'タイトルが指定されている場合、フルタイトルを返すこと' do
      expect(helper.page_title('Home')).to eq('Home | LearnLocator')
    end

    it 'タイトルが指定されていない場合、基本タイトルのみを返すこと' do
      expect(helper.page_title).to eq('LearnLocator')
    end
  end
end