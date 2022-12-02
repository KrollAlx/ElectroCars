class AddStateToChargingSession < ActiveRecord::Migration[7.0]
  def change
    add_column :charging_sessions, :state, :integer
  end
end
