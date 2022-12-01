class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.string :phone_number
      t.string :first_name
      t.string :surname
      t.string :middle_name
    end
  end
end
