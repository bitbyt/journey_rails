class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 360 }

  MOODS = [ "happy", "neutral", "anxious", "sad", "lethargic" ]
end