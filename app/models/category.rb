class Category < ApplicationRecord
  has_many :spots, dependent: :destroy
  validates :name, presence: true, uniqueness: true
end
