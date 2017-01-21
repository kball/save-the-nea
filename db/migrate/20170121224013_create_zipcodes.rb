class CreateZipcodes < ActiveRecord::Migration[5.0]
  def change
    create_table :zipcodes do |t|
      t.string :code
      t.integer :congressional_district_id
      t.integer :state_id
      t.timestamps
    end

    add_index :zipcodes, :code, unique: true
    add_index :zipcodes, [:state_id, :congressional_district_id]
    add_index :zipcodes, :congressional_district_id
  end
end
