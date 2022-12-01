class ChargingStation < ApplicationRecord
  belongs_to :location
  has_many :connectors
end
