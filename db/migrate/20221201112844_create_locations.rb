class CreateLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :locations do |t|
      t.string :title
      t.float :latitude
      t.float :longitude
    end
  end
end
