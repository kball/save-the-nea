class ModifyZipHandlingOfGrants < ActiveRecord::Migration[5.0]
  def change
    rename_column :grants, :zip, :full_zip
    add_column :grants, :zipcode_id, :integer
  end
end
