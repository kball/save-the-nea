class CreateProjectDisciplines < ActiveRecord::Migration[5.0]
  def change
    create_table :project_disciplines do |t|
      t.string :name
      t.text :description
    end
    add_index :project_disciplines, :name
  end
end
