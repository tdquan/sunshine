class SolarPanel < ActiveRecord::Base
  # Prosumer
  belongs_to :user
  has_many :contracts

  validates :price, presence: true
  validates :size, presence: true
  validates :address, presence: true
  validates_uniqueness_of :user_id

  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
