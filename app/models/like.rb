class Like < ApplicationRecord
  belongs_to :user, counter_cache: true
  belongs_to :review

  validates :user_id, uniqueness: { scope: :review_id }
end
