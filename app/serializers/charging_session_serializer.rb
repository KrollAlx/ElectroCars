class ChargingSessionSerializer < ActiveModel::Serializer
  attributes :id, :amount, :state, :connector_id, :client_id
end
