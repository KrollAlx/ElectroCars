class ChargingSession < ApplicationRecord
  has_one :connector
  belongs_to :client
end
