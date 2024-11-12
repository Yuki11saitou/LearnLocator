require 'rails_helper'

RSpec.describe Review, type: :model do
  describe '.ransackable_attributes' do
    it '検索可能な関連の配列を返すこと' do
      expected_attributes = %w[id user_id spot_id body created_at updated_at]
      expect(Review.ransackable_attributes).to eq(expected_attributes)
    end
  end

  describe '.ransackable_associations' do
    it '検索可能な関連の配列を返すこと' do
      expected_associations = %w[user spot]
      expect(Review.ransackable_associations).to eq(expected_associations)
    end
  end
end