class AddOrganizationAdminToOrganization < ActiveRecord::Migration
  def change
  	add_column :organizations, :organization_admin_id, :integer
  end
end
