class RenameColumnNameToOrganiationAddress < ActiveRecord::Migration
  def change
  	rename_column :organization_addresses, :type, :address_type
  end
end
