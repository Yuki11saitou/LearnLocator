class Review < ApplicationRecord
  belongs_to :user
  belongs_to :spot
  has_many :likes, dependent: :destroy

  # todo : 後で精査
  # validates :body, presence: true, length: { maximum: 65_535 }
  validates :body, presence: true, length: { maximum: 300 }


  # todo: bookmark機能の実装時に有効化

  # def bookmark_by?(user)
  #   bookmarks.exists?(user_id: user.id)
  # end
end
