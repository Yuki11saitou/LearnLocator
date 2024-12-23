class User < ApplicationRecord
  authenticates_with_sorcery!

  # Google認証機能
  has_many :authentications, dependent: :destroy
  accepts_nested_attributes_for :authentications

  has_many :reviews, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :like_reviews, through: :likes, source: :review
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_spots, through: :bookmarks, source: :spot

  validates :password, presence: true, length: { minimum: 4 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :name, length: { maximum: 20 }, presence: true
  validates :email, presence: true, uniqueness: true
  validates :reset_password_token, uniqueness: true, allow_nil: true

  enum :role, { general: 0, admin: 1 }

  # Userモデルに対して CarrierWave のアップローダークラス（AvatarUploader）をマウント
  mount_uploader :avatar, AvatarUploader

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

  # Ransackの許可リスト（Userモデルの検索条件に使用するカラム名を設定）
  def self.ransackable_attributes(_auth_object = nil)
    %w[
      id name created_at updated_at
    ]
  end
end
