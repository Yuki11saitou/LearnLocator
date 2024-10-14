class Review < ApplicationRecord
  belongs_to :user
  belongs_to :spot
  has_many :likes, dependent: :destroy

  validates :body, presence: true, length: { maximum: 300 }

  # Ransackの許可リスト（Reviewモデルの検索条件に使用するカラム名を設定）
  def self.ransackable_attributes(_auth_object = nil)
    %w[
      id user_id spot_id body created_at updated_at
    ]
  end

  # Ransackの許可リスト（Reviewモデルの関連モデルの検索条件に使用するカラム名を設定）
  def self.ransackable_associations(_auth_object = nil)
    %w[
      user spot
    ]
  end
end
