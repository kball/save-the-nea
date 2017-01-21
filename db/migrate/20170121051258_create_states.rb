class CreateStates < ActiveRecord::Migration[5.0]
  def change
    create_table :states do |t|
      t.string :name
      t.string :abbrev

      t.timestamps
    end
    add_index :states, :abbrev
    add_index :states, :name
  end
end
