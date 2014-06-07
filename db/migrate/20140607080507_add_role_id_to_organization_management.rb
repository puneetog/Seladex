class AddRoleIdToOrganizationManagement < ActiveRecord::Migration
  def change
    add_column :organization_managements, :role_id, :integer
  end
end
