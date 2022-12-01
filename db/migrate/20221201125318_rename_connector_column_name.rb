class RenameConnectorColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :connectors, :type, :connector_type
  end
end
