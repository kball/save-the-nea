class CreateCities < ActiveRecord::Migration[5.0]
  def change
    create_table :cities do |t|
      t.string :name
      t.string :state_id

      t.timestamps
    end
    add_index :cities, [:state_id, :name]
  end
end
