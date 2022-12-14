class CreateChargingSessions < ActiveRecord::Migration[7.0]
  def change
    create_table :charging_sessions do |t|
      t.integer :amount
      t.references :connector, null: false, foreign_key: true
      t.references :client, null: false, foreign_key: true
    end
  end
end
