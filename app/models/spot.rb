class Spot < ApplicationRecord
  belongs_to :category
  geocoded_by :address
  after_validation :geocode
  validates :name, :latitude, :longitude, :place_id, presence: true, uniqueness: true
end
