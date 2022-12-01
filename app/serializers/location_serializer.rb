class LocationSerializer < ActiveModel::Serializer
  attributes :id, :title, :latitude, :longitude
  has_many :charging_stations, key: :stations
end
