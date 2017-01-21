class AddSlugToStates < ActiveRecord::Migration[5.0]
  def change
    add_column :states, :slug, :string
    add_index :states, :slug, unique: true
  end
end
