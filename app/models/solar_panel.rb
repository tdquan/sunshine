class SolarPanel < ActiveRecord::Base
  # Prosumer
  belongs_to :user
  has_many :contracts
end
