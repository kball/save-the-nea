class CreateGrants < ActiveRecord::Migration[5.0]
  def change
    create_table :grants do |t|
      t.integer :year
      t.string :number
      t.string :grantee
      t.string :organization_popular_name
      t.string :sponsored_organization
      t.integer :city_id
      t.integer :state_id
      t.string :zip
      t.integer :congressional_district_id
      t.decimal :amount, :precision => 8, :scale => 2
      t.date :start_date
      t.date :end_date
      t.text :intended_outcome
      t.integer :category_id
      t.integer :nea_discipline_id
      t.integer :project_discipline_id
      t.text :project_description

      t.timestamps
    end
    add_index :grants, :number
    add_index :grants, [:zip, :year]
    add_index :grants, [:city_id, :year]
    add_index :grants, [:state_id, :year]
    add_index :grants, [:congressional_district_id, :year]
  end
end
