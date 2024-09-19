class Spot < ApplicationRecord
  belongs_to :category
  geocoded_by :address
  after_validation :geocode
  validates :name, :latitude, :longitude, :place_id, presence: true, uniqueness: true

  # ransackの許可リスト(Spotモデルの検索条件に使用するカラム名を設定)
  def self.ransackable_attributes(auth_object = nil)
    ["address", "category_id", "created_at", "id", "id_value", "latitude", "longitude", "name", "opening_hours", "phone_number", "photo_reference", "place_id", "postal_code", "rating", "updated_at", "web_site"]
  end

  # ransackの許可リスト(Spotモデルの関連モデルの検索条件に使用するカラム名を設定)
  def self.ransackable_associations(auth_object = nil)
    ["address"]
  end
end
