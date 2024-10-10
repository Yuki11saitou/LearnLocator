class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :reviews, dependent: :destroy
  has_many :likes, dependent: :destroy


  # todo : マイページ作成の際に精査必要
  has_many :like_spots, through: :likes, source: :review
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_spots, through: :bookmarks, source: :spot

  validates :password, length: { minimum: 4 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :name, length: { maximum: 20 }, presence: true
  validates :email, presence: true, uniqueness: true

  enum :role, { general: 0, admin: 1 }

  # ユーザー自身かどうかを判定するメソッド
  def own?(object)
    id == object&.user_id
  end

  # いいね機能
  # レビューを「いいね」しているか確認するメソッド
  def like?(review)
    likes.exists?(review_id: review.id)
  end

  def like(review)
    likes.create(review: review) unless like?(review)
  end

  def unlike(review)
    likes.find_by(review: review)&.destroy
  end

  # ブックマーク機能
  # 施設をブックマークしているか確認するメソッド
  def bookmark?(spot)
    bookmarks.exists?(spot_id: spot.id)
  end

  def bookmark(spot)
    bookmarks.create(spot: spot) unless bookmark?(spot)
  end

  def unbookmark(spot)
    bookmarks.find_by(spot: spot)&.destroy
  end
end
