class ChargingSession < ApplicationRecord
  belongs_to :connector
  belongs_to :client
  enum :state, [:active, :stopped]
end
