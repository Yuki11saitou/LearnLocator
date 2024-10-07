class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :reviews, dependent: :destroy
  has_many :likes, dependent: :destroy

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

  # レビューに「いいね」を付けるメソッド
  def like(review)
    likes.create(review: review) unless like?(review)
  end

  # レビューの「いいね」を外すメソッド
  def unlike(review)
    likes.find_by(review: review)&.destroy
  end


  # todo : 後でbookmark機能実装時に内容精査
  # def bookmark(board)
  #   bookmark_boards << board
  # end

  # def unbookmark(board)
  #   bookmark_boards.destroy(board)
  # end

  # def bookmark?(board)
  #   bookmark_boards.include?(board)
  # end
end
