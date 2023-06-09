class Target < ApplicationRecord
  belongs_to :topic
  belongs_to :users
  validates :title, :radius, :lat, :lng, :topic_id,  presence: true
  validates :radius, numericality: { greater_than: 0 }
end
