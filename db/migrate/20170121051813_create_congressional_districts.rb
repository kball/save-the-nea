class CreateCongressionalDistricts < ActiveRecord::Migration[5.0]
  def change
    create_table :congressional_districts do |t|
      t.integer :state_id
      t.integer :number
    end

    add_index :congressional_districts, [:state_id, :number]
  end
end
