class CreateOrganizationManagements < ActiveRecord::Migration
  def change
    create_table :organization_managements do |t|
      t.integer :organization_admin_id
      t.integer :organization_id
      t.timestamps
    end
  end
end
