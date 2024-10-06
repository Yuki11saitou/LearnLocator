class Review < ApplicationRecord
  belongs_to :user
  belongs_to :spot
  has_many :likes, dependent: :destroy

  validates :body, presence: true, length: { maximum: 300 }
end
