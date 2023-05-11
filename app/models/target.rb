class Target < ApplicationRecord
  belongs_to :topic
  validates :tittle, presence: true
  validates :radius, presence: true
  validates :lat, presence: true
  validates :lng, presence: true
  validates :topic_id, presence: true
end
