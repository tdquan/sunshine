class SolarPanel < ActiveRecord::Base
  # Prosumer
  belongs_to :user

  validates :price, presence: true
  validates :size, presence: true
  validates_uniqueness_of :user_id

end
