class Target < ApplicationRecord
  belongs_to :topic
  validates :title, :radius, :lat, :lng, :topic_id,  presence: true
  validates :radius, numericality: { greater_than: 0 }
end
