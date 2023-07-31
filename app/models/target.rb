class Target < ApplicationRecord
  acts_as_mappable :lat_column_name => :lat,
                   :lng_column_name => :lng
  belongs_to :topic
  belongs_to :user
  has_many :matches, dependent: :destroy
  validates :title, :radius, :lat, :lng, :topic_id,  presence: true
  validates :radius, numericality: { greater_than: 0 }
  
  validate :validate_target_limit, on: :create

  private

  def validate_target_limit
    if user.targets.count >= 3
      errors.add(:base, "You have reached the maximum limit of targets.")
    end
  end
end
