class CreateConnectors < ActiveRecord::Migration[7.0]
  def change
    create_table :connectors do |t|
      t.integer :state
      t.integer :type
      t.references :station, null: false, foreign_key: { to_table: :charging_stations }
      t.integer :power
    end
  end
end
