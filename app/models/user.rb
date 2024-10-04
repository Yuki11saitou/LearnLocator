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
end
