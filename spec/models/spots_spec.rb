require 'rails_helper'

RSpec.describe Spot, type: :model do
  describe '.ransackable_attributes' do
    it '検索可能な属性の配列を返すこと' do
      expected_attributes = %w[
        id category_id name postal_code address phone_number opening_hours web_site
        rating latitude longitude place_id photo_reference created_at updated_at
      ]
      expect(Spot.ransackable_attributes).to eq(expected_attributes)
    end
  end

  describe '.ransackable_associations' do
    it '検索可能な関連の配列を返すこと' do
      expected_associations = %w[address]
      expect(Spot.ransackable_associations).to eq(expected_associations)
    end
  end
end