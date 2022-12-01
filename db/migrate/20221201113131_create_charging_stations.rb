class CreateChargingStations < ActiveRecord::Migration[7.0]
  def change
    create_table :charging_stations do |t|
      t.string :serial_number
      t.references :location, null: false, foreign_key: true
    end
  end
end
