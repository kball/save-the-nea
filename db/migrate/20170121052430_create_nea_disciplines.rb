class CreateNeaDisciplines < ActiveRecord::Migration[5.0]
  def change
    create_table :nea_disciplines do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
    add_index :nea_disciplines, :name
  end
end
