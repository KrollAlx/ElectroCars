class Connector < ApplicationRecord
  belongs_to :charging_station
  enum :state, [:free, :taken, :disabled]
  enum :connector_type, [:CHAdeMO, :CCS_Combo_2, :Type_2]
end
