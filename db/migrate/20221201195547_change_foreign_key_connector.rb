class ChangeForeignKeyConnector < ActiveRecord::Migration[7.0]
  def change
    rename_column :connectors, :station_id, :charging_station_id
  end
end
