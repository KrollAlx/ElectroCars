class ChargingSessionShowSerializer < ActiveModel::Serializer
  attributes :id, :amount, :state, :connector_id, :client_id,
             :client_phone_number, :client_first_name, :client_surname, :client_middle_name, :location

  def client_phone_number
    object.client.phone_number
  end

  def client_first_name
    object.client.first_name
  end

  def client_surname
    object.client.surname
  end

  def client_middle_name
    object.client.middle_name
  end

  def location
    object.connector.charging_station.location.title
  end
end
