class CreateOrganizationUsers < ActiveRecord::Migration
  def change
    create_table :organization_users do |t|

      t.timestamps
    end
  end
end
