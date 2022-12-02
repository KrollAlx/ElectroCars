class ConnectorSerializer < ActiveModel::Serializer
  attributes :id, :state, :connector_type, :power
end
