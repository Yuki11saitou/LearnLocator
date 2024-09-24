class Spot < ApplicationRecord
  geocoded_by :address

  belongs_to :category
  has_many :reviews, dependent: :destroy

  after_validation :geocode
  validates :name, :latitude, :longitude, :place_id, presence: true, uniqueness: true

  # Ransackの許可リスト（Spotモデルの検索条件に使用するカラム名を設定）
  def self.ransackable_attributes(_auth_object = nil)
    %w[
      id category_id name postal_code address phone_number opening_hours web_site
      rating latitude longitude place_id photo_reference created_at updated_at
    ]
  end

  # Ransackの許可リスト（Spotモデルの関連モデルの検索条件に使用するカラム名を設定）
  def self.ransackable_associations(_auth_object = nil)
    %w[address]
  end
end
