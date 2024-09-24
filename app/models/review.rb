class Review < ApplicationRecord
  belongs_to :user
  belongs_to :spot

  validates :body, presence: true, length: { maximum: 65_535 }


  # todo: bookmark機能の実装時に有効化

  # def bookmark_by?(user)
  #   bookmarks.exists?(user_id: user.id)
  # end
end
