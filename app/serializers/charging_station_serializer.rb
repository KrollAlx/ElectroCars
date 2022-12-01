class ChargingStationSerializer < ActiveModel::Serializer
  attributes :id, :serial_number
  # belongs_to :location
  has_many :connectors
end
