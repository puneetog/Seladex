class RemoveOrganizationAdminToOrganizationManagement < ActiveRecord::Migration
  def change
    remove_column :organization_managements, :organization_admin_id, :integer
    add_column :organization_managements, :organization_user_id, :integer
  end
end
