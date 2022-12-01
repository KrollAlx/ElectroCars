class ConnectorSerializer < ActiveModel::Serializer
  attributes :id, :state, :connector_type, :power
  belongs_to :charging_station
end
